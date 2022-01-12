using System;
using System.Collections.Generic;


public class SkillConfigMgr : Singleton<SkillConfigMgr>
{
    private Dictionary<string, SkillBaseConfig> m_dictSkillBaseConfig = new Dictionary<string, SkillBaseConfig>();

    public SkillConfigMgr()
    {
        m_dictSkillBaseConfig = ResConfigUtil.ReadConfigRes<SkillBaseConfig>("SkillConfig");
    }

    public Dictionary<string, SkillBaseConfig> GetSkillBaseCfg()
    {
        return m_dictSkillBaseConfig;
    }
}

