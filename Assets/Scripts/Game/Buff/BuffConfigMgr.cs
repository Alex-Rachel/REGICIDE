using System.Collections.Generic;

public class BuffConfigMgr : Singleton<BuffConfigMgr>
{
    private Dictionary<string, BuffConfig> m_diffConfigDic = new Dictionary<string, BuffConfig>();
    private Dictionary<string, PlayerBuffConfig> m_PlayerBuffConfigDic = new Dictionary<string, PlayerBuffConfig>();

    public BuffConfigMgr()
    {
        m_diffConfigDic = ResConfigUtil.ReadConfigRes<BuffConfig>("BuffConfig");
        m_PlayerBuffConfigDic = ResConfigUtil.ReadConfigRes<PlayerBuffConfig>("PlayerBuffConfig");
    }

    public BuffConfig GetCfg(int buffD)
    {
        if (m_diffConfigDic.ContainsKey(buffD.ToString()))
        {
            return m_diffConfigDic[buffD.ToString()];
        }
        return null;
    }

    public PlayerBuffConfig GetPlayerBuff(int buffD)
    {
        if (m_PlayerBuffConfigDic.ContainsKey(buffD.ToString()))
        {
            return m_PlayerBuffConfigDic[buffD.ToString()];
        }
        return null;
    }
}

