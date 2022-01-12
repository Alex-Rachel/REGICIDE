using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class GameGMUI : UIWindow
{
    #region 脚本工具生成的代码
    private Button m_btnClose;
    private GameObject m_goLogin;
    private Button m_btnUseGm;
    private InputField m_inputUserName;
    protected override void ScriptGenerator()
    {
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_goLogin = FindChild("m_goLogin").gameObject;
        m_btnUseGm = FindChildComponent<Button>("m_goLogin/m_btnUseGm");
        m_inputUserName = FindChildComponent<InputField>("m_goLogin/m_inputUserName");
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
        m_btnUseGm.onClick.AddListener(OnClickUseGmBtn);
    }
    #endregion

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    private void OnClickUseGmBtn()
    {
        string gmStr = m_inputUserName.text;
        HandleGM(gmStr);
        m_inputUserName.text = "";
    }

    public void HandleGM(string gmStr)
    {
        var strs = gmStr.Split(':');
        if (strs.Length >= 2)
        {
            var model = strs[0];
            switch (model)
            {
                case "carddiuqi":
                    var countStr = strs[1];
                    int diuqiCount;
                    int.TryParse(countStr, out diuqiCount);
                    if (diuqiCount <= 0)
                    {
                        return;
                    }

                    if (GameMgr.Instance.m_myList.Count <= 0)
                    {
                        return;
                    }

                    diuqiCount = diuqiCount > GameMgr.Instance.m_myList.Count
                        ? GameMgr.Instance.m_myList.Count
                        : diuqiCount;
                    var temp = new List<CardData>();
                    for (int i = 0; i < diuqiCount; i++)
                    {
                        temp.Add(GameMgr.Instance.m_myList[0]);
                        GameMgr.Instance.m_myList.RemoveAt(0);
                    }

                    GameMgr.Instance.m_useList.AddRange(temp);
                    EventCenter.Instance.EventTrigger("RefreshGameUI");
                    break;
            }
        }
    }
    #endregion

}