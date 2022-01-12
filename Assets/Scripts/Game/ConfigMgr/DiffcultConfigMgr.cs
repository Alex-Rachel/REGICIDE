using System;
using System.Collections.Generic;


public class DiffcultConfigMgr : Singleton<DiffcultConfigMgr>
{
    private Dictionary<string, DiffcultConfig> m_diffConfigDic = new Dictionary<string, DiffcultConfig>();

    public DiffcultConfigMgr()
    {
        m_diffConfigDic = ResConfigUtil.ReadConfigRes<DiffcultConfig>("DiffcultConfig");
    }

    public DiffcultConfig GetDiffCfg(int diffID)
    {
        if (m_diffConfigDic.ContainsKey(diffID.ToString()))
        {
            return m_diffConfigDic[diffID.ToString()];
        }
        return null;
    }
}

