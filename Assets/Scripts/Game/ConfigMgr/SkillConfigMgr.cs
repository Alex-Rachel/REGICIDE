using System;
using System.Collections.Generic;


public class SkillConfigMgr : Singleton<SkillConfigMgr>
{
    private Dictionary<string, SkillBaseConfig> m_dictSkillBaseConfig = new Dictionary<string, SkillBaseConfig>();

    public SkillConfigMgr()
    {
        m_dictSkillBaseConfig = ResConfigUtil.ReadConfigRes<SkillBaseConfig>("SkillConfig");
    }

    public SkillBaseConfig GetSkillBaseCfg(uint skillID)
    {
        if (!m_dictSkillBaseConfig.ContainsKey(skillID.ToString()))
        {
            return null;
        }
        return m_dictSkillBaseConfig[skillID.ToString()];
    }
}

