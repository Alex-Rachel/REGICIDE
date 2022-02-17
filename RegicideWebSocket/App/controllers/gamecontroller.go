package controllers

import (
	"Regicide/App/tserver"
	server "Regicide/App/tserver"
	GameProto "Regicide/GameProto"
	"errors"
	"strconv"

	"github.com/wonderivan/logger"
)

func InitGameController() {
	controller := server.InstanceController("Game", GameProto.RequestCode_Game)
	controller.Funcs = map[string]interface{}{}
	controller.Funcs, _ = controller.AddFunction("ATTACK", Attack)
	controller.Funcs, _ = controller.AddFunction("SKILL", Skill)
	controller.Funcs, _ = controller.AddFunction("DAMAGE", Damage)
	controller.Funcs, _ = controller.AddFunction("HURT", Hurt)
	server.RegisterController(GameProto.RequestCode_Game, controller)
}

func Attack(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}
	if client.RoomInfo == nil {
		return nil, errors.New("roomInfo is nil")
	}
	if mainpack == nil {
		return nil, errors.New("mainpack is nil")
	}
	if mainpack.Roompack == nil || len(mainpack.Roompack) <= 0 {
		return nil, errors.New("mainpack.Roompack is nil")
	}
	if mainpack.Roompack[0].ActorPack == nil || len(mainpack.Roompack[0].ActorPack) <= 0 {
		return nil, errors.New("mainpack.Roompack[0].ActorPack[0] is nil")
	}
	if client.RoomInfo.ISGAMEWIN {
		mainpack := &GameProto.MainPack{}
		mainpack.Requestcode = GameProto.RequestCode_Room
		mainpack.Actioncode = GameProto.ActionCode_Chat
		mainpack.Returncode = GameProto.ReturnCode_Success
		mainpack.Str = "游戏胜利！！！"
		client.RoomInfo.Broadcast(mainpack)
		return nil, nil
	} else if client.RoomInfo.ISGAMELOSE {
		mainpack := &GameProto.MainPack{}
		mainpack.Requestcode = GameProto.RequestCode_Room
		mainpack.Actioncode = GameProto.ActionCode_Chat
		mainpack.Returncode = GameProto.ReturnCode_Success
		mainpack.Str = "游戏失败！！！"
		client.RoomInfo.Broadcast(mainpack)
		return nil, nil
	}

	client.RoomInfo.RoomPack.CurrentUseCards = client.RoomInfo.RoomPack.CurrentUseCards[0:0]
	if mainpack.Str == "JKR" {
		idx, _ := strconv.Atoi(mainpack.User)
		choiceIndex := int32(idx)
		mainpack = &GameProto.MainPack{}
		mainpack.Actioncode = GameProto.ActionCode_ATTACK
		mainpack.Requestcode = GameProto.RequestCode_Game
		mainpack.Returncode = GameProto.ReturnCode_Success

		client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1

		client.RoomInfo.SetPlayerIndex(choiceIndex)
		mainpack.Roompack = append(mainpack.Roompack, client.RoomInfo.RoomPack)
		mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE1
		mainpack.Str = "JKRCH"
		client.RoomInfo.Broadcast(mainpack)
		return nil, nil
	}
	var hadJoker bool
	choiceCards := mainpack.Roompack[0].ActorPack[0].CuttrntCards
	choiceCardCount := len(choiceCards)

	for i := 0; i < choiceCardCount; i++ {
		if choiceCards[i].CardType == GameProto.CardType_JOKER || int(choiceCards[i].CardType) == 6 {
			hadJoker = true
			break
		}
	}

	var bossDie bool
	var gameLose bool
	if choiceCardCount > 0 {

		if hadJoker {
			for i := 0; i < choiceCardCount; i++ {
				client.Actor.CuttrntCards = tserver.RemoveCardData(client.Actor.CuttrntCards, choiceCards[i])
				//放进弃牌堆		//攻击的时候放入boss未死亡的堆
				client.RoomInfo.CurrentAttackCardList = append(client.RoomInfo.UsedCardList, choiceCards[i])

				client.RoomInfo.RoomPack.MuDiCards = client.RoomInfo.UsedCardList
				//放入协议通知客户端
				client.RoomInfo.RoomPack.CurrentUseCards = append(client.RoomInfo.RoomPack.CurrentUseCards, choiceCards[i])
			}
			client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1

			mainpack = &GameProto.MainPack{}
			mainpack.Actioncode = GameProto.ActionCode_ATTACK
			mainpack.Requestcode = GameProto.RequestCode_Game
			mainpack.Returncode = GameProto.ReturnCode_Success
			mainpack.Roompack = append(mainpack.Roompack, client.RoomInfo.RoomPack)
			mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE1
			mainpack.Str = "JKR"
			client.RoomInfo.Broadcast(mainpack)
			return nil, nil
		}

		for i := 0; i < choiceCardCount; i++ {
			client.Actor.CuttrntCards = tserver.RemoveCardData(client.Actor.CuttrntCards, choiceCards[i])
			//放进弃牌堆
			client.RoomInfo.CurrentAttackCardList = append(client.RoomInfo.CurrentAttackCardList, choiceCards[i])
			//放入协议通知客户端
			client.RoomInfo.RoomPack.CurrentUseCards = append(client.RoomInfo.RoomPack.CurrentUseCards, choiceCards[i])
		}

		bossdie, err := client.AttackBoss(choiceCards)

		bossDie = bossdie

		if err != nil {
			logger.Error(err)
			return nil, err
		}

		client.RoomInfo.RoomPack.MuDiCards = client.RoomInfo.UsedCardList

		var currentCardsValue int32
		for i := 0; i < len(client.Actor.CuttrntCards); i++ {
			if client.Actor.CuttrntCards[i].CardType == GameProto.CardType_JOKER || int(client.Actor.CuttrntCards[i].CardType) == 6 {
				continue
			}
			currentCardsValue += client.Actor.CuttrntCards[i].CardValue
		}
		if currentCardsValue < client.RoomInfo.RoomPack.BossActor.ATK && !bossDie {
			gameLose = true
			logger.Emer("监控GAMELOSE:currentCardsValue:", currentCardsValue, "BossActor.ATK", client.RoomInfo.RoomPack.BossActor.ATK)
			client.RoomInfo.ISGAMELOSE = true
		}
	} else {
		//没有出牌
		var currentCardsValue int32
		for i := 0; i < len(client.Actor.CuttrntCards); i++ {
			if client.Actor.CuttrntCards[i].CardType == GameProto.CardType_JOKER || int(client.Actor.CuttrntCards[i].CardType) == 6 {
				continue
			}
			currentCardsValue += client.Actor.CuttrntCards[i].CardValue
		}
		if currentCardsValue < client.RoomInfo.RoomPack.BossActor.ATK {
			gameLose = true
			logger.Emer("监控GAMELOSE:currentCardsValue:", currentCardsValue, "BossActor.ATK", client.RoomInfo.RoomPack.BossActor.ATK)
			client.RoomInfo.ISGAMELOSE = true
		}
	}

	mainpack = &GameProto.MainPack{}
	mainpack.Actioncode = GameProto.ActionCode_ATTACK
	mainpack.Requestcode = GameProto.RequestCode_Game
	mainpack.Roompack = append(mainpack.Roompack, client.RoomInfo.RoomPack)
	mainpack.Returncode = GameProto.ReturnCode_Success
	if gameLose {
		mainpack.Str = "GAMELOSE"
		client.RoomInfo.RoomPack.State = 0
		client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
		client.RoomInfo.Broadcast(mainpack)
		return nil, nil
	} else if client.RoomInfo.ISGAMEWIN {
		mainpack.Str = "GAMEWIN"
		client.RoomInfo.RoomPack.State = 0
		client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
		client.RoomInfo.Broadcast(mainpack)
		return nil, nil
	} else {
		if bossDie {
			client.RoomInfo.GetNextIndex()
			client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
			mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE1
		} else if !hadJoker {
			client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE4
			mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE4
		} else if hadJoker {
			client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
			mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE1
		} else {
			client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE4
			mainpack.Roompack[0].Gamestate.State = GameProto.GAMESTATE_STATE4
		}
	}

	client.RoomInfo.BroadcastTCP(client, mainpack)
	return mainpack, nil
}

func Skill(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {

	return nil, nil
}

func Damage(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {

	return nil, nil
}

func Hurt(client *server.Client, mainpack *GameProto.MainPack, isUdp bool) (*GameProto.MainPack, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}
	if client.RoomInfo == nil {
		return nil, errors.New("roomInfo is nil")
	}
	if mainpack == nil {
		return nil, errors.New("mainpack is nil")
	}
	if mainpack.Roompack == nil || len(mainpack.Roompack) <= 0 {
		return nil, errors.New("mainpack.Roompack is nil")
	}
	if mainpack.Roompack[0].ActorPack == nil || len(mainpack.Roompack[0].ActorPack) <= 0 {
		return nil, errors.New("mainpack.Roompack[0].ActorPack[0] is nil")
	}

	client.RoomInfo.RoomPack.CurrentUseCards = client.RoomInfo.RoomPack.CurrentUseCards[0:0]

	choiceCards := mainpack.Roompack[0].ActorPack[0].CuttrntCards

	for i := 0; i < len(choiceCards); i++ {
		client.Actor.CuttrntCards = tserver.RemoveCardData(client.Actor.CuttrntCards, choiceCards[i])
		//放进弃牌堆
		client.RoomInfo.UsedCardList = append(client.RoomInfo.UsedCardList, choiceCards[i])
		client.RoomInfo.RoomPack.MuDiCards = client.RoomInfo.UsedCardList
		//放入协议通知客户端
		client.RoomInfo.RoomPack.CurrentUseCards = append(client.RoomInfo.RoomPack.CurrentUseCards, choiceCards[i])
	}

	client.RoomInfo.RoomPack.LeftCardCount = int32(len(client.RoomInfo.MyCardList))

	mainpack = &GameProto.MainPack{}
	mainpack.Actioncode = GameProto.ActionCode_HURT
	mainpack.Requestcode = GameProto.RequestCode_Game
	mainpack.Roompack = append(mainpack.Roompack, client.RoomInfo.RoomPack)
	mainpack.Returncode = GameProto.ReturnCode_Success

	client.RoomInfo.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
	client.RoomInfo.GetNextIndex()

	client.RoomInfo.BroadcastTCP(client, mainpack)
	return mainpack, nil
}
