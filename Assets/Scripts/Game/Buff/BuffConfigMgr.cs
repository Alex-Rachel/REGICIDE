using System.Collections.Generic;

public class BuffConfigMgr : Singleton<BuffConfigMgr>
{
    private Dictionary<string, BuffConfig> m_diffConfigDic = new Dictionary<string, BuffConfig>();

    public BuffConfigMgr()
    {
        m_diffConfigDic = ResConfigUtil.ReadConfigRes<BuffConfig>("BuffConfig");
    }

    public BuffConfig GetCfg(int buffD)
    {
        if (m_diffConfigDic.ContainsKey(buffD.ToString()))
        {
            return m_diffConfigDic[buffD.ToString()];
        }
        return null;
    }

    
}

