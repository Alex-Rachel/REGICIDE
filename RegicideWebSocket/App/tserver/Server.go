package tserver

import (
	"Regicide/App/middleware"
	"io"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	"github.com/wonderivan/logger"
)

var ClientList = []*Client{}
var RoomList = []*Room{}
var ConnMap = make(map[uint32]*websocket.Conn)
var connid uint32 = 6000
var RoomID int32 = 1000

type Server struct {
	Port string
}

func StartServer(port string) Server {
	server := Server{Port: port}
	Start(server)
	return server
}

func Start(server Server) {
	CreateRoom("断剑重铸之日")
	logger.Info("START REGICIDE SERVER")
	r := gin.Default()
	f, _ := os.Create("log/regicide.log")
	gin.DefaultWriter = io.MultiWriter(f)

	r.Use(middleware.CrosMiddleWare())
	r.GET("/ws", Ws)
	r.POST("/rankList", GetRankList)
	r.POST("/rankPush", PostRankData)
	r.Run(server.Port)
}

var upGrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func Ws(c *gin.Context) {
	ws, err := upGrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		return
	}

	connid++
	uniid := connid
	ConnMap[connid] = ws
	go handleClient(ws, uniid)
}

func handleClient(conn *websocket.Conn, uniid uint32) {
	defer conn.Close()
	client := InstanceClient(conn, uniid)
	ClientList, _ = AddClient(client)
	for {
		_, message, err := conn.ReadMessage()
		if err != nil {
			logger.Debug(" conn.Read error", err)
			RemoveClient(client)
			break
		}
		// logger.Debug("messagetype:", messagetype, "   message:", message)
		buffCount := len(message)
		err2 := GetDataCenter().handBuffer(client, message[4:buffCount])
		if err2 != nil {
			// logger.Debug("handBuffer error", err2)
			RemoveClient(client)
			break
		}
	}
}

func AddClient(client *Client) ([]*Client, error) {
	ClientList = append(ClientList, client)
	logger.Debug("Add client to Server =>", client.Addr, "  ClientCount =>", len(ClientList))

	if len(ClientList) > 3000 {
		os.Exit(1)
	}
	return ClientList, nil
}

func RemoveClient(client *Client) {
	// 离开断线时不移除，等重等
	room := client.RoomInfo
	if room != nil {
		room.OnlinePlayerCount--
		room.OffLinePlayerCount++
		room.HadPlayerOutLine = true
		if room.OnlinePlayerCount == 0 {
			room.Destroy()
		} else {
			room.SendMsg("您的队友已掉线", client)
		}
	}

	ClientList = RemoveC(ClientList, client)
	_, ok := ConnMap[client.Uniid]
	if ok {
		delete(ConnMap, client.Uniid)
	}
	logger.Debug("Rmv client from Server =>", client.Addr, "Uniid :=>", client.Uniid, "  ClientCount =>", len(ClientList))
}
