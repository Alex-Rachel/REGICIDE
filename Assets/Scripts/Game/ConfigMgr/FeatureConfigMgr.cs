using System;
using System.Collections.Generic;

public class FeatureConfigMgr : Singleton<FeatureConfigMgr>
{
    private Dictionary<string, FeatureConfig> m_dictFeatureBaseConfig = new Dictionary<string, FeatureConfig>();
    private List<FeatureConfig> m_listFeatureConfig = new List<FeatureConfig>();
    private Dictionary<int,FeatureConfig> m_randlistFeatureConfig = new Dictionary<int,FeatureConfig>();
    public List<FeatureConfig> FeatureConfigList
    {
        get { return m_listFeatureConfig; }
    }

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

         return null;
     }

    int RankdTotalRate = 0;

    private void InitRandConfig()
    {
         foreach (var config in m_listFeatureConfig)
         {
             RankdTotalRate += (int)config.Rate;
             m_randlistFeatureConfig.Add(RankdTotalRate, config);
         }
    }
}