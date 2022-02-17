using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class UsedListUI : UIWindow
{
    private List<ItemCard> m_items = new List<ItemCard>();
    #region 脚本工具生成的代码
    private Transform m_tfContent;
    private Button m_btnClose;
    private GameObject m_ItemCard;
    protected override void ScriptGenerator()
    {
        m_tfContent = FindChild("ScrollView/Viewport/m_tfContent");
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
        m_ItemCard = FindChild("ItemCard").gameObject;
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
       
        m_ItemCard.gameObject.SetActive(false);
    }

    public void InitUI()
    {
        var list = GameMgr.Instance.UseCardDatas;
        AdjustIconNum(m_items, list.Count, m_tfContent, m_ItemCard);
        for (int i = 0; i < m_items.Count; i++)
        {
            m_items[i].Init(list[i]);
            m_items[i].CanDrag = false;
            m_items[i].CouldChoice = false;
        }
    }

    public void InitOnlineUI()
    {
        var list = GameOnlineMgr.Instance.MuDiCardDatas;
        AdjustIconNum(m_items, list.Count, m_tfContent, m_ItemCard);
        for (int i = 0; i < m_items.Count; i++)
        {
            m_items[i].Init(list[i]);
        }
    }

    public void InitWorldUI()
    {
        var list = GameMgr.Instance.m_myList;
        AdjustIconNum(m_items, list.Count, m_tfContent, m_ItemCard);
        for (int i = 0; i < m_items.Count; i++)
        {
            m_items[i].Init(list[i]);
            m_items[i].CanDrag = false;
            m_items[i].CouldChoice = false;
        }
    }

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    #endregion

}