using System;
using System.Collections.Generic;

public class PlayerFeatureConfigMgr : Singleton<PlayerFeatureConfigMgr>
{
    private Dictionary<string, PlayerFeatureConfig> m_dictFeatureBaseConfig = new Dictionary<string, PlayerFeatureConfig>();
    private List<PlayerFeatureConfig> m_listPlayerFeatureConfig = new List<PlayerFeatureConfig>();
    private Dictionary<FeatureRate, PlayerFeatureConfig> m_randPlayerFeatureConfig = new Dictionary<FeatureRate, PlayerFeatureConfig>();
    public List<PlayerFeatureConfig> PlayerFeatureConfigList
    {
        get { return m_listPlayerFeatureConfig; }
    }
    private int RankdTotalRate = 0;

    /// <summary>
    /// 一开始可选择的玩家特性
    /// </summary>
    private List<PlayerFeatureConfig> m_listPlayerFeatureChoiceList = new List<PlayerFeatureConfig>();
    /// <summary>
    /// 一开始可选择的玩家特性
    /// </summary>
    public List<PlayerFeatureConfig> PlayerFeatureChoiceList
    {
        get { return m_listPlayerFeatureChoiceList; }
    }

    public PlayerFeatureConfigMgr()
    {
        m_dictFeatureBaseConfig = ResConfigUtil.ReadConfigRes<PlayerFeatureConfig>("PlayerFeatureConfig");
        if (m_dictFeatureBaseConfig != null)
        {
            foreach (var config in m_dictFeatureBaseConfig)
            {
                m_listPlayerFeatureConfig.Add(config.Value);

                if (config.Value.Start == 1)
                {
                    m_listPlayerFeatureChoiceList.Add(config.Value);
                }
            }
        }

        InitRandConfig();
    }

    private void InitRandConfig()
    {
        foreach (var config in m_listPlayerFeatureConfig)
        {
            if ((int)config.Rate <=0)
            {
                continue;
            }
            FeatureRate featureRate = new FeatureRate(RankdTotalRate, RankdTotalRate + (int)config.Rate);
            RankdTotalRate += (int)config.Rate;
            if (!PlayerFeatureChoiceList.Contains(config))
            {
                m_randPlayerFeatureConfig.Add(featureRate, config);
            }
        }
    }

    public int FeatureCount
    {
        get
        {
            return m_dictFeatureBaseConfig.Count;
        }
    }

    public Dictionary<string, PlayerFeatureConfig> GetPlayerFeatureConfigs()
    {
        return m_dictFeatureBaseConfig;
    }

    public PlayerFeatureConfig GetPlayerFeatureConfig(int id)
    {
        if (m_dictFeatureBaseConfig.ContainsKey(id.ToString()))
        {
            return m_dictFeatureBaseConfig[id.ToString()];
        }
        return null;
    }

    private int randCount;
    public PlayerFeatureConfig RandPlayerFeatureConfig()
    {
        randCount++;

        Random ran = new Random((int)DateTime.Now.Ticks + randCount);

        var idx = ran.Next(0, RankdTotalRate);

        foreach (var ctx in m_randPlayerFeatureConfig)
        {
            var rate = ctx.Key;
            if (idx >= rate.pre && idx < rate.next)
            {
                return ctx.Value;
            }
        }

        return null;
    }

    public struct FeatureRate
    {
        public int pre;
        public int next;

        public FeatureRate(int pre, int next)
        {
            this.pre = pre;
            this.next = next;
        }
    }
}

