using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class FeatureChoiceUI : UIWindow
{
    private Action m_action;
    private List<ItemFeature> m_list = new List<ItemFeature>();
    #region 脚本工具生成的代码
    private Button m_btnChoice;
    private Text m_textRandFeature;
    private Transform m_tfMyFeatureContent;
    private GameObject m_itemFeature;
    private Transform m_tfContent;
    protected override void ScriptGenerator()
    {
        m_btnChoice = FindChildComponent<Button>("m_btnChoice");
        m_textRandFeature = FindChildComponent<Text>("m_textRandFeature");
        m_tfMyFeatureContent = FindChild("m_tfMyFeatureContent");
        m_tfContent = FindChild("ScrollView/Viewport/m_tfContent");
        m_itemFeature = FindChild("m_itemFeature").gameObject;
        m_btnChoice.onClick.AddListener(OnClickChoiceBtn);
    }
    #endregion

    public void RegisterCloseBack(Action callback)
    {
        if (callback != null)
        {
            m_action = callback;
        }
    }

    protected override void OnCreate()
    {
        base.OnCreate();
        var list = PlayerFeatureConfigMgr.Instance.PlayerFeatureChoiceList;
        AdjustIconNum(m_list,list.Count, m_tfContent, m_itemFeature);
        for (int i = 0; i < m_list.Count; i++)
        {
            m_list[i].Init(list[i]);
        }
        m_itemFeature.gameObject.SetActive(false);
    }

    #region 事件
    public void OnClickChoiceBtn()
    {
        Close();
        if (m_action!= null)
        {
            m_action();
            m_action = null;
        }
    }
    #endregion

}

class ItemFeature : UIWindowWidget
{
    private Button m_btn;
    #region 脚本工具生成的代码
    private Transform m_tfContent;
    private Image m_imgIcon;
    private Text m_textFeatureName;
    private Text m_textFeatureDecs;
    private Text m_textFeatureSlot;
    private PlayerFeatureConfig m_config;
    protected override void ScriptGenerator()
    {
        m_btn = gameObject.GetComponent<Button>();
        m_tfContent = FindChild("m_tfContent");
        m_imgIcon = FindChildComponent<Image>("m_tfContent/m_imgIcon");
        m_textFeatureName = FindChildComponent<Text>("m_tfContent/m_textFeatureName");
        m_textFeatureDecs = FindChildComponent<Text>("m_tfContent/m_textFeatureDecs");
        m_textFeatureSlot = FindChildComponent<Text>("m_tfContent/m_textFeatureSlot");
        m_btn.onClick.AddListener(OnClick);
    }
    #endregion

    public void Init(PlayerFeatureConfig config)
    {
        m_config = config;
        m_textFeatureDecs.text = config.Desc;
        m_textFeatureName.text = (config.UseColor==1)? config.Name.ToColor(config.ColorStr) : config.Name;
        m_textFeatureSlot.text = config.Slot + "格";
    }
    #region 事件
    private void OnClick()
    {
        var leftSlot = RogueLikeMgr.Instance.playerData.LeftFeatureSlot;
        if (leftSlot>=m_config.Slot)
        {
            RogueLikeMgr.Instance.AddFeature(m_config);
            UISys.Mgr.GetWindow<FeatureChoiceUI>().OnClickChoiceBtn();
        }
        else
        {
            UISys.ShowTipMsg("天赋格子不足");
        }
    }
    #endregion

}
