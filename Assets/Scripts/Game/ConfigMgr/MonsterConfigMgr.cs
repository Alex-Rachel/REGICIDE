using System;
using System.Collections.Generic;


public class MonsterConfigMgr : Singleton<MonsterConfigMgr>
{
    private Dictionary<string, MonsterBaseConfig> m_dictMonsterBaseConfig = new Dictionary<string, MonsterBaseConfig>();

    public MonsterConfigMgr()
    {
        m_dictMonsterBaseConfig = ResConfigUtil.ReadConfigRes<MonsterBaseConfig>("MonsterConfig");
    }

    public MonsterBaseConfig GetMonsterConfig(int monsterID)
    {
        if (m_dictMonsterBaseConfig.ContainsKey(monsterID.ToString()))
        {
            return m_dictMonsterBaseConfig[monsterID.ToString()];
        }
        return null;
    }
}

