using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class GameUI : UIWindow
{
    private Animator m_AttackOrAbordAnim;
    private ItemCard m_jokerCard;
    private InventoryUI m_inventoryUI;
    private ItemCard m_bossCard;
    private List<ItemCard> m_cardLilst = new List<ItemCard>();
    private Transform m_tfJoker;
    private Text m_textJoker;
    #region 脚本工具生成的代码
    private GameObject m_goContent;
    private GameObject m_goMiddle;
    private GameObject m_goBottom;
    private GameObject m_itemCard;
    private Transform m_tfContent;
    private Transform m_tfCardContent;
    private Transform m_tfBossContent;

    private GameObject m_goAttackOrAbort;
    private Button m_btnAttack;
    private Button m_btnAbord;

    private Transform m_goInventoryRoot;
    private Button m_btnUsed;
    private Text m_textMuDi;
    private Text m_textLeft;
    private Text m_textLeftKill;
    private Text m_textCurrentKill;
    private Text m_textCurrentLevel;
    private Button m_btnNewMode;
    protected override void ScriptGenerator()
    {
        m_goContent = FindChild("m_goContent").gameObject;
        m_goMiddle = FindChild("m_goContent/m_goMiddle").gameObject;
        m_goBottom = FindChild("m_goContent/m_goBottom").gameObject;
        m_itemCard = FindChild("m_goContent/m_goBottom/m_itemCard").gameObject;
        m_tfContent = FindChild("m_goContent/m_goBottom/ScrollView/Viewport/m_tfContent");
        m_tfCardContent = FindChild("m_goContent/m_goBottom/m_tfCardContent");
        m_tfBossContent = FindChild("m_goContent/m_goMiddle/m_tfBossContent");

        m_goAttackOrAbort = FindChild("m_goContent/m_goMiddle/m_goAttackOrAbort").gameObject;
        m_btnAttack = FindChildComponent<Button>("m_goContent/m_goMiddle/m_goAttackOrAbort/m_btnAttack");
        m_btnAbord = FindChildComponent<Button>("m_goContent/m_goMiddle/m_goAttackOrAbort/m_btnAbord");

        m_goInventoryRoot = FindChild("m_goContent/m_goTop/m_goInventoryRoot");
        m_btnUsed = FindChildComponent<Button>("m_goContent/m_goMiddle/m_btnUsed");
        m_textLeft = FindChildComponent<Text>("m_goContent/m_goMiddle/m_btnLeft/m_textLeft");
        m_textLeftKill = FindChildComponent<Text>("m_goContent/m_goTop/m_textLeftKill");
        m_textCurrentKill = FindChildComponent<Text>("m_goContent/m_goTop/m_textCurrentKill");
        m_textCurrentLevel = FindChildComponent<Text>("m_goContent/m_goTop/m_textCurrentLevel");
        m_textJoker = FindChildComponent<Text>("m_goContent/m_textJoker");
        m_textMuDi = FindChildComponent<Text>("m_goContent/m_goMiddle/m_btnUsed/m_textMuDi");
        m_tfJoker = FindChild("m_goContent/m_tfJoker");
        m_btnNewMode = FindChildComponent<Button>("m_goContent/m_btnNewMode");

        m_btnAttack.onClick.AddListener(Attack);
        m_btnAbord.onClick.AddListener(Abord);
        m_btnUsed.onClick.AddListener(ShowUsed);
        m_btnNewMode.onClick.AddListener((() => { GameMgr.Instance.StartNewMode();}));
        m_inventoryUI = CreateWidgetByType<InventoryUI>(m_goInventoryRoot);
        m_jokerCard = CreateWidgetByType<ItemCard>(m_tfJoker);
        m_AttackOrAbordAnim = m_goAttackOrAbort.GetComponent<Animator>();
    }
    #endregion

    protected override void RegisterEvent()
    {
        base.RegisterEvent();
        EventCenter.Instance.AddEventListener<BossActor>("RefreshBoss", RefreshBoss);
        EventCenter.Instance.AddEventListener("RefreshGameUI", RefreshGameUI);
        EventCenter.Instance.AddEventListener("UpdateGameState", UpdateGameState);
        EventCenter.Instance.AddEventListener("GameStart", GameStart);

    }
    private void GameStart()
    {
        m_btnNewMode.gameObject.transform.localScale = Vector2.one;
    }
    
    protected override void DeRegisterEvent()
    {
        base.DeRegisterEvent();
        EventCenter.Instance.RemoveEventListener<BossActor>("RefreshBoss", RefreshBoss);
        EventCenter.Instance.RemoveEventListener("RefreshGameUI", RefreshGameUI);
        EventCenter.Instance.RemoveEventListener("UpdateGameState", UpdateGameState);
        EventCenter.Instance.RemoveEventListener("GameStart", GameStart);
    }

    private void UpdateGameState()
    {
        if (m_goAttackOrAbort != null)
        {
            if (GameMgr.Instance.gameState == GameMgr.GameState.STATEFOUR)
            {
                m_AttackOrAbordAnim.SetInteger("attack", 0);
            }
            else
            if (GameMgr.Instance.gameState == GameMgr.GameState.STATEONE)
            {
                m_AttackOrAbordAnim.SetInteger("attack", 1);
            }
        }
        if (GameMgr.Instance.gameState == GameMgr.GameState.STATETHREE)
        {
            m_btnNewMode.gameObject.Show(false);
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

    private void Attack()
    {
        GameMgr.Instance.Attack();
    }

    private void Abord()
    {
        EventCenter.Instance.EventTrigger("AbordCard");
    }

    private void ShowUsed()
    {
        UISys.Mgr.ShowWindow<UsedListUI>().InitUI();
    }

    #region 事件
    protected override void OnCreate()
    {
        base.OnCreate();
        GameMgr.Instance.TurnCard();
        GameMgr.Instance.StartNewMode();
        RefreshGameUI();
    }

    private void RefreshGameUI()
    {
        var data = GameMgr.Instance.CurrentCards;

        AdjustIconNum(m_cardLilst, data.Count, m_tfCardContent, m_itemCard);
        m_itemCard.gameObject.SetActive(false);
        for (int i = 0; i < m_cardLilst.Count; i++)
        {
            m_cardLilst[i].Init(data[i]);
        }

        m_textLeft.text = String.Format("酒馆剩余:{0}", GameMgr.Instance.LeftCount);

        m_textLeftKill.text = String.Format("当前击杀君主数目：{0}", GameMgr.Instance.TotalKillBossCount);

        m_textCurrentKill.text = String.Format("剩余击杀君主数目：{0}", GameMgr.Instance.NeedKillBossCount - GameMgr.Instance.TotalKillBossCount);

        string value = string.Empty;

        switch (GameMgr.Instance.GameLevel)
        {
            case 1:
            {
                value = "入门";
                break;
            }
            case 2:
            {
                value = "简单";
                break;
            }
            case 3:
            {
                value = "标准";
                break;
            }
            case 4:
            {
                value = "困难";
                break;
            }
            case 5:
            {
                value = "地狱";
                break;
            }
            case 10:
            {
                value = "RogueLike";
                break;
            }
            case 11:
            {
                value = "Roguelike魂";
                break;
            }
        }

        m_textCurrentLevel.text = String.Format("当前难度：{0}", value);

        m_jokerCard.Init(53);

        m_textJoker.text = string.Format("{0}/{1}",GameMgr.Instance.LeftJokerCount, GameMgr.Instance.TotalJokerCount);

        m_textMuDi.text = string.Format("墓地：{0}", GameMgr.Instance.m_useList.Count);
    }
    #endregion

}

