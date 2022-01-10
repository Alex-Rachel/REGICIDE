using System;
using UnityEngine;
using UnityEngine.UI;

class SettingUI : UIWindow
{
    #region 脚本工具生成的代码
    private Text m_textBgMusic;
    private Text m_textBtnMusic;
    private Slider m_sliderBg;
    private Slider m_sliderBtn;
    private Button m_btnClose;
    private GameObject m_goDropdown;
    private Dropdown m_Dropdown;
    protected override void ScriptGenerator()
    {
        m_textBgMusic = FindChildComponent<Text>("m_textBgMusic");
        m_textBtnMusic = FindChildComponent<Text>("m_textBtnMusic");
        m_sliderBg = FindChildComponent<Slider>("m_sliderBg");
        m_sliderBtn = FindChildComponent<Slider>("m_sliderBtn");
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_goDropdown = FindChild("m_goDropdown").gameObject;
        m_Dropdown = m_goDropdown.GetComponent<Dropdown>();
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
        m_Dropdown.onValueChanged.AddListener(OnServerChange);
    }

    private void OnServerChange(int arg0)
    {
        GameApp.Instance.hostPoint = (GameApp.HostPoint)arg0;
    }
    #endregion

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    #endregion

}