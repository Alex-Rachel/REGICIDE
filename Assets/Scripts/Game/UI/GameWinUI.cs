using UnityEngine;
using UnityEngine.UI;

class GameWinUI : UIWindow
{
    #region 脚本工具生成的代码
    private Text m_textWinGame;
    private Button m_btnRestart;
    private Button m_btnPushRank;
    private Button m_btnLeave;
    protected override void ScriptGenerator()
    {
        m_textWinGame = FindChildComponent<Text>("m_textWinGame");
        m_btnRestart = FindChildComponent<Button>("m_btnRestart");
        m_btnPushRank = FindChildComponent<Button>("m_btnPushRank");
        m_btnLeave = FindChildComponent<Button>("m_btnLeave");
        m_btnRestart.onClick.AddListener(OnClickRestartBtn);
        m_btnPushRank.onClick.AddListener(OnClickPushRankBtn);
        m_btnLeave.onClick.AddListener(() =>
        {
            RoomDataMgr.Instance.ExitRoomReq();
        });
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
        var rankIndex = GameMgr.Instance.GameLevel;

        if (GameDataMgr.Instance.HadLogin && !GameOnlineMgr.Instance.IsOnlineGameIng)
        {
            m_btnPushRank.gameObject.SetActive(false);
            if (rankIndex >= 3 )
            {
                var userId = GameOnlineMgr.Instance.MyActorId;
                var completeType = -GameMgr.Instance.LeftJokerCount + 3;
                RankDataMgr.Instance.PushRankData(rankIndex, userId, completeType);
            }
        }

        if (!GameDataMgr.Instance.HadLogin)
        {
            if (rankIndex < 3)
            {
                m_btnPushRank.gameObject.SetActive(false);
            }
        }

        if (!GameOnlineMgr.Instance.IsOnlineGameIng)
        {
            m_btnLeave.gameObject.Show(false);
        }
        else
        {
            m_btnLeave.gameObject.Show(true);
        }
    }

    public void InitUI(string msg)
    {
        m_textWinGame.text = msg;
        MonoManager.Instance.GC();
    }

    #region 事件
    private void OnClickRestartBtn()
    {
        Close();

        if (!GameOnlineMgr.Instance.IsOnlineGameIng)
        {
            GameMgr.Instance.RestartGame();
        }
        else
        {
            UISys.Mgr.CloseWindow<GameOnlineUI>();
            UISys.Mgr.CloseWindow<GameOnlineUILand>();
            RoomDataMgr.Instance.ExitRoomReq();
        }
    }
    private void OnClickPushRankBtn()
    {
        if (!GameDataMgr.Instance.HadLogin)
        {
            WebSocketMgr.Instance.Init((() =>
            {
                if (GameDataMgr.Instance.HadCacheLoginData())
                {
                    var userId = PlayerPrefs.GetString("userId");
                    var password = PlayerPrefs.GetString("password");
                    GameDataMgr.Instance.LoginReq(userId, password,(() => {Push();}));
                }
                else
                {
                    var ui = UISys.Mgr.ShowWindow<GameLoginUI>();
                    ui.CloseCallBack = () => { Push(); };
                }
            }));
        }
    }

    private void Push()
    {
        if (GameDataMgr.Instance.HadLogin)
        {
            m_btnPushRank.gameObject.SetActive(false);
            var rankIndex = GameMgr.Instance.GameLevel;
            var userId = GameOnlineMgr.Instance.MyActorId;
            var completeType = -GameMgr.Instance.LeftJokerCount + 3;
            RankDataMgr.Instance.PushRankData(rankIndex, userId, completeType);
        }
    }
    #endregion

}