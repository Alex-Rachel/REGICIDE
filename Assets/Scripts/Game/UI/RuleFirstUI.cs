using System;
using UnityEngine;
using UnityEngine.UI;

class RuleFirstUI : UIWindow
{
    private TypeWriter m_typeWriter;
    #region 脚本工具生成的代码
    private Button m_btnClose;
    private Button m_btnClose2;
    private Text m_textSpecial;
    private Text m_text;
    private GameObject m_goTypeWriter;
    private Button m_btnDontShow;
    protected override void ScriptGenerator()
    {
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_btnClose2 = FindChildComponent<Button>("m_btnClose2");
        m_btnDontShow = FindChildComponent<Button>("m_btnDontShow");
        m_textSpecial = FindChildComponent<Text>("m_textSpecial");
        m_text = FindChildComponent<Text>("ScrollView/Viewport/Content/m_text");
        m_goTypeWriter = FindChild("ScrollView/Viewport/Content/m_text/m_goTypeWriter").gameObject;
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
        m_btnClose2.onClick.AddListener(OnClickCloseBtn);
        m_typeWriter = m_goTypeWriter.GetComponent<TypeWriter>();
        m_btnDontShow.onClick.AddListener((() =>
        {
            PlayerPrefs.SetInt(m_tag, 1);
            Close();
        }));
    }
    #endregion

    private string m_tag;
    public void Init(string tag, string text,bool showOnce = true)
    {
        m_tag = tag;
        if (!text.Equals(String.Empty))
        {
            m_typeWriter.text = text;
        }

        if (showOnce)
        {
            PlayerPrefs.SetInt(m_tag, 1);
            m_btnDontShow.gameObject.SetActive(false);
        }
    }

    protected override void OnCreate()
    {
        base.OnCreate();
    }

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    #endregion

}