using System.Collections.Generic;

/// <summary>
/// 开启关卡参数
/// </summary>
public class StartLevelParam
{
    /// <summary>
    /// 类型
    /// </summary>
    public int LevelType;

    /// <summary>
    /// 关卡ID
    /// </summary>
    public uint m_levelID;

    /// <summary>
    /// 地图ID
    /// </summary>
    public uint m_mapID;

    /// <summary>
    /// 当前进度
    /// </summary>
    public int m_progress;

    /// <summary>
    /// 玩家创建参数
    /// </summary>
    public List<PlayerCreateParam> m_playerCreateParam = new List<PlayerCreateParam>();


    public int GetPlayerCnt()
    {
        return m_playerCreateParam.Count;
    }

    public PlayerCreateParam GetPlayerParam(int idx)
    {
        return m_playerCreateParam[idx];
    }

    public void AddPlayerCreateParam(PlayerCreateParam playerParam)
    {
        m_playerCreateParam.Add(playerParam);
    }
}

