using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

class LevelChoiceUI : UIWindow
{
    private List<ItemLevel> m_Speciallist = new List<ItemLevel>();
    private List<ItemLevel> m_list = new List<ItemLevel>();
    #region 脚本工具生成的代码
    private GameObject m_itemLevel;
    private Button m_btnClose;
    private Transform m_tfLevel;
    private Text m_textSpecial;
    private Transform m_tfLevelSpecial;
    private GameObject m_goTextNull;
    protected override void ScriptGenerator()
    {
        m_itemLevel = FindChild("m_itemLevel").gameObject;
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_tfLevel = FindChild("m_tfLevel");
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
        m_textSpecial = FindChildComponent<Text>("m_textSpecial");
        m_tfLevelSpecial = FindChild("m_tfLevelSpecial");
        m_goTextNull = FindChild("m_goTextNull").gameObject;
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
        AdjustIconNum(m_list,5,m_tfLevel,m_itemLevel);
        for (int i = 0; i < m_list.Count; i++)
        {
            m_list[i].Init(i);
        }


        AdjustIconNum(m_Speciallist, 1, m_tfLevelSpecial, m_itemLevel);
        for (int i = 0; i < m_Speciallist.Count; i++)
        {
            m_Speciallist[i].Init(9);
        }

        m_itemLevel.gameObject.SetActive(false);
    }

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    #endregion

}

class ItemLevel : UIWindowWidget
{
    #region 脚本工具生成的代码

    private Button m_btn;
    private Transform m_tfContent;
    private Image m_imgIcon;
    private Text m_textRoomInfo;
    private Text m_textNum;
    private Text m_textRoomId;
    protected override void ScriptGenerator()
    {
        m_tfContent = FindChild("m_tfContent");
        m_imgIcon = FindChildComponent<Image>("m_tfContent/m_imgIcon");
        m_textRoomInfo = FindChildComponent<Text>("m_tfContent/m_textRoomInfo");
        m_textNum = FindChildComponent<Text>("m_tfContent/m_textNum");
        m_textRoomId = FindChildComponent<Text>("m_textRoomId");
        m_btn = UnityUtil.GetComponent<Button>(gameObject);
        m_btn.onClick.AddListener(Choice);
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
        var rect = m_tfContent as RectTransform;
        LayoutRebuilder.ForceRebuildLayoutImmediate(rect);
    }

    #region 事件

    private int m_index;

    public void Init(int index)
    {
        m_index = index + 1;
        switch (m_index)
        {
            case 1:
            {
                m_textRoomInfo.text = "入门";
                m_textNum.text = (4).ToString();
                break;
            }
            case 2:
            {
                m_textRoomInfo.text = "简单";
                    m_textNum.text = (6).ToString();
                    break;
            }
            case 3:
            {
                m_textRoomInfo.text = "标准";
                    m_textNum.text = (12).ToString();
                    break;
            }
            case 4:
            {
                m_textRoomInfo.text = "困难";
                    m_textNum.text = (14).ToString();
                    break;
            }
            case 5:
                {
                    m_textRoomInfo.text = "地狱";
                    m_textNum.text = "7+7";
                    break;
                }

            case 10:
            {
                m_textRoomInfo.text = "Roguelike";
                m_textNum.text = "?";
                    break;
            }
        }
    }

    private void Choice()
    {
        PlayerPrefs.SetInt("GameLevel", m_index);
        GameMgr.Instance.RestartGame();
        UISys.Mgr.CloseWindow<LevelChoiceUI>();
    }
    #endregion

}
