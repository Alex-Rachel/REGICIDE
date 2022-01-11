using System;
using System.Collections.Generic;
using RegicideProtocol;
using UnityEngine;
using UnityEngine.UI;

class GameOnlineUI : UIWindow
{
    private InventoryUI m_inventoryUI;
    private ItemCard m_bossCard;
    private List<Text> m_textPlayerList = new List<Text>();
    private List<ItemCard> m_cardList = new List<ItemCard>();


    private ItemCard m_player2Cards;
    private ItemCard m_player3Cards;
    private ItemCard m_player4Cards;

    #region 脚本工具生成的代码
    private GameObject m_goContent;
    private GameObject m_goMiddle;
    private Transform m_tfBossContent;
    private Button m_btnAttack;
    private Button m_btnAbord;
    private GameObject m_goInventoryRoot;
    private Button m_btnUsed;
    private GameObject m_goCardsRoot;
    private GameObject m_itemCard;
    private List<Transform> m_tfCardContent = new List<Transform>();
    private Text m_textBossIndex;
    private Text m_textPlayerIndex;
    private Text m_textLeft;
    private Text m_textMudi;
    private InputField m_inputChat;
    private Button m_btnSend;

    protected override void ScriptGenerator()
    {
        m_goContent = FindChild("m_goContent").gameObject;
        m_goMiddle = FindChild("m_goContent/m_goMiddle").gameObject;
        m_tfBossContent = FindChild("m_goContent/m_goMiddle/m_tfBossContent");
        m_btnAttack = FindChildComponent<Button>("m_goContent/m_goMiddle/m_btnAttack");
        m_btnAbord = FindChildComponent<Button>("m_goContent/m_goMiddle/m_btnAbord");
        m_goInventoryRoot = FindChild("m_goContent/m_goMiddle/m_goInventoryRoot").gameObject;
        m_btnUsed = FindChildComponent<Button>("m_goContent/m_goMiddle/m_btnUsed");
        m_textMudi = FindChildComponent<Text>("m_goContent/m_goMiddle/m_btnUsed/m_textMudi");
        m_goCardsRoot = FindChild("m_goContent/m_goCardsRoot").gameObject;
        m_itemCard = FindChild("m_goContent/m_goCardsRoot/m_itemCard").gameObject;
        m_textBossIndex = FindChildComponent<Text>("m_goContent/m_goTop/m_textBossIndex");
        m_textPlayerIndex = FindChildComponent<Text>("m_goContent/m_goTop/m_textPlayerIndex");
        m_textLeft = FindChildComponent<Text>("m_goContent/m_goMiddle/m_btnLeft/m_textLeft");

        m_inputChat = FindChildComponent<InputField>("m_goContent/m_inputChat");
        m_btnSend = FindChildComponent<Button>("m_goContent/m_btnSend");
        for (int i = 1; i <=4; i++)
        {
            m_tfCardContent.Add(FindChild("m_goContent/m_goCardsRoot/m_tfCardContent"+i));
            m_textPlayerList.Add(FindChildComponent<Text>("m_goContent/m_goCardsRoot/m_textPlayer"+i));
        }
        m_btnAttack.onClick.AddListener(OnClickAttackBtn);
        m_btnAbord.onClick.AddListener(OnClickAbordBtn);
        m_btnUsed.onClick.AddListener(OnClickUsedBtn);

        m_btnSend.onClick.AddListener((() =>
        {
            if (!m_inputChat.text.Equals(string.Empty))
            {
                RoomDataMgr.Instance.ChatReq(m_inputChat.text);
                m_inputChat.text = string.Empty;
            }
        }));
    }
    #endregion

    #region Create Destroy生命周期
    protected override void OnCreate()
    {
        m_itemCard.gameObject.SetActive(false);
        GameOnlineMgr.Instance.IsOnlineGameIng = true;
    }

    protected override void OnDestroy()
    {
        GameOnlineMgr.Instance.IsOnlineGameIng = false;
    }

    #endregion

    private bool m_hadInit = false;

    public void Init(MainPack mainPack)
    {
        if (mainPack == null)
        {
            return;
        }

        var players = GameOnlineMgr.Instance.ActorPacks;

        if (players.Count > 4)
        {
            return;
        }
        var myIndex = GameOnlineMgr.Instance.MyGameIndex;

        if (!m_hadInit)
        {
            for (int i = 0; i < players.Count; i++)
            {
                switch (myIndex)
                {
                    case 0:
                    {
                        if (i == 1)
                        {
                            m_player2Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[i]);
                            m_player2Cards.gameObject.SetActive(true);
                            m_textPlayerList[1].text = i+ "号"+ string.Format("玩家{0}", players[i].ActorName);
                        }
                        else if (i == 2)
                        {
                            m_player3Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[i]);
                            m_player3Cards.gameObject.SetActive(true);
                            m_textPlayerList[2].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                        }
                        else if (i == 3)
                        {
                            m_player4Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[i]);
                            m_player4Cards.gameObject.SetActive(true);
                            m_textPlayerList[3].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                        }
                        break;
                    }
                    case 1:
                    {
                        if (i == 2)
                        {
                            m_player2Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[1]);
                            m_player2Cards.gameObject.SetActive(true);
                            m_textPlayerList[1].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                        }
                        else if (i == 3)
                        { 
                            m_player3Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[2]);
                            m_player3Cards.gameObject.SetActive(true);
                            m_textPlayerList[2].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                        }
                        else if (i == 0)
                        {
                            m_player4Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[3]);
                            m_player4Cards.gameObject.SetActive(true);
                            m_textPlayerList[3].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                        }
                        break;
                    }
                    case 2:
                    {
                        if (i == 3)
                        {
                            m_player2Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[1]);
                            m_player2Cards.gameObject.SetActive(true);
                            m_textPlayerList[1].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        else if (i == 0)
                        {
                            m_player3Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[2]);
                            m_player3Cards.gameObject.SetActive(true);
                            m_textPlayerList[2].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        else if (i == 1)
                        {
                            m_player4Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[3]);
                            m_player4Cards.gameObject.SetActive(true);
                            m_textPlayerList[3].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        break;
                    }
                    case 3:
                    {
                        if (i == 0)
                        {
                            m_player2Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[1]);
                            m_player2Cards.gameObject.SetActive(true);
                            m_textPlayerList[1].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        else if (i == 1)
                        {
                            m_player3Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[2]);
                            m_player3Cards.gameObject.SetActive(true);
                            m_textPlayerList[2].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        else if (i == 2)
                        {
                            m_player4Cards = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfCardContent[3]);
                            m_player4Cards.gameObject.SetActive(true);
                            m_textPlayerList[3].text = i + "号" + string.Format("玩家{0}", players[i].ActorName);
                            }
                        break;
                    }
                }

                if (i == myIndex)   //我的位置一定是0
                {
                    m_textPlayerList[0].text = GameOnlineMgr.Instance.MyGameIndex + "号" + string.Format("玩家{0}", players[myIndex].ActorName);
                    //"Index= " + GameOnlineMgr.Instance.MyGameIndex + string.Format("玩家{0} {1}", players[myIndex].ActorId, players[myIndex].ActorName);
                }
       
                m_textPlayerList[i].gameObject.SetActive(true);
            }

        }

        m_hadInit = true;

        RefreshGameUI();
    }

    private void RefreshMyCards()
    {
        var myCardData = GameOnlineMgr.Instance.GetMyCardData();

        AdjustIconNum(m_cardList, myCardData.Count, m_tfCardContent[0], m_itemCard);

        for (int i = 0; i < m_cardList.Count; i++)
        {
            m_cardList[i].Init(myCardData[i]);
        }
    }

    private void RefeshOthersCard()
    {
        var MainPlayerIndex = GameOnlineMgr.Instance.MyGameIndex;   //0,1,2,3

        var players = GameOnlineMgr.Instance.ActorPacks;

        for (int i = 0; i < players.Count; i++)
        {
            var player = players[i];

            if (player.ActorId == GameOnlineMgr.Instance.MyActorId)
            {
                continue;
            }

            var cardData = GameOnlineMgr.Instance.GetCardDataByActorId(player.ActorId);

            var myIndex = GameOnlineMgr.Instance.MyGameIndex;

            switch (myIndex)
            {
                case 0:
                    {
                        if (i == 1)
                        {
                            m_player2Cards.Init(cardData);
                        }
                        else if (i == 2)
                        {
                            m_player3Cards.Init(cardData);
                        }
                        else if (i == 3)
                        {
                            m_player4Cards.Init(cardData);
                        }
                        break;
                    }
                case 1:
                    {
                        if (i == 2)
                        {
                            m_player2Cards.Init(cardData);
                        }
                        else if (i == 3)
                        {
                            m_player3Cards.Init(cardData);
                        }
                        else if (i == 0)
                        {
                            m_player4Cards.Init(cardData);
                        }
                        break;
                    }
                case 2:
                    {
                        if (i == 3)
                        {
                            m_player2Cards.Init(cardData);
                        }
                        else if (i == 0)
                        {
                            m_player3Cards.Init(cardData);
                        }
                        else if (i == 1)
                        {
                            m_player4Cards.Init(cardData);
                        }
                        break;
                    }
                case 3:
                    {
                        if (i == 0)
                        {
                            m_player2Cards.Init(cardData);
                        }
                        else if (i == 1)
                        {
                            m_player3Cards.Init(cardData);
                        }
                        else if (i == 2)
                        {
                            m_player4Cards.Init(cardData);
                        }
                        break;
                    }
            }
        }
    }

    private void RefreshBoss(BossActor bossActor)
    {
        if (m_bossCard == null)
        {
            m_bossCard = CreateWidgetByPrefab<ItemCard>(m_itemCard, m_tfBossContent);
        }

        m_bossCard.Init(bossActor);
    }

    /// <summary>
    /// 刷新UI事件
    /// </summary>
    private void RefreshGameUI()
    {
        RefreshMyCards();
        RefeshOthersCard();
        RefreshBoss(GameOnlineMgr.Instance.BossActor);
        RefreshInfo();
    }

    private void RefreshInfo()
    {
        m_textBossIndex.text = string.Format("当前Boss:{0},剩余:{1}",GameOnlineMgr.Instance.CurrentBossIndex,13- GameOnlineMgr.Instance.CurrentBossIndex);
        m_textPlayerIndex.text = string.Format("当前回合玩家:{0}", GameOnlineMgr.Instance.ActorPacks[GameOnlineMgr.Instance.CurrentGameIndex].ActorName);

        m_textLeft.text = string.Format("酒馆剩余:{0}", GameOnlineMgr.Instance.LeftCardCount);
        m_textMudi.text = string.Format("弃牌堆:{0}", GameOnlineMgr.Instance.MuDiCardDatas.Count);
    }

    private void UpdateGameState()
    {

    }

    #region 注册消息事件
    protected override void RegisterEvent()
    {
        base.RegisterEvent();
        EventCenter.Instance.AddEventListener<BossActor>("RefreshBoss", RefreshBoss);
        EventCenter.Instance.AddEventListener("RefreshGameUI", RefreshGameUI);
        EventCenter.Instance.AddEventListener("UpdateGameState", UpdateGameState);
    }

    protected override void DeRegisterEvent()
    {
        base.DeRegisterEvent();
        EventCenter.Instance.RemoveEventListener<BossActor>("RefreshBoss", RefreshBoss);
        EventCenter.Instance.RemoveEventListener("RefreshGameUI", RefreshGameUI);
        EventCenter.Instance.RemoveEventListener("UpdateGameState", UpdateGameState);
    }
    #endregion


    #region 事件
    private void OnClickAttackBtn()
    {
        GameOnlineMgr.Instance.AttackReq();
    }
    private void OnClickAbordBtn()
    {
        GameOnlineMgr.Instance.AbordReq();
    }
    private void OnClickUsedBtn()
    {
        var ui = UISys.Mgr.ShowWindow<UsedListUI>();
        ui.InitOnlineUI();
    }
    #endregion

}