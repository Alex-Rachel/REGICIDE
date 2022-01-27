using System;
using System.Collections.Generic;
using UnityEngine;


enum LevelStatus
{
    StatusInit,
    StatusLoading,
    StatusLoadingErr,
    StatusLoaded,
    StatusWaitFinStage, //等待结束stage
    StatusFinStage,     //已经结束stage
    StatusWaitGoNext,   //等待到下一关
    StatusWaitExitHome, //等待结束到home
}

/*玩法逻辑类型*/
public enum LevelLogicType
{
    BaseType = 0,
    SoloLevelType = 1,    /*普通*/
    CompLevelType = 2,    /*pvp*/
};

/*难度类型*/
public enum LevelDiffType
{
    BaseType = 0,
    FirstType = 1,    /*入门*/
    EasyType = 2,    /*简单*/
    NormalType = 3,    /*标准*/
    HardType = 4,    /*困难*/
    HellType = 5,    /*地狱*/
};

class LevelMgr : Singleton<LevelMgr>
{
    private LevelStatus m_status = LevelStatus.StatusInit;

    public LevelStatus Status
    {
        get { return m_status; }
        set
        {
            if (m_status != value)
            {
                m_status = value;
                // m_timeoutRetryCount = 0;
                // RefreshStatusTime();
            }
        }
    }

    private int m_curLevelIndex = 0;
    private int[] m_curLevelArr;

    private DiffcultConfig m_diffCfg;

    public void StartLevel(LevelDiffType diffType)
    {
        m_diffCfg = DiffcultConfigMgr.Instance.GetDiffCfg((int)diffType);

        if (m_diffCfg == null)
        {
            Debug.LogErrorFormat("无此难度配置：{0}", diffType);
            return;
        }

        m_curLevelArr = m_diffCfg.LevelArray;
        var _index = PlayerPrefs.GetInt("GameLevel");
        _index = 0;
        if (_index >= m_curLevelArr.Length)
        {
            Debug.LogWarningFormat("未找到关卡ID：{0}", _index);
        }
        m_curLevelIndex = m_curLevelArr[_index];

        Status = LevelStatus.StatusLoading;
        //创建地图资源，初始化地图表现
        InitMap();

        InitBattleCore(m_curLevelIndex);
        Status = LevelStatus.StatusLoaded;
    }

    /// <summary>
    /// 地图场景
    /// </summary>
    private void InitMap()
    {
        //bool isGuideChapter = GuideSys.Instance.CheckIsGuideChapter(BattleSys.Instance.GetCurChapterCfg().ChapterID);
        //bool isNextBoss = IsNextBossLevel();
        //bool bShowBossIcon = isNextBoss && !isGuideChapter;
        //bool bShowLevelNum = !isNextBoss && !isGuideChapter;
        //bool bShowTongGuan = IsLastLevel() && !isGuideChapter;
        //var succ = m_mapCreater.CreateMapObj(MapResIdx, BattleSys.Instance.TransSceneRoot, bShowBossIcon, bShowLevelNum, bShowTongGuan, (progress + 1).ToString());
        //if (!succ)
        //{
        //    return;
        //}

        //GameEvent.Get<IBattleLogic>().ShowBossHpBar(IsBossLevel(), IsBossLevel());

    }

    private void InitBattleCore(int levelID)
    {
        var param = new StartLevelParam();
        param.m_levelID = (uint)levelID;
        param.LevelType = (int)LevelLogicType.SoloLevelType;
        BattleCoreSys.Instance.InitBattle(param);
    }

}

