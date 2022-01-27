
/// <summary>
/// 定义战斗的Mgr功能模块
/// </summary>
public class BattleSystem : IBattleContextHost
{
    protected Battle m_ownBattle;
    public BattleContext Context
    {
        get
        {
            return m_ownBattle.Context;
        }
    }

    public bool Init(Battle battle)
    {
        m_ownBattle = battle;
        return OnInit();
    }

    public void Destroy()
    {
        OnDestroy();
    }

    public void CallFixedUpdate()
    {
        FixedUpdate();
    }

    protected virtual bool OnInit()
    {
        return true;
    }

    protected virtual void FixedUpdate()
    {
    }

    protected virtual void OnDestroy()
    {
    }

    internal virtual void OnDrawGizmos()
    {
    }
}
