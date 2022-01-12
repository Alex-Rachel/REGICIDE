using System;
using System.Collections.Generic;
using RegicideProtocol;
using UnityEngine;
using Random = System.Random;

partial class GameMgr : Singleton<GameMgr>
{
    public GameMgr()
    {
       var value =  PlayerPrefs.GetInt("GameLevel");
       if (value == 0)
       {
           PlayerPrefs.SetInt("GameLevel",3);
       }
    }

    #region 属性
    public int PlayerNum;

    /// <summary>
    /// 是否是横屏
    /// </summary>
    public bool IsLandScape
    {
        get
        {
            return ((float)Screen.width / (float)Screen.height) > 1;
        }
    }
    public int CurrentCardsNum
    {
        get
        {
            return m_curList.Count;
        }
    }

    /// <summary>
    /// 当前的手牌
    /// </summary>
    public List<CardData> CurrentCards
    {
        get
        {
            return m_curList;
        }
    }

    public List<CardData> UseCardDatas
    {
        get
        {
            return m_useList;
        }
    }
    public const int TotalCardNum = 54;
    public int MyMaxCardNum
    {
        get
        {
            return 8 - PlayerNum + 1;
        }
    }

    public int LeftJokerCount = 2;
    public int TotalJokerCount = 2;
    public int TotalKillBossCount;
    public int NeedKillBossCount = 4;
    public int LeftCount
    {
        get
        {
            return m_myList.Count;
        }
    }
    public BossActor BossActor;
    private List<CardData> m_totalList = new List<CardData>(TotalCardNum);  //总牌堆
    private List<CardData> m_curList = new List<CardData>();                //手卡
    public List<CardData> m_myList = new List<CardData>(TotalCardNum);     //可抽卡
    public List<CardData> m_useList = new List<CardData>(TotalCardNum);    //墓地
    private List<CardData> m_bossList = new List<CardData>();                       //boss堆
    public List<CardData> m_choiceList = new List<CardData>();                     //当前回合选择的卡
    private List<CardData> m_choiceRandomList = new List<CardData>();
    #endregion

    #region 生命周期
    public void Init()
    {
        RegiserEvent();
        PlayerNum = (int)GameApp.Instance.payerNum + 1;

        InitTotalCards();
        InitMyCards();
        
    }

    private void RegiserEvent()
    {
        MonoManager.Instance.AddUpdateListener(Update);
        EventCenter.Instance.AddEventListener("AbordCard", AbordCard);
        EventCenter.Instance.AddEventListener<int>("BossAttack", Hurt);
        EventCenter.Instance.AddEventListener<int>("AttackBoss", AttackBoss);
        EventCenter.Instance.AddEventListener<CardData>("Choice", Choice);
        EventCenter.Instance.AddEventListener<CardData>("DeChoice", DeChoice);
        EventCenter.Instance.AddEventListener<bool>("BossDie", BossDie);
        EventCenter.Instance.AddEventListener<int>("AddHp", AddHp);

        EventCenter.Instance.AddEventListener<CardData>("ChoiceRandom", ChoiceRandom);
        EventCenter.Instance.AddEventListener<CardData>("DeChoiceRandom", DeChoiceRandom);
    }

    private void Update()
    {

    }
    #endregion

    #region 战斗中卡排操作

    public void RandChangeCards()
    {
        var choiceCount = m_choiceList.Count;
        var choiceRandCount = m_choiceRandomList.Count;
        if (choiceRandCount == 0 && choiceCount == 0)
        {
            UISys.Mgr.CloseWindow<GameChoiceUI>();
            return;
        }

        if (choiceRandCount != choiceCount)
        {
            UISys.ShowTipMsg("随机牌库与我的手牌数目需要相同！");
            return;
        }
        var ableChangeCard = (5 - GameLevel) < 1 ? 1 : (5 - GameLevel);
        if (choiceRandCount > ableChangeCard)
        {
            UISys.ShowTipMsg(string.Format("该难度下一次最多调度 {0} 张手牌！",ableChangeCard));
            return;
        }

        for (int i = 0; i < m_choiceRandomList.Count; i++)
        {
            var card = m_choiceRandomList[i];
            m_myList.Remove(card);
            m_curList.Add(card);
        }

        for (int i = 0; i < m_choiceList.Count; i++)
        {

            var card = m_choiceList[i];
            m_curList.Remove(card);
            m_myList.Add(card);
        }
        m_choiceList.Clear();
        m_choiceRandomList.Clear();
        UISys.Mgr.CloseWindow<GameChoiceUI>();
        EventCenter.Instance.EventTrigger("RefreshGameUI");
    }

    public List<CardData> RandTurnCards()
    {
        if (m_myList.Count <= 0)
        {
            return new List<CardData>();
        }
        var randomCardNum = 4;
        var count = m_myList.Count < randomCardNum ? m_myList.Count : randomCardNum;
        var temp = new List<CardData>();
        bool complete = false;
        int randCount = 0;
        while (!complete)
        {
            Random ran = new Random((int)DateTime.Now.Ticks + randCount);

            if (temp.Count >= m_myList.Count)
            {
                Debug.Log("修复成功");
                complete = true;
                break;
            }

            var idx = ran.Next(0, m_myList.Count);

            var card = m_myList[idx];
            
            bool hadCard = false;
            
            for (int i = 0; i < temp.Count; i++)
            {
                if (temp[i].CardInt == card.CardInt)
                {
                    hadCard = true;
                    break;
                }
                
            }
            if (card.IsBoss)
            {
                hadCard = true;
            }

            if (!hadCard)
            {
                temp.Add(card);
            }
            randCount++;
            if (temp.Count >= count)
            {
                complete = true;
            }
            if (randCount >= 200)
            {
                Debug.LogError("死循环了傻逼");
                complete = true;
            }
        }
        return temp;
    }

    private void ChoiceRandom(CardData cardData)
    {
        m_choiceRandomList.Add(cardData);
    }

    private void DeChoiceRandom(CardData cardData)
    {
        m_choiceRandomList.Remove(cardData);
    }
    private void Choice(CardData cardData)
    {
        m_choiceList.Add(cardData);
    }

    private void DeChoice(CardData cardData)
    {
        m_choiceList.Remove(cardData);
    }

    
    private void AbordCard()
    {
        if (gameState != GameState.STATEFOUR)
        {
            UISys.ShowTipMsg(string.Format("当前阶段是：{0}，无法遗弃卡牌", stateMsgDic[gameState]));
            return;
        }

        if (m_choiceList.Count > 0 )
        {
            for (int i = 0; i < m_choiceList.Count; i++)
            {
                if (m_choiceList[i].IsJoker)
                {
                    //UISys.ShowTipMsg("Joker无法遗弃！！！");
                    if (LeftJokerCount>0)
                    {
                        LeftJokerCount--;
                        UISys.ShowTipMsg("弃牌阶段使用Joker");
                        GameMgr.Instance.TurnJokerCard();
                        EventCenter.Instance.EventTrigger("RefreshGameUI");
                    }
                    else
                    {
                        UISys.ShowTipMsg("没有Joker了");
                    }
                    return;
                }
            }
        }

        int myValue = 0;

        foreach (var card in m_choiceList)
        {
            myValue += card.CardPower;
        }

        if (myValue < m_needAbordValue)
        {
            UISys.ShowTipMsg(string.Format("您需要遗弃:{0}点数的牌",m_needAbordValue));
            return;
        }

        for (int i = 0; i < m_choiceList.Count; i++)
        {
            var card = m_choiceList[i];

            m_useList.Add(card);

            m_curList.Remove(card);
        }

        m_choiceList.Clear();

        m_needAbordValue = 0;

        SetState(GameState.STATEONE);

        EventCenter.Instance.EventTrigger("RefreshGameUI");
    }

    private void AddHp(int num)
    {
        Debug.Log("num " + num);
        RandomSort(m_useList);
        var count = m_useList.Count;

        count = count < num ? count : num;

        Debug.Log("Count "+count);
        for (int i = 0; i < count; i++)
        {
            var card = m_useList[i];
            m_myList.Add(card);
        }

        //RandomSort(m_myList);

        for (int i = 0; i < count; i++)
        {
            var card = m_useList[0];
            m_useList.RemoveAt(0);
        }
    }
    #endregion

    #region 新模式

    private bool startNewMode;
    public void StartNewMode()
    {
        startNewMode = !startNewMode;
        if (startNewMode)
        {
            UISys.ShowTipMsg("开启新模式");
        }
        else
        {
            UISys.ShowTipMsg("回到传统模式");
        }
    }
    #endregion

    #region Boss 接口
    public void InitBoss()
    {
        var currentBoss = TotalKillBossCount;

        var cardData = m_bossList[0];

        BossActor = ActorMgr.Instance.InstanceBossActor(cardData);
        EventCenter.Instance.EventTrigger("RefreshBoss", BossActor);
        EventCenter.Instance.EventTrigger("BossDataRefresh", BossActor);
        SetState(GameState.STATEONE);
    }

    public void AttackBoss(int value)
    {
        SetState(GameState.STATETHREE);

        if (BossActor != null)
        {
            BossActor.Hurt(value);
        }
    }

    private void BossDie(bool beFriend = false)
    {
        TotalKillBossCount++;

        if (TotalKillBossCount >= NeedKillBossCount)
        {
            SetState(GameState.STATEWIN);
            UISys.ShowTipMsg(string.Format("游戏胜利，您已经弑杀了{0}位君主！！！", TotalKillBossCount));
            var ui = UISys.Mgr.ShowWindow<GameWinUI>();
            ui.InitUI(string.Format("游戏胜利，您已经弑杀了{0}位君主！！！", TotalKillBossCount));
            return;
        }

        if (m_bossList.Count <= 0)
        {
            SetState(GameState.STATEWIN);
            UISys.ShowTipMsg("游戏胜利！！！，您已经弑杀了12位君主");
            var ui = UISys.Mgr.ShowWindow<GameWinUI>();
            ui.InitUI(string.Format("游戏胜利，您已经弑杀了{0}位君主！！！", TotalKillBossCount));
            return;
        }

        if (startNewMode)
        {
            UISys.Mgr.ShowWindow<GameChoiceUI>();
        }
        
        if (GameLevel <= 3)
        {
            for (int a = 0; a < 4 - GameLevel; a++)
            {
                m_bossList.RemoveAt(0);
            }
        }
        else
        {
            m_bossList.RemoveAt(0);
        }
        
        if (beFriend)
        {
            if(BossActor.cardData.cardType!=CardType.BLACK_JOKER && BossActor.cardData.cardType != CardType.RED_JOKER)
            {
                UISys.ShowTipMsg("你劝服了这位君主！");
                m_myList.Insert(0,BossActor.cardData);
            }
            //m_curList.Add(BossActor.cardData);
            InitBoss();
        }
        else
        {
            InitBoss();
        }

        
    }
    #endregion

    #region 战斗相关
    /// <summary>
    ///  验证卡是否合法
    /// </summary>
    /// <param name="choiceList"></param>
    /// <returns></returns>
    public bool CheckCardInvild(List<CardData> choiceList)
    {
        var count = choiceList.Count;

        if (count == 1)
        {
            return true;
        }
        else if (count == 2)
        {
            if (choiceList[0].CardValue == choiceList[1].CardValue)                 //连击
            {
                var totalvalue = 0;

                foreach (var data in choiceList)
                {
                    totalvalue += data.CardValue;
                }

                if (totalvalue > 10)
                {
                    return false;
                }

                return true;
            }
            else if (choiceList[0].CardValue == 1 || choiceList[1].CardValue == 1)  //含有宠物牌
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            if (count == 0)
            {
                return true;
            }
            else
            {
                var value = choiceList[0].CardValue;
                for (int i = 0; i < count; i++)
                {
                    if (choiceList[i].CardValue != value)
                    {
                        return false;
                    }
                }

                if (value * count > 10)
                {
                    return false;
                }
            }
        }

        return true;
    }

    public void Attack()
    {
        if (GameApp.Instance.IsGmMode)
        {
            var attackDataGM = new AttackData(GameApp.Instance.IsGmMode);

            m_choiceList.Clear();

            BattleMgr.Instance.ImpactSkill(attackDataGM, BossActor);

            EventCenter.Instance.EventTrigger("RefreshGameUI");
            return;
        }

        if (gameState != GameState.STATEONE)
        {
            UISys.ShowTipMsg(string.Format("当前阶段是：{0}，无法攻击", stateMsgDic[gameState]));
            return;
        }
        if (!CheckCardInvild(m_choiceList))
        {
            UISys.ShowTipMsg("您选择的卡片不符合规定");
            return;
        }

        if (m_choiceList.Count > 0 && m_choiceList[0].IsJoker)
        {
            if (LeftJokerCount <= 0)
            {
                UISys.ShowTipMsg("Joker数目不足");
                return;
            }
        }

        var attackData = BattleMgr.Instance.GenAttackData(m_choiceList);

        if (attackData.HadJoker)
        {
            LeftJokerCount--;
        }

        for (int i = 0; i < m_choiceList.Count; i++)
        {
            var card = m_choiceList[i];

            if (!card.IsJoker)
            {
                m_curList.Remove(card);
            }
        }
        BattleMgr.Instance.ImpactSkill(attackData, BossActor);

        for (int i = 0; i < m_choiceList.Count; i++)
        {
            var card = m_choiceList[i];

            if (!card.IsJoker)
            {
                m_useList.Add(card);
            }
        }

        m_choiceList.Clear();

        AudioMgr.Instance.PlaySound("AttackBoss");

        EventCenter.Instance.EventTrigger("RefreshGameUI");
    }

    private int m_needAbordValue = 0;
    private void Hurt(int value)
    {
        SetState(GameState.STATEFOUR);
        if (BossActor.Atk == 0)
        {
            SetState(GameState.STATEONE);
            UISys.ShowTipMsg("君主攻击无效");
            return;
        }
        else
        {
            int total = 0;
            foreach(CardData dt in m_curList){
                total += dt.CardPower;
            }
            if (total >= value)
            {
                UISys.ShowTipMsg("受到君主的伤害:" + value);
                UISys.ShowTipMsg(string.Format("您需要遗弃:{0}点数的牌", value));
            }
            else if (LeftJokerCount <= 0)
            {
                UISys.Mgr.ShowWindow<GameLoseUI>().InitUI("游戏失败，你被君主击败了！");
                UISys.ShowTipMsg("您已无法承受君主的伤害。");
            }
            else
            {
                UISys.ShowTipMsg("您已无法承受君主的伤害。");
                UISys.ShowTipMsg("已自动消耗一张[JOKER]重置手牌。");
                TurnJokerCard();
                LeftJokerCount--;
                EventCenter.Instance.EventTrigger("RefreshGameUI");
                
            }
        }

        //AudioMgr.Instance.PlaySound("Hurt");
        Debug.Log("Hurt:" + value);
        m_needAbordValue = value;
    }
    #endregion

    #region Card操作
    private void InitTotalCards()
    {
        m_totalList.Clear();
        for (int cardInt = 0; cardInt < TotalCardNum; cardInt++)
        {
            var cardData = CardMgr.Instance.InstanceData(cardInt);

            m_totalList.Add(cardData);
        }
        RandomSort<CardData>(m_totalList);
    }

    private void InitMyCards()
    {
        m_myList.Clear();
        m_bossList.Clear();
        for (int i = 0; i < m_totalList.Count; i++)
        {
            var cardData = m_totalList[i];
            if (cardData.IsBoss)
            {
                m_bossList.Add(cardData);
            }
            else
            {
                m_myList.Add(cardData);
            }
        }
        m_bossList.Sort((CardData a,CardData b) => {
            return a.CardValue.CompareTo(b.CardValue);
        });
        if (GameLevel == 5)
        {
            m_bossList.Sort((CardData a, CardData b) => {
                int xa = 0;
                int xb = 0;
                if (a.cardType == CardType.HEART || a.cardType == CardType.DIAMOND || a.cardType==CardType.RED_JOKER)
                {
                    xa = 1;
                }
                else
                {
                    xa = 0;
                }
                if (b.cardType == CardType.HEART || b.cardType == CardType.DIAMOND || b.cardType == CardType.RED_JOKER)
                {
                    xb = 1;
                }
                else
                {
                    xb = 0;
                }
                return xa.CompareTo(xb);
            });
        }
    }

    
    public void TurnCard()
    {
        List<CardData> temp = new List<CardData>();

        var turnCount = MyMaxCardNum - CurrentCardsNum;
        turnCount = m_myList.Count > turnCount ? turnCount : m_myList.Count;
        for (int i = 0; i < turnCount; i++)
        {
            var card = m_myList[0];
            temp.Add(card);
            m_myList.Remove(card);
        }
        m_curList.AddRange(temp);
    }

    public void TurnJokerCard()
    {
        m_useList.AddRange(m_curList);
        m_curList.Clear();
        TurnCard();
    }
    public void TurnCard(int turnCount)
    {
        List<CardData> temp = new List<CardData>();

        var couldTurnCount = MyMaxCardNum - CurrentCardsNum;

        if (couldTurnCount == 0)
        {
            return;
        }
        turnCount = m_myList.Count > turnCount ? turnCount : m_myList.Count;

        turnCount = couldTurnCount > turnCount ? turnCount : couldTurnCount;
        for (int i = 0; i < turnCount; i++)
        {
            var card = m_myList[0];
            temp.Add(card);
            m_myList.Remove(card);
        }
        m_curList.AddRange(temp);
        //EventCenter.Instance.EventTrigger("RefreshGameUI");
    }

    private int RandomCount = 0;
    public void RandomSort<T>(List<T> list)
    {
        RandomCount++;
        Random random = new Random((int)DateTime.Now.Ticks+ RandomCount);
        Debug.Log((int)DateTime.Now.Ticks);
        int index = 0;
        for (int i = 0; i < list.Count; i++)
        {

            index = random.Next(0, list.Count - 1);
            if (index != i)
            {
                var temp = list[i];
                list[i] = list[index];
                list[index] = temp;
                //(list[i], list[index]) = (list[i], list[index]);
            }
        }
    }
    #endregion

    #region 游戏阶段
    private int m_stateIndex;
    public GameState gameState { private set; get; }

    public enum GameState
    {
        NONE,
        STATEONE,   //阶段一，打出手牌
        STATETWO,   //阶段二，激活技能
        STATETHREE, //阶段三，造成伤害
        STATEFOUR,  //阶段四，承受伤害
        STATEWIN,
    }

    public Dictionary<GameState, string> stateMsgDic = new Dictionary<GameState, string>()
    {
        {GameState.STATEONE,"阶段一，打出手牌"},{GameState.STATETWO,"阶段二，激活技能"},{GameState.STATETHREE,"阶段三，造成伤害"},{GameState.STATEFOUR,"阶段四，承受伤害"}
    };

    public void NextState()
    {
        m_stateIndex++;
        if (m_stateIndex > 4)
        {
            m_stateIndex = 1;
        }
        gameState = (GameState)m_stateIndex;
        EventCenter.Instance.EventTrigger("UpdateGameState");
    }

    public void SetState(GameState state)
    {
        gameState = state;
        m_stateIndex = (int)state;
        UISys.ShowTipMsg("当前阶段:" + GetCurrentStateStr());
        EventCenter.Instance.EventTrigger("UpdateGameState");
        if (gameState == GameState.STATEONE)
        {
            if (m_curList.Count <= 0 && LeftJokerCount <= 0)
            {
                UISys.Mgr.ShowWindow<GameLoseUI>().InitUI("游戏失败，你被君主击败了！");
                UISys.ShowTipMsg("您没有任何牌了。");
            }
        }
    }

    public string GetCurrentStateStr()
    {
        string str = String.Empty;
        stateMsgDic.TryGetValue(gameState, out str);
        return str;
    }

    public string GetCurrentStateStr(GAMESTATE state)
    {
        var _state = (GameState)((int)state+1);
        string str = String.Empty;
        stateMsgDic.TryGetValue(_state, out str);
        return str;
    }

    public void EndGame()
    {
        SetState(GameState.NONE);
    }

    public int GameLevel = 0;
    public void RestartGame()
    {
        var _index = PlayerPrefs.GetInt("GameLevel");
        GameLevel = _index;

        TotalKillBossCount = 0;
        LeftJokerCount = 2;
        switch (GameLevel)
        {
            case 1:
                NeedKillBossCount = 4;
                break;
            case 2:
                NeedKillBossCount = 6;
                break;
            case 3:
                NeedKillBossCount = 12;
                break;
            case 4:
                NeedKillBossCount = 14;
                break;
            case 5:
                NeedKillBossCount = 14;
                break;
        }
        //UISys.ShowTipMsg("重新开始！！");
        
        InitTotalCards();
        InitMyCards();
        m_curList.Clear();
        m_useList.Clear();
        m_choiceList.Clear();
        
        InitBoss();
        TurnCard();
        SetState(GameState.STATEONE);
        EventCenter.Instance.EventTrigger("RefreshGameUI");
        EventCenter.Instance.EventTrigger("GameStart");
    }
    #endregion
}