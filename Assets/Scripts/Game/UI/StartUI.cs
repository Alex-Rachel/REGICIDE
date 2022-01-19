using RegicideProtocol;
using System.Collections;
using UnityEngine;
using UnityEngine;
using UnityEngine.UI;

class StartUI : UIWindow
{
    #region 脚本工具生成的代码
    private Button m_btnConnect;
    private Text m_textStartGame;
    private Button m_btnStartGame;
    private Button m_btnMutiply;
    private Button m_btnRule;
    private Button m_btnCloseAuto;
    protected override void ScriptGenerator()
    {
        m_btnConnect = FindChildComponent<Button>("m_btnConnect");
        m_textStartGame = FindChildComponent<Text>("m_textStartGame");
        m_btnStartGame = FindChildComponent<Button>("m_textStartGame/m_btnStartGame");
        m_btnMutiply = FindChildComponent<Button>("m_btnMutiply");
        m_btnRule = FindChildComponent<Button>("m_btnRule");
        m_btnCloseAuto = FindChildComponent<Button>("m_btnCloseAuto");
        m_btnConnect.onClick.AddListener(OnClickConnectBtn);
        m_btnStartGame.onClick.AddListener(OnClickStartGameBtn);
        m_btnMutiply.onClick.AddListener(OnClickMutiplyBtn);
        m_btnRule.onClick.AddListener(OnClickRuleBtn);
        m_btnCloseAuto.onClick.AddListener((() =>
        {
            PlayerPrefs.SetString("userId", "");
            UISys.ShowTipMsg("清除本地登录数据成功！");
            m_btnCloseAuto.gameObject.Show(false);
        }));
    }
    #endregion
    #region 事件

    protected override void OnCreate()
    {
        base.OnCreate();
        if (!GameDataMgr.Instance.HadCacheLoginData())
        {
            m_btnCloseAuto.gameObject.Show(false);
        }
        else
        {
            m_btnCloseAuto.gameObject.Show(true);
        }

        if (PlayerPrefs.GetInt("FirstShow")!=1)
        {
            StartCoroutine("FirstShow1", ShowUI());
        }
    }

    IEnumerator ShowUI()
    {
        yield return new WaitForSeconds(1.0f);
        UISys.Mgr.ShowWindow<RuleFirstUI>().Init("FirstShow", "");
    }

    private void OnClickRuleBtn()
    {
        UISys.ShowTipMsg("敬请期待~");
    }

    private void OnClickStartGameBtn()
    {
        Close();
        if (GameMgr.Instance.IsLandScape)
        {
            UISys.Mgr.ShowWindow<GameUI>();
        }
        else
        {
            UISys.Mgr.ShowWindow<GameUILand>();
        }
        GameMgr.Instance.RestartGame();
    }
    private void OnClickConnectBtn()
    {
        if (GameClient.Instance.Status != GameClientStatus.StatusConnect)
        {
            WebSocketMgr.Instance.Init((() =>
            {
                if (GameDataMgr.Instance.HadLogin)
                {
                    UISys.ShowTipMsg("您已经登录了");
                    return;
                }

                if (GameDataMgr.Instance.HadCacheLoginData())
                {
                    var userId = PlayerPrefs.GetString("userId");
                    var password = PlayerPrefs.GetString("password");
                    GameDataMgr.Instance.LoginReq(userId, password);
                }
                else
                {
                    UISys.Mgr.ShowWindow<GameLoginUI>();
                }

                if (GameClient.Instance.Status == GameClientStatus.StatusConnect)
                {
                    UISys.ShowTipMsg("您已经连接到了服务器");
                }
            }));
        }
        else
        {
            if (GameDataMgr.Instance.HadLogin)
            {
                UISys.ShowTipMsg("您已经登录了");
                return;
            }

            if (GameDataMgr.Instance.HadCacheLoginData())
            {
                var userId = PlayerPrefs.GetString("userId");
                var password = PlayerPrefs.GetString("password");
                GameDataMgr.Instance.LoginReq(userId, password);
            }
            else
            {
                UISys.Mgr.ShowWindow<GameLoginUI>();
            }
        }
    }

    private void OnClickMutiplyBtn()
    {
        //UISys.ShowTipMsg("敬请期待~");
        //return;
        if (GameDataMgr.Instance.HadLogin)
        {
            Close();
            UISys.Mgr.ShowWindow<RoomUI>();
        }
        else
        {
            UISys.ShowTipMsg("多人模式请登录或注册哦~");
        }
    }
    #endregion
}
