using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class CardListUI : UIWindow
{
    #region 脚本工具生成的代码
    private Transform m_tfContent;
    private GameObject m_itemCard;
    private List<ItemCard> cardLilst = new List<ItemCard>();
    protected override void ScriptGenerator()
    {
        m_tfContent = FindChild("ScrollView/Viewport/m_tfContent");
        m_itemCard = FindChild("m_itemCard").gameObject;
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();

        GameMgr.Instance.TurnCard();
        var data = GameMgr.Instance.CurrentCards;

        AdjustIconNum(cardLilst, data.Count, m_tfContent, m_itemCard);
        m_itemCard.gameObject.SetActive(false);
        for (int i = 0; i < cardLilst.Count; i++)
        {
            cardLilst[i].Init(data[i]);
        }
    }

    #region 事件
    #endregion

}

class ItemCard : UIWindowWidget
{
    private List<Heart> m_listHeart = new List<Heart>();
    private CardData m_cardData;
    private bool m_choice;
    public bool CouldChoice = true;
    protected string m_clickSound = "PlayCard";
    #region 脚本工具生成的代码
    private Image m_imgIcon;
    private GameObject m_goSelect;
    private Button m_btnChoice;

    private GameObject m_goCardInfo;
    private Transform m_tfHeart;
    private GameObject m_goHeart;
    private GameObject m_goInfo;
    private Text m_textAtk;
    private Text m_textDefine;
    private Text m_textInfo;
    private Image m_imgHp;
    private Text m_textCardCount;

    private GameObject m_goBoss;
    private Image m_imgCardValue;
    private Image m_imgCardType;
    private Image m_imgBoss;
    protected override void ScriptGenerator()
    {
        m_imgIcon = FindChildComponent<Image>("m_imgIcon");
        m_goSelect = FindChild("m_goSelect").gameObject;
        m_btnChoice = FindChildComponent<Button>("m_imgIcon");
        m_btnChoice.onClick.AddListener(Choice);

        m_goCardInfo = FindChild("m_goCardInfo").gameObject;
        m_tfHeart = FindChild("m_goCardInfo/m_tfHeart");
        m_goHeart = FindChild("m_goCardInfo/m_tfHeart/m_goHeart").gameObject;
        m_goInfo = FindChild("m_goCardInfo/m_goInfo").gameObject;
        m_textAtk = FindChildComponent<Text>("m_goCardInfo/m_goInfo/m_InfoBlock/m_textAtk");
        m_textDefine = FindChildComponent<Text>("m_goCardInfo/m_goInfo/m_InfoBlock/m_textDefine");
        m_textInfo = FindChildComponent<Text>("m_goCardInfo/m_goInfo/m_InfoBlock/m_textInfo");
        m_imgHp = FindChildComponent<Image>("m_goCardInfo/m_goHp/m_bg/m_imgHp");
        m_textCardCount = FindChildComponent<Text>("m_textCardCount");

        var bosstf = FindChild("m_goBoss");
        if (bosstf != null)
        {
            m_goBoss = bosstf.gameObject;
            m_imgCardValue = FindChildComponent<Image>("m_goBoss/m_imgCardValue");
            m_imgCardType = FindChildComponent<Image>("m_goBoss/m_imgCardType");
            m_imgBoss = FindChildComponent<Image>("m_goBoss/m_imgBoss");
        }
    }
    #endregion


    private bool m_setSound = false;
    protected override void OnVisible()
    {
        base.OnVisible();

        if (m_setSound)
        {
            return;
        }
        m_setSound = true;
        var uiButtonSound = m_btnChoice.gameObject.GetComponent<UIButtonSound>();
        if (uiButtonSound != null)
        {
            uiButtonSound.m_clickSound = m_clickSound;
        }
    }

    #region 事件
    /// <summary>
    /// Joker
    /// </summary>
    /// <param name="index"></param>
    public void Init(int index){
        var sprite = CardMgr.Instance.GetCardSprite("card_"+index);
        if(sprite!= null){
            m_imgIcon.sprite = sprite;
        }

        if (index == 53)
        {
            m_choice = false;
            m_goCardInfo.gameObject.SetActive(false);
            m_cardData = CardMgr.Instance.InstanceData(index);
            Refresh();
        }
    }

    private bool m_isRandomCard;
    private bool IsBoss = false;
    /// <summary>
    /// Cards
    /// </summary>
    /// <param name="data"></param>
    /// <param name="isRandomCard"></param>
    public void Init(CardData data,bool isRandomCard = false)
    {
        m_isRandomCard = isRandomCard;
        m_cardData = data;
        m_imgIcon.sprite = m_cardData.sprite;
        m_choice = false;
        m_goCardInfo.gameObject.SetActive(false);
        Refresh();
    }

    public void Init(RegicideProtocol.CardData data, bool isRandomCard = false)
    {
        CouldChoice = false;
        m_isRandomCard = isRandomCard;
        m_imgIcon.sprite = CardMgr.Instance.GetCardSprite(data.CardInt); ;
        m_choice = false;
        m_goCardInfo.gameObject.SetActive(false);
        Refresh();
    }

    /// <summary>
    /// Boss
    /// </summary>
    /// <param name="actor"></param>
    public void Init(BossActor actor)
    {
        IsBoss = true;
        m_cardData = actor.cardData;
        m_imgIcon.sprite = m_cardData.sprite;
        m_choice = false;
        m_goBoss?.SetActive(false);
        Refresh();

        if (GameMgr.Instance.IsLandScape)
        {
            gameObject.transform.localScale = new Vector3(2, 2, 2);
        }
        else
        {
            gameObject.transform.localScale = new Vector3(3, 3, 3);
        }

        if (m_textInfo!=null)
        {
            switch (m_cardData.cardType)
            {
                case CardType.SPADE:
                    m_textInfo.text = ("当前黑桃 <color=#000000>♠</color> 无效");
                    break;
                case CardType.DIAMOND:
                    m_textInfo.text = ("当前方块 <color=#FF0000>♦</color> 无效");
                    break;
                case CardType.CLUB:
                    m_textInfo.text = ("当前草花 <color=#000000>♣</color> 无效");
                    break;
                case CardType.HEART:
                    m_textInfo.text = ("当前红桃 <color=#FF0000>♥</color> 无效");
                    break;
                case CardType.RED_JOKER:
                    m_textInfo.text =("当前红桃和方块 <color=#FF0000>♥ ♦</color> 无效");
                    m_imgIcon.sprite = CardMgr.Instance.BigJoker;
                    break;
                case CardType.BLACK_JOKER:
                    m_textInfo.text = ("当前黑桃和草花 <color=#000000>♠ ♣</color> 无效");
                    break;
            }
        }

        if (m_goBoss != null && /*(m_cardData.cardType != CardType.RED_JOKER) && */(m_cardData.cardType != CardType.BLACK_JOKER))
        {
            m_goBoss.SetActive(true);
            m_imgIcon.gameObject.SetActive(false);

            if (m_cardData.cardType == CardType.RED_JOKER)
            {
                var strBoss = "BOSSBIGJOKER";
                m_imgBoss.sprite = CardMgr.Instance.GetCardSprite(strBoss);
                m_imgBoss.SetNativeSize();
                m_imgBoss.transform.localScale = new Vector2(0.3f, 0.3f);
                m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("Joker");
                m_imgCardType.gameObject.SetActive(false);
                return;
            }

            var str = "BOSS" + ((CardValue)actor.cardData.CardValue).ToString() + actor.cardType.ToString()[0];
            m_imgBoss.sprite = CardMgr.Instance.GetCardSprite(str);
            m_imgBoss.SetNativeSize();
            m_imgBoss.transform.localScale = new Vector2(0.22f, 0.22f);
            m_imgCardValue.gameObject.SetActive(true);
            switch (m_cardData.cardType)
            {
                case CardType.SPADE:
                    m_imgCardType.sprite = CardMgr.Instance.GetCardSprite("S");
                    switch ((CardValue)actor.cardData.CardValue)
                    {
                        case CardValue.J:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("JB");
                                break;
                        }
                        case CardValue.Q:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("QB");
                                break;
                        }
                        case CardValue.K:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("KB");
                                break;
                        }
                    }
                    break;
                case CardType.DIAMOND:
                    m_imgCardType.sprite = CardMgr.Instance.GetCardSprite("D");
                    switch ((CardValue)actor.cardData.CardValue)
                    {
                        case CardValue.J:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("JR");
                            break;
                        }
                        case CardValue.Q:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("QR");
                            break;
                        }
                        case CardValue.K:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("KR");
                            break;
                        }
                    }
                    break;
                case CardType.CLUB:
                    m_imgCardType.sprite = CardMgr.Instance.GetCardSprite("C");
                    switch ((CardValue)actor.cardData.CardValue)
                    {
                        case CardValue.J:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("JB");
                            break;
                        }
                        case CardValue.Q:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("QB");
                            break;
                        }
                        case CardValue.K:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("KB");
                            break;
                        }
                    }
                    break;
                case CardType.HEART:
                    m_imgCardType.sprite = CardMgr.Instance.GetCardSprite("H");
                    switch ((CardValue)actor.cardData.CardValue)
                    {
                        case CardValue.J:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("JR");
                            break;
                        }
                        case CardValue.Q:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("QR");
                            break;
                        }
                        case CardValue.K:
                        {
                            m_imgCardValue.sprite = CardMgr.Instance.GetCardSprite("KR");
                            break;
                        }
                    }
                    break;
            }
        }
        else
        {
            m_goBoss.gameObject.SetActive(false);
            m_imgIcon.gameObject.SetActive(true);
        }

        if (GameOnlineMgr.Instance.CurrentBossBeJokerAtk)
        {
            m_textInfo.text = string.Format("当前Boss技能已无效！");
        }

        m_goCardInfo.gameObject.SetActive(true);
        BossDataRefresh(actor);
        RegisterBossEvent();
    }

    private bool hadRegister;
    protected void RegisterBossEvent()
    {
        if (hadRegister)
        {
            return;
        }
        hadRegister = true;
        EventCenter.Instance.AddEventListener<BossActor>("BossDataRefresh", BossDataRefresh);
    }

    private void BossDataRefresh(BossActor actor)
    {
        if (gameObject == null)
        {
            return;
        }

        m_goHeart.SetActive(false);
        m_textAtk.text = "攻击：" + actor.Atk;
        m_textDefine.text = "生命：" + actor.Hp;

        m_imgHp.fillAmount = (float)actor.Hp / (float)actor.MaxHp;
    }
    #endregion

    #region 联机的初始化

    private List<CardData> m_onlineCardDatas;
    private bool m_isOnlieCards;
    /// <summary>
    /// 联机中其他人卡牌的初始化
    /// </summary>
    public void Init(List<CardData> list,bool other = true)
    {
        m_onlineCardDatas = list;

        m_isOnlieCards = true;

        m_textCardCount.gameObject.SetActive(true);

        m_textCardCount.text = string.Format("剩余：{0}",list.Count);
    }

    #endregion

    private void Choice()
    {
        if (!CouldChoice)
        {
            return;
        }
        if (m_isOnlieCards)
        {
            UISys.ShowTipMsg("不能查看他人的牌哦~");
            return;
            UISys.Mgr.ShowWindow<OtherListUI>().Init(m_onlineCardDatas);
            return;
        }

        if (IsBoss)
        {
            return;
        }
        m_choice = !m_choice;
        Refresh();
    }

    private void Refresh()
    {
        if (gameObject == null)
        {
            return;
        }

        if (m_choice)
        {
            if (m_isRandomCard)
            {
                EventCenter.Instance.EventTrigger<CardData>("ChoiceRandom", m_cardData);
            }
            else
            {
                EventCenter.Instance.EventTrigger<CardData>("Choice", m_cardData);
            }
            this.gameObject.transform.localScale = new Vector3(1.2f, 1.2f, 1.2f);
            m_goSelect?.gameObject.SetActive(true);
        }
        else
        {
            if (m_isRandomCard)
            {
                EventCenter.Instance.EventTrigger<CardData>("DeChoiceRandom", m_cardData);
            }
            else
            {
                EventCenter.Instance.EventTrigger<CardData>("DeChoice", m_cardData);
            }
            this.gameObject.transform.localScale = new Vector3(1, 1, 1);
            m_goSelect?.gameObject.SetActive(false);
        }
    }
}

class Heart : UIWindowWidget
{

}