package tserver

import (
	"Regicide/App/common"
	"Regicide/App/model"
	GameProto "Regicide/GameProto"
	"errors"
	"math/rand"
	"time"

	"github.com/wonderivan/logger"
)

var GMMODE bool

var TOTAL_CARD_COUNT int

var UseJoker bool

//InitCards 初始化所有卡牌
func (room *Room) InitCards() {
	TOTAL_CARD_COUNT = 54
	for i := 0; i < TOTAL_CARD_COUNT; i++ {
		cardData := InstanceCardData(i)
		room.ToTalCardList = append(room.ToTalCardList, &cardData)
	}
}

func (room *Room) InitMyCards() {
	for i := 0; i < len(room.ToTalCardList); i++ {
		cardData := room.ToTalCardList[i]
		if cardData.IsBoss {
			room.BossList = append(room.BossList, cardData)
		} else {
			room.MyCardList = append(room.MyCardList, cardData)
		}
	}
	cardDataBigJoker := InstanceCardData(53)
	cardDataBigJoker.IsJoker = true
	room.BossList = append(room.BossList, &cardDataBigJoker)

	RandomSort(room.MyCardList)
	room.RoomPack.LeftCardCount = int32(len(room.MyCardList))
}

func (room *Room) TurnCards(client *Client) {
	turnCount := int(9 - room.RoomPack.Curnum)
	room.CURRENT_MAX_TURN_COUNT = turnCount
	if turnCount == 0 {
		return
	}

	mycardCount := len(room.MyCardList)
	if turnCount > mycardCount {
		turnCount = mycardCount
	}

	turnCardList := []*CardData{}

	for i := 0; i < turnCount; i++ {
		cardData := room.MyCardList[i]
		turnCardList = append(turnCardList, cardData)
	}

	currentCards := []*GameProto.CardData{}

	for i := 0; i < turnCount; i++ {
		cardData := turnCardList[i]
		room.MyCardList = RemoveCard(room.MyCardList, cardData)

		cardProtoData := &GameProto.CardData{CardInt: int32(cardData.CardInt), CardValue: int32(cardData.CardValue)}
		currentCards = append(currentCards, cardProtoData)
	}

	client.Actor.CuttrntCards = currentCards
	room.RoomPack.LeftCardCount = int32(len(room.MyCardList))
}

//红桃
func (client *Client) AddHp(number int) {
	count := len(client.RoomInfo.UsedCardList)
	if count == 0 {
		return
	}
	if number > count {
		number = count
	}
	for i := 0; i < number; i++ {
		cardData := InstanceCardData(int(client.RoomInfo.UsedCardList[i].CardInt))
		client.RoomInfo.MyCardList = append(client.RoomInfo.MyCardList, &cardData)
	}
	for i := 0; i < number; i++ {
		if len(client.RoomInfo.UsedCardList) <= 0 {
			break
		}
		cardData := client.RoomInfo.UsedCardList[0]
		client.RoomInfo.UsedCardList = RemoveCardData(client.RoomInfo.UsedCardList, cardData)
	}
	RandomSort(client.RoomInfo.MyCardList)
	client.RoomInfo.RoomPack.LeftCardCount = int32(len(client.RoomInfo.MyCardList))
}

// 方块抽卡
func (client *Client) TurnCardDiamond(number int) {
	// logger.Emer("client Username:", client.Username, "TurnCardDiamond number=>", number)
	room := client.RoomInfo
	turnCount := number
	if turnCount == 0 {
		return
	}

	mycardCount := len(room.MyCardList)
	if turnCount > mycardCount {
		turnCount = mycardCount
	}

	myIndex := 0
	clientCount := len(room.ClientList)
	for i := 0; i < len(room.ClientList); i++ {
		if room.ClientList[i].ActorID == client.ActorID {
			myIndex = i
			break
		}
	}
	i := 0
	index := myIndex
	// logger.Emer("Index", myIndex)
	continueCount := 0
	for {
		if i > turnCount || continueCount > 2*turnCount {
			break
		}
		if i > len(room.MyCardList)-1 {
			break
		}
		if index >= clientCount {
			index = 0
		}
		clientCardCount := len(room.ClientList[index].Actor.CuttrntCards)
		if clientCardCount >= room.CURRENT_MAX_TURN_COUNT {
			index++
			continueCount++
			continue
		}
		// logger.Emer("Username:", room.ClientList[index].Username, "抽到手中：", i, "玩家：", index, "continueCount：", continueCount)
		cardData := room.MyCardList[i]
		room.MyCardList = RemoveCard(room.MyCardList, cardData)
		cardProtoData := &GameProto.CardData{CardInt: int32(cardData.CardInt), CardValue: int32(cardData.CardValue)}
		room.ClientList[index].Actor.CuttrntCards = append(room.ClientList[index].Actor.CuttrntCards, cardProtoData)
		i++
		index++
	}
	client.RoomInfo.RoomPack.LeftCardCount = int32(len(room.MyCardList))
}

func RandomSort(cardDatas []*CardData) {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	count := len(cardDatas)
	for i := 0; i < count; i++ {
		index := r.Intn(count - 1)
		temp := cardDatas[i]
		cardDatas[i] = cardDatas[index]
		cardDatas[index] = temp
	}
}

type CardData struct {
	CardInt   int
	CardValue int
	CardType  int
	IsBoss    bool
	IsJoker   bool
	IsPet     bool
}

//初始化这张卡的卡片数据
func InstanceCardData(cardInt int) CardData {

	cardValue := 0
	if cardInt == 52 || cardInt == 53 {
		cardValue = 0
	} else {
		cardValue = (cardInt % 13) + 1
	}
	cardType := 0
	if cardValue == 0 {
		cardType = 5
	} else {
		cardType = ((cardInt) / 13) + 1
	}

	isJoker := cardType == 5
	isBoss := cardValue > 10 && !isJoker
	isPet := cardValue == 1

	cardData := CardData{CardValue: cardValue, CardInt: cardInt, CardType: cardType, IsJoker: isJoker, IsBoss: isBoss, IsPet: isPet}
	return cardData
}

//InitBoss
func (room *Room) InitBoss() *GameProto.ActorPack {
	room.CURRENT_BOSS_INDEX++

	count := len(room.BossList)

	var bossPower int
	if room.CURRENT_BOSS_INDEX <= 4 {
		bossPower = 11
	} else if room.CURRENT_BOSS_INDEX <= 8 {
		bossPower = 12
	} else if room.CURRENT_BOSS_INDEX <= 12 {
		bossPower = 13
	} else if room.CURRENT_BOSS_INDEX == 13 {
		bossPower = 0
	} else {
		logger.Emer("监控：这个index有问题:room.CURRENT_BOSS_INDEX ", room.CURRENT_BOSS_INDEX)
		bossPower = 13
	}

	logger.Emer("监控:room.CURRENT_BOSS_INDEX ", room.CURRENT_BOSS_INDEX)

	var cacheList []*CardData
	for i := 0; i < count; i++ {
		if room.BossList[i].CardValue == bossPower {
			cacheList = append(cacheList, room.BossList[i])
		}
	}

	cacheListCount := len(cacheList)

	var index int
	if cacheListCount <= 0 || room.CURRENT_BOSS_INDEX > 13 {
		room.ISGAMEWIN = true
		// logger.Emer("监控有问题！！！:cacheList", cacheList, "监控:cacheList.count:", cacheListCount)
		index = 0
		return nil
	} else {
		r := rand.New(rand.NewSource(time.Now().UnixNano()))
		index = r.Intn(cacheListCount)
	}

	var atk int32
	var hp int32

	cardData := cacheList[index]
	room.BossList = RemoveCard(room.BossList, cardData)

	if cardData.CardValue == 11 {
		atk = 10
		hp = 20
	} else if cardData.CardValue == 12 {
		atk = 15
		hp = 30
	} else if cardData.CardValue == 13 {
		atk = 20
		hp = 40
	} else if cardData.IsJoker && cardData.CardType == 6 {
		atk = 25
		hp = 50
	} else {
		atk = 25
		hp = 50
	}
	room.RoomPack.Gamestate.State = GameProto.GAMESTATE_STATE1
	room.CurrentBossBeJokerAtk = false
	bossActor := &GameProto.ActorPack{ATK: atk, Hp: hp, ActorId: int32(cardData.CardInt), Index: int32(room.CURRENT_BOSS_INDEX), ActorJob: int32(((cardData.CardInt) / 13) + 1)}
	room.RoomPack.BossActor = bossActor
	logger.Debug("监控CURRENT BossActor:", bossActor)
	return bossActor
}

func (client *Client) AttackBoss(cardData []*GameProto.CardData) (bool, error) {
	if client == nil {
		return false, errors.New("client is nil")
	}
	room := client.RoomInfo
	if room == nil {
		return false, errors.New("room is nil")
	}
	if room.RoomPack == nil {
		return false, errors.New("room.RoomPack is nil")
	}
	if room.RoomPack.BossActor == nil {
		return false, errors.New("room.RoomPack.BossActor is nil")
	}
	if room.RoomPack.Gamestate.State != GameProto.GAMESTATE_STATE1 {
		return false, errors.New("is not GameProto.GAMESTATE_STATE1")
	}

	bossActor := room.RoomPack.BossActor

	attackData := GenAttackData(cardData)

	logger.Debug("attackData:", attackData)

	return ImpactSkill(client, bossActor, attackData), nil
}

func ImpactSkill(client *Client, bossActor *GameProto.ActorPack, attackData AttackData) bool {
	if client == nil {
		return false
	}
	if bossActor == nil {
		return false
	}

	room := client.RoomInfo

	if attackData.HadJoker {
		room.CurrentBossBeJokerAtk = true
		return false
	}

	bossType := bossActor.ActorJob

	coubldDouble := ((bossType != 1) || room.CurrentBossBeJokerAtk) && attackData.CouldDoubleAtk

	room.CurrentBossType = GameProto.CardType(bossType)

	if attackData.CouldDownBossAtk && ((room.CurrentBossType != GameProto.CardType_SPADE) || room.CurrentBossBeJokerAtk) {
		bossActor.ATK -= attackData.Damage
		if bossActor.ATK <= 0 {
			bossActor.ATK = 0
		}
	}
	if attackData.CouldAddHp && (room.CurrentBossType != GameProto.CardType_HEART) && room.RoomPack.BossActor.ActorId != 53 {
		client.AddHp(int(attackData.Damage))
	}

	if attackData.CouldTurnCard && (room.CurrentBossType != GameProto.CardType_DIAMOND) && room.RoomPack.BossActor.ActorId != 53 {
		client.TurnCardDiamond(int(attackData.Damage))
	}

	if GMMODE {
		bossActor.Hp -= 999
	} else if coubldDouble {
		bossActor.Hp -= 2 * attackData.Damage
	} else {
		bossActor.Hp -= attackData.Damage
	}

	if bossActor.Hp < 0 && bossActor.ActorId != 53 {
		cardData := GameProto.CardData{CardInt: bossActor.ActorId, CardType: GameProto.CardType(bossActor.ActorJob)}
		room.UsedCardList = append(room.UsedCardList, &cardData)
		room.RoomPack.MuDiCards = room.UsedCardList
	} else if bossActor.Hp == 0 && bossActor.ActorId != 53 {
		cardData := InstanceCardData(int(bossActor.ActorId))
		room.MyCardList = append(room.MyCardList, &cardData)
		room.RoomPack.MuDiCards = room.UsedCardList

		cache := []*CardData{&cardData}
		temp := append(cache, room.MyCardList...)
		room.MyCardList = temp
	}

	bossDie := bossActor.Hp <= 0
	if bossActor.Hp <= 0 {
		bossActor.Hp = 0
		for i := 0; i < len(room.CurrentAttackCardList); i++ {
			//boss死亡时 本局攻击过的卡放入墓地
			room.UsedCardList = append(room.UsedCardList, room.CurrentAttackCardList[i])
			room.RoomPack.MuDiCards = room.UsedCardList
		}
		room.CurrentAttackCardList = room.CurrentAttackCardList[0:0]
		if room.CURRENT_BOSS_INDEX < 13 {
			room.InitBoss()
			if room.ISGAMEWIN {
				mainpack := &GameProto.MainPack{}
				mainpack.Requestcode = GameProto.RequestCode_Room
				mainpack.Actioncode = GameProto.ActionCode_Chat
				mainpack.Returncode = GameProto.ReturnCode_Success
				mainpack.Str = "游戏胜利！！！"
				room.Broadcast(mainpack)
				PostOnlineWinRank(room)
			}
		} else {
			logger.Debug("GAME WIN")
			mainpack := &GameProto.MainPack{}
			mainpack.Requestcode = GameProto.RequestCode_Room
			mainpack.Actioncode = GameProto.ActionCode_Chat
			mainpack.Returncode = GameProto.ReturnCode_Success
			mainpack.Str = "游戏胜利！！！"
			room.Broadcast(mainpack)

			PostOnlineWinRank(room)
		}
	}
	return bossDie
}

func PostOnlineWinRank(room *Room) {
	roomWinTime := time.Now().Unix()

	totalTime := roomWinTime - room.RoomStartTime

	if room == nil {
		return
	}
	if room.ClientList == nil {
		return
	}

	clients := room.ClientList

	clientCount := len(clients)

	var names string
	for i := 0; i < clientCount; i++ {
		client := clients[i]
		if client == nil {
			continue
		}

		if i != clientCount-1 {
			names += client.Username + ","
		} else {
			names += client.Username
		}
	}

	onlineRank := &model.OnlineRank{WinTime: totalTime, Usersname: names}

	common.DB.Create(onlineRank)
}

func GenAttackData(cardData []*GameProto.CardData) AttackData {
	var CouldTurnCard bool
	var CouldDoubleAtk bool
	var CouldDownBossAtk bool
	var CouldAddHp bool
	var Damage int32
	var HadPet bool
	var HadJoker bool
	for i := 0; i < len(cardData); i++ {
		card := cardData[i]
		//is pet
		if card.CardValue == 1 {
			HadPet = true
			Damage += card.CardValue
		} else {
			if card.CardValue == 11 {
				Damage += 10
			} else if card.CardValue == 12 {
				Damage += 15
			} else if card.CardValue == 13 {
				Damage += 20
			} else {
				Damage += card.CardValue
			}
		}

		if card.CardType == GameProto.CardType_DIAMOND {
			CouldTurnCard = true
		} else if card.CardType == GameProto.CardType_CLUB {
			CouldDoubleAtk = true
		} else if card.CardType == GameProto.CardType_SPADE {
			CouldDownBossAtk = true
		} else if card.CardType == GameProto.CardType_HEART {
			CouldAddHp = true
		} else if card.CardType == GameProto.CardType_JOKER {
			HadJoker = true
		} else if int(card.CardType) == 6 {
			HadJoker = true
		}
	}

	attackData := AttackData{
		CouldTurnCard:    CouldTurnCard,
		CouldDoubleAtk:   CouldDoubleAtk,
		CouldDownBossAtk: CouldDownBossAtk,
		CouldAddHp:       CouldAddHp, Damage: Damage,
		HadPet: HadPet, HadJoker: HadJoker}
	return attackData
}

type AttackData struct {
	CouldTurnCard    bool
	CouldDoubleAtk   bool
	CouldDownBossAtk bool
	CouldAddHp       bool
	Damage           int32
	HadPet           bool
	HadJoker         bool
}
