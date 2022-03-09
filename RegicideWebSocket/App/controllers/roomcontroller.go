package controllers

import (
	"Regicide/App/tserver"
	server "Regicide/App/tserver"
	GameProto "Regicide/GameProto"
	"errors"
	"strconv"

	"github.com/wonderivan/logger"
)

func InitRoomController() {
	controller := server.InstanceController("Room", GameProto.RequestCode_Room)
	controller.Funcs = map[string]interface{}{}
	controller.Funcs, _ = controller.AddFunction("JoinRoom", JoinRoom)
	controller.Funcs, _ = controller.AddFunction("Chat", Chat)
	controller.Funcs, _ = controller.AddFunction("FindRoom", FindRoom)
	controller.Funcs, _ = controller.AddFunction("StartGame", StartGame)
	controller.Funcs, _ = controller.AddFunction("CreateRoom", CreateRoom)
	controller.Funcs, _ = controller.AddFunction("Exit", ExitRoom)
	server.RegisterController(GameProto.RequestCode_Room, controller)
}

func Chat(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nill")
	}
	if client.RoomInfo == nil {
		return nil, errors.New("client roomInfo is nill")
	}
	mainpack.User = client.Username

	mainpack.Returncode = GameProto.ReturnCode_Success
	client.RoomInfo.BroadcastTCP(client, mainpack)
	return nil, nil
}

func CreateRoom(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}
	server.RoomID++

	roompack := &GameProto.RoomPack{}
	roompack.Roomname = mainpack.Roompack[0].Roomname
	roompack.Maxnum = mainpack.Roompack[0].Maxnum
	roompack.RoomID = server.RoomID

	room := tserver.InstanceRoom(roompack)
	tserver.RoomList = append(tserver.RoomList, &room)
	mainpack.Returncode = GameProto.ReturnCode_Success
	room.RoomPack.RoomID = server.RoomID
	room.RoomPack.State = 0
	room.Join(client)

	mainpack.Roompack[0] = room.RoomPack //(mainpack.Roompack, room.RoomPack)

	return mainpack, nil
}

func JoinRoom(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}

	int64_, err := strconv.ParseInt(mainpack.Str, 10, 64)
	if err != nil {
		return nil, err
	}
	int32_ := int32(int64_)

	if len(server.RoomList) == 0 {
		logger.Error("RoomList count is empty")
	} else {
		for i := 0; i < len(server.RoomList); i++ {
			room := server.RoomList[i]
			if room.RoomPack.RoomID == int32_ {
				if room.RoomPack.State == 1 {
					mainpack.Returncode = GameProto.ReturnCode_Fail
					mainpack.Str = "房间已经开始游戏了~"
					return mainpack, nil
				}

				if room.RoomPack.Curnum >= room.RoomPack.Maxnum {
					mainpack.Returncode = GameProto.ReturnCode_Fail
					mainpack.Str = "房间人数已满"
					return mainpack, nil
				}

				room.Join(client)

				for i := 0; i < len(room.ClientList); i++ {
					mainpack.Roompack = append(mainpack.Roompack, room.RoomPack)
				}

				mainpack.Returncode = GameProto.ReturnCode_Success
				room.BroadcastTCP(client, mainpack)
				return mainpack, nil
			}
		}
	}

	mainpack.Returncode = GameProto.ReturnCode_Fail
	mainpack.Str = "没有该房间"
	return mainpack, nil
}

func FindRoom(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}

	for i := 0; i < len(server.RoomList); i++ {
		room := server.RoomList[i]
		if room == nil || room.RoomPack == nil {
			logger.Crit("this room error", room)
			continue
		}
		roompack := &GameProto.RoomPack{}
		roompack.Roomname = room.RoomPack.Roomname
		roompack.Maxnum = room.RoomPack.Maxnum
		roompack.Gamestate = room.RoomPack.Gamestate
		roompack.Curnum = room.RoomPack.Curnum
		roompack.RoomID = room.RoomPack.RoomID
		mainpack.Roompack = append(mainpack.Roompack, roompack)
		// mainpack.Roompack = append(mainpack.Roompack, room.RoomPack)
	}

	mainpack.Returncode = GameProto.ReturnCode_Success
	return mainpack, nil
}

func ExitRoom(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}
	room := client.RoomInfo
	if room == nil {
		return nil, errors.New("room is nil")
	}
	if room.RoomPack == nil {
		return nil, errors.New("room is error")
	}
	if room.RoomPack.State == 1 {
		mainpack.Returncode = GameProto.ReturnCode_Fail
		mainpack.Str = "房间已经开始游戏了~"
		return mainpack, nil
	}
	var hadClient bool
	for i := 0; i < len(room.ClientList); i++ {
		if client == room.ClientList[i] {
			hadClient = true
			break
		}
	}
	if hadClient == false {
		mainpack.Returncode = GameProto.ReturnCode_Fail
		mainpack.Str = "该用户已经退出房间了~"
		return mainpack, nil
	}

	roomLeftCount := len(room.ClientList) - 1
	room.OnlinePlayerCount--
	room.RoomPack.Curnum--
	mainpack.Returncode = GameProto.ReturnCode_Success

	if roomLeftCount <= 0 {
		room.Destroy()
		return mainpack, nil
	} else if room.RoomPack.State == 0 {
		client.RoomInfo = nil
		room.ClientList = server.RemoveC(room.ClientList, client)
		room.RoomPack.ActorPack = server.RemoveActor(room.RoomPack.ActorPack, client.Actor)
		for i := 0; i < len(room.ClientList); i++ {
			mainpack.Roompack = append(mainpack.Roompack, room.RoomPack)
		}
		mainpack.Actioncode = GameProto.ActionCode_JoinRoom
		mainpack.Returncode = GameProto.ReturnCode_Success
		room.BroadcastTCP(client, mainpack)
	}
	mainpack.Actioncode = GameProto.ActionCode_Exit
	mainpack.Roompack = nil
	return mainpack, nil
}

//开始游戏
func StartGame(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}
	count := len(server.RoomList)

	for i := 0; i < count; i++ {
		room := server.RoomList[i]
		if room == nil {
			continue
		}
		if room.RoomPack == nil {
			continue
		}
		if mainpack.Roompack[0] == nil {
			continue
		}
		if room.RoomPack.RoomID == mainpack.Roompack[0].RoomID {
			if client != room.ClientList[0] {
				mainpack.Returncode = GameProto.ReturnCode_Fail
				mainpack.Str = "您不是房主不能开始"
				return mainpack, nil
			}
			if len(room.ClientList) <= 1 {
				mainpack.Returncode = GameProto.ReturnCode_Fail
				mainpack.Str = "最少需要两名玩家哦~"
				return mainpack, nil
			}
			room.StartGame(client)
			return nil, nil
		}
	}

	mainpack.Returncode = GameProto.ReturnCode_Fail
	mainpack.Str = "没有该房间"
	return mainpack, nil
}
