using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class GameChoiceUI : UIWindow
{
    private Action m_closeAction;
    private List<ItemCard> m_randLilst = new List<ItemCard>();
    private List<ItemCard> m_mycardLilst = new List<ItemCard>();
    #region 脚本工具生成的代码
    private Button m_btnRestart;
    private GameObject m_itemCard;
    private Transform m_tfMyCardContent;
    private Transform m_tfChoiceContent;
    protected override void ScriptGenerator()
    {
        m_btnRestart = FindChildComponent<Button>("m_btnRestart");
        m_itemCard = FindChild("m_itemCard").gameObject;
        m_tfMyCardContent = FindChild("m_tfMyCardContent");
        m_tfChoiceContent = FindChild("m_tfChoiceContent");
        m_btnRestart.onClick.AddListener(OnClickRestartBtn);
    }
    #endregion

    protected override void OnCreate()
    {
        base.OnCreate();
        Refresh();

    }

    private void Refresh()
    {
        var data = GameMgr.Instance.CurrentCards;
        AdjustIconNum(m_mycardLilst, data.Count, m_tfMyCardContent, m_itemCard);
        m_itemCard.gameObject.SetActive(false);
        for (int i = 0; i < m_mycardLilst.Count; i++)
        {
            m_mycardLilst[i].Init(data[i]);
        }

        var randData = GameMgr.Instance.RandTurnCards();

        AdjustIconNum(m_randLilst, randData.Count, m_tfChoiceContent, m_itemCard);
        m_itemCard.gameObject.SetActive(false);
        for (int i = 0; i < m_randLilst.Count; i++)
        {
            m_randLilst[i].Init(randData[i],true);
        }
        m_itemCard.gameObject.SetActive(false);
    }

    #region 事件
    private void OnClickRestartBtn()
    {
        GameMgr.Instance.RandChangeCards();
        m_closeAction?.Invoke();
    }

    public void RegisterCloseAction(Action callback)
    {
        m_closeAction = callback;
    }
    #endregion

}