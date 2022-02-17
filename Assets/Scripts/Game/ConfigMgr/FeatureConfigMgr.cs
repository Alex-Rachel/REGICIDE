using System;
using System.Collections.Generic;

public class FeatureConfigMgr : Singleton<FeatureConfigMgr>
{
    private Dictionary<string, FeatureConfig> m_dictFeatureBaseConfig = new Dictionary<string, FeatureConfig>();
    private List<FeatureConfig> m_listFeatureConfig = new List<FeatureConfig>();
    private Dictionary<FeatureRate, FeatureConfig> m_randFeatureConfig = new Dictionary<FeatureRate, FeatureConfig>();
    public List<FeatureConfig> FeatureConfigList
    {
        get { return m_listFeatureConfig; }
    }
    private int RankdTotalRate = 0;

    public FeatureConfigMgr()
    {
        m_dictFeatureBaseConfig = ResConfigUtil.ReadConfigRes<FeatureConfig>("FeatureConfig");
        if (m_dictFeatureBaseConfig != null)
        {
            foreach (var config in m_dictFeatureBaseConfig)
            {
                m_listFeatureConfig.Add(config.Value);
            }
        }

        InitRandConfig();
    }

    private void InitRandConfig()
    {
        foreach (var config in m_listFeatureConfig)
        {
            if ((int)config.Rate <= 0)
            {
                continue;
            }
            FeatureRate featureRate = new FeatureRate(RankdTotalRate, RankdTotalRate + (int)config.Rate);
            RankdTotalRate += (int)config.Rate;
            m_randFeatureConfig.Add(featureRate, config);
        }
    }

    public int FeatureCount
    {
        get
        {
            return m_dictFeatureBaseConfig.Count;
        }
    }

    public Dictionary<string, FeatureConfig> GetFeatureBaseConfig()
    {
        return m_dictFeatureBaseConfig;
    }

     public FeatureConfig GetFeatureConfig(int id)
     {
        if (m_dictFeatureBaseConfig.ContainsKey(id.ToString()))
        {
            return m_dictFeatureBaseConfig[id.ToString()];
        }
        return null;
     }

     private int randCount;
     public FeatureConfig RandFeatureConfig()
     {
         randCount++;

         Random ran = new Random((int)DateTime.Now.Ticks + randCount);

         var idx = ran.Next(0, RankdTotalRate);

         foreach (var ctx in m_randFeatureConfig)
         {
             var rate = ctx.Key;
             if (idx>= rate.pre && idx < rate.next)
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

