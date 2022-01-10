using System;
using System.Collections.Generic;


public class SkillConfigMgr : Singleton<SkillConfigMgr>
{
    private Dictionary<string, SkillBaseConfig> m_dictPetBaseConfig = new Dictionary<string, SkillBaseConfig>();

    public SkillConfigMgr()
    {
        m_dictPetBaseConfig = ResConfigUtil.ReadConfigRes<SkillBaseConfig>("技能配置表");
    }
}

