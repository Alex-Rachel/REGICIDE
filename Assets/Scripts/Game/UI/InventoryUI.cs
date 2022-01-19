using UnityEngine;
using UnityEngine.UI;

class InventoryUI : UIWindowWidget
{
    #region 脚本工具生成的代码
    private Transform m_tfInventoryList;
    private Button m_btnBack;
    private Button m_btnSetting;
    private Button m_btnRestart;
    private Button m_btnMenu;
    private Button m_btnChoiceLv;
    private Button m_btnRank;
    private Button m_btnLeft;
    private Button m_btnRight;
    private Button m_btnGM;
    protected override void ScriptGenerator()
    {
        m_tfInventoryList = FindChild("m_tfInventoryList");
        m_btnBack = FindChildComponent<Button>("m_tfInventoryList/m_btnBack");
        m_btnSetting = FindChildComponent<Button>("m_tfInventoryList/m_btnSetting");
        m_btnRestart = FindChildComponent<Button>("m_tfInventoryList/m_btnRestart");
        m_btnMenu = FindChildComponent<Button>("m_tfInventoryList/m_btnMenu");
        m_btnChoiceLv = FindChildComponent<Button>("m_tfInventoryList/m_btnChoiceLv");
        m_btnRank = FindChildComponent<Button>("m_tfInventoryList/m_btnRank");
        m_btnLeft = FindChildComponent<Button>("m_btnLeft");
        m_btnRight = FindChildComponent<Button>("m_btnRight");
        m_btnGM = FindChildComponent<Button>("m_tfInventoryList/m_btnGM");
        m_btnBack.onClick.AddListener(OnClickBackBtn);
        m_btnSetting.onClick.AddListener(OnClickSettingBtn);
        m_btnRestart.onClick.AddListener(OnClickRestartBtn);
        m_btnMenu.onClick.AddListener(OnClickMenuBtn);
        m_btnChoiceLv.onClick.AddListener(OnClickChoiceLvBtn);
        m_btnRank.onClick.AddListener(OnClickRankBtn);
        m_btnLeft.onClick.AddListener(OnClickLeftBtn);
        m_btnRight.onClick.AddListener(OnClickRightBtn);
        m_btnGM.onClick.AddListener((() =>
        {
            UISys.Mgr.ShowWindow<GameGMUI>();
        }));
    }

    protected override void OnCreate()
    {
        base.OnCreate();
        var userId = PlayerPrefs.GetString("userId");
        if (userId == "574809918" || userId == "222")
        {
            m_btnGM.gameObject.Show(true);
        }
        else
        {
            m_btnGM.gameObject.Show(false);
        }
    }

    #endregion

    #region 事件
    private void OnClickBackBtn()
    {
        Close();
        if (GameMgr.Instance.IsLandScape)
        {
            UISys.Mgr.CloseWindow<GameUI>();
            UISys.Mgr.CloseWindow<GameUILand>();
            UISys.Mgr.ShowWindow<StartUI>();

        }
        else
        {
            UISys.Mgr.CloseWindow<GameUI>();
            UISys.Mgr.CloseWindow<GameUILand>();
            UISys.Mgr.ShowWindow<StartUILand>();
        }
    }
    private void OnClickSettingBtn()
    {
        UISys.Mgr.ShowWindow<SettingUI>();
    }
    private void OnClickRestartBtn()
    {
        GameMgr.Instance.RestartGame();
    }

    /// <summary>
    /// 多人游戏
    /// </summary>
    private void OnClickMenuBtn()
    {
        //UISys.ShowTipMsg("敬请期待");
        if (GameDataMgr.Instance.HadLogin)
        {
            UISys.Mgr.CloseWindow<GameUI>();
            UISys.Mgr.CloseWindow<GameUILand>();
            UISys.Mgr.ShowWindow<RoomUI>();
        }
        else
        {
            UISys.ShowTipMsg("多人模式请先登录或注册哦~");
        }
    }
    private void OnClickChoiceLvBtn()
    {
        UISys.Mgr.ShowWindow<LevelChoiceUI>();
    }
    private void OnClickRankBtn()
    {
        //UISys.ShowTipMsg("敬请期待");
        UISys.Mgr.ShowWindow<RankListUI>();
    }
    private void OnClickLeftBtn()
    {
    }
    private void OnClickRightBtn()
    {
    }
    #endregion

}
