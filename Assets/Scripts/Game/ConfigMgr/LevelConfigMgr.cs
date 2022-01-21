using System;
using System.Collections.Generic;


public class LevelConfigMgr : Singleton<LevelConfigMgr>
{
    private Dictionary<string, LevelBaseConfig> m_dictLevelBaseConfig = new Dictionary<string, LevelBaseConfig>();

    public LevelConfigMgr()
    {
        m_dictLevelBaseConfig = ResConfigUtil.ReadConfigRes<LevelBaseConfig>("LevelConfig");
    }

    public LevelBaseConfig GetLevelBaseCfg(int id)
    {
        return m_dictLevelBaseConfig[id.ToString()];
    }
}

