using System;
using System.Collections.Generic;


public class MonsterConfigMgr : Singleton<MonsterConfigMgr>
{
    private Dictionary<int, MonsterBaseConfig> m_dictMonsterBaseConfig = new Dictionary<int, MonsterBaseConfig>();

    public MonsterConfigMgr()
    {
        m_dictMonsterBaseConfig = ResConfigUtil.ReadConfigResIntKey<MonsterBaseConfig>("MonsterConfig");
    }

    public MonsterBaseConfig GetMonsterConfig(int monsterID)
    {
        if (m_dictMonsterBaseConfig.ContainsKey(monsterID))
        {
            return m_dictMonsterBaseConfig[monsterID];
        }
        return null;
    }
}

