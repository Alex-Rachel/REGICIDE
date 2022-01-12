using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class GameLoseUI : UIWindow
{

    #region 脚本工具生成的代码
    private Text m_textWinGame;
    private Button m_btnRestart;
    private Button m_btnLeave;
    protected override void ScriptGenerator()
    {
        m_textWinGame = FindChildComponent<Text>("m_textWinGame");
        m_btnRestart = FindChildComponent<Button>("m_btnRestart");
        m_btnLeave = FindChildComponent<Button>("m_btnLeave");
        m_btnRestart.onClick.AddListener(OnClickRestartBtn);
        m_btnLeave.onClick.AddListener(() =>
        {
            RoomDataMgr.Instance.ExitRoomReq();
        });
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
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
    #endregion
}