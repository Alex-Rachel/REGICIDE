using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class RankListUI : UIWindow
{
    private List<ItemRank> m_itemRanks = new List<ItemRank>();
    private List<ItemRankLevel> m_levels = new List<ItemRankLevel>();
    #region 脚本工具生成的代码
    private Transform m_tfContent;
    private GameObject m_itemRank;
    private Button m_btnClose;
    private Text m_textSpecial;
    private GameObject m_goTextNull;
    private Transform m_tfLevel;
    private GameObject m_itemLevel;
    protected override void ScriptGenerator()
    {
        m_tfContent = FindChild("ScrollView/Viewport/m_tfContent");
        m_itemRank = FindChild("m_itemRank").gameObject;
        m_btnClose = FindChildComponent<Button>("m_btnClose");
        m_textSpecial = FindChildComponent<Text>("m_textSpecial");
        m_goTextNull = FindChild("m_goTextNull").gameObject;
        m_tfLevel = FindChild("m_tfLevel");
        m_itemLevel = FindChild("m_tfLevel/m_itemLevel").gameObject;
        m_btnClose.onClick.AddListener(OnClickCloseBtn);
    }
    #endregion

    private int rankIndex = 1;
    protected override void OnCreate()
    {
        base.OnCreate();
        m_itemLevel.gameObject.SetActive(false);
        m_itemRank.gameObject.SetActive(false);
        RankDataMgr.Instance.GetRankDatas(rankIndex);
        AdjustIconNum(m_levels, 5, m_tfLevel, m_itemLevel);
        for (int i = 0; i < m_levels.Count; i++)
        {
            m_levels[i].Init(i+3);
        }
    }

    protected override void RegisterEvent()
    {
        base.RegisterEvent();
        EventCenter.Instance.AddEventListener<List<RankData>>("RefreshRankList", Refresh);
        EventCenter.Instance.AddEventListener<int>("RankGet", GetData);
    }

    private void GetData(int index)
    {
        RankDataMgr.Instance.GetRankDatas(index);
    }

    private void Refresh(List<RankData> rankDatas)
    {
        var count = rankDatas.Count;
        if (count<=0)
        {
            m_goTextNull.SetActive(true);
        }
        else
        {
            m_goTextNull.SetActive(false);
        }
        AdjustIconNum(m_itemRanks, count, m_tfContent,m_itemRank);
        for (int i = 0; i < count; i++)
        {
            m_itemRanks[i].Init(rankDatas[i],i+1);
        }
    }

    protected override void DeRegisterEvent()
    {
        base.DeRegisterEvent();
        EventCenter.Instance.RemoveEventListener<List<RankData>>("RefreshRankList",Refresh);
        EventCenter.Instance.RemoveEventListener<int>("RankGet",GetData);
    }

    #region 事件
    private void OnClickCloseBtn()
    {
        Close();
    }
    #endregion

}



class ItemRank : UIWindowWidget
{
    #region 脚本工具生成的代码
    private Transform m_tfContent;
    private Image m_imgIcon;
    private Text m_textUserName;
    private Text m_textNum;
    private Text m_textRoomId;
    private Text m_textRankIndex;
    protected override void ScriptGenerator()
    {
        m_tfContent = FindChild("m_tfContent");
        m_imgIcon = FindChildComponent<Image>("m_tfContent/m_imgIcon");
        m_textUserName = FindChildComponent<Text>("m_tfContent/m_textUserName");
        m_textNum = FindChildComponent<Text>("m_tfContent/m_textNum");
        m_textRoomId = FindChildComponent<Text>("m_textRoomId");
        m_textRankIndex = FindChildComponent<Text>("m_tfContent/m_textRankIndex");
    }
    #endregion

    public void Init(RankData data,int rankIndex)
    {
        m_textUserName.text = data.name;
        m_textRankIndex.text = rankIndex.ToString();

        if (data.isOnline)
        {
            var timeSpan = TimeSpan.FromSeconds(data.time);

            if (timeSpan.Days > 0)
            {
                m_textNum.text = string.Format("<color=#FFC200>通关时间:{0}{1:D2}:{2:D2}:{3:D2}", string.Format("{0}天</color>", timeSpan.Days),
                    timeSpan.Hours, timeSpan.Minutes, timeSpan.Seconds);
            }
            else
            {
                m_textNum.text = string.Format("<color=#FFC200>通关时间:{0:D2}:{1:D2}:{2:D2}</color>", timeSpan.Hours, timeSpan.Minutes, timeSpan.Seconds);
            }
            return;
        }
        m_textNum.text = String.Format("<color=#FFC200>金奖:{0}</color> <color=#FFF2C7>银奖:{1}</color> <color=#B09544>铜奖:{2}</color>", data.GoldCount,data.YinCount,data.TongCount);
    }

    #region 事件
    #endregion

}


class ItemRankLevel : UIWindowWidget
{
    #region 脚本工具生成的代码
    private Text m_textLevel;
    private Button m_btn;
    protected override void ScriptGenerator()
    {
        m_textLevel = FindChildComponent<Text>("m_textLevel");
        m_btn = UnityUtil.GetComponent<Button>(gameObject);
        m_btn.onClick.AddListener((() =>
        {
            EventCenter.Instance.EventTrigger("RankGet",m_index);
        }));
    }
    #endregion

    private int m_index = 0;
    #region 事件
    public void Init(int value)
    {
        m_index = value;
        switch (value)
        {
            case 1:
            {
                m_textLevel.text = "入门";
                break;
            }
            case 2:
            {
                m_textLevel.text = "简单";
                break;
            }
            case 3:
            {
                m_textLevel.text = "标准";
                break;
            }
            case 4:
            {
                m_textLevel.text = "困难";
                break;
            }
            case 5:
            {
                m_textLevel.text = "地狱";
                break;
            }
            case 6:
            {
                m_textLevel.text = "魂";
                break;
            }
            case 7:
            {
                m_textLevel.text = "联机";
                break;
            }
        }
    }
    #endregion

}
