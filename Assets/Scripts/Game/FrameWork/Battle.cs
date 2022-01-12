using System.Collections.Generic;

public class Battle : IBattleContextHost
{
    private BattleContext m_context;
    public BattleLevelLogic m_logic;

    public BattleContext Context
    {
        get { return m_context; }
    }

    // internal BattleGmMgr GmMgr;

    public Battle(BattleContext context)
    {
        m_context = context;
    }

    public void Destroy()
    {
        if (m_logic != null)
        {
            m_logic.Destroy();
        }

    }

    internal bool Create()
    {
        var timerMgr = new FTimerMgr();
        AddSystem(timerMgr);
        Context.timerMgr = timerMgr;

        var actorMgr = new ActorEntityMgr();
        AddSystem(actorMgr);
        Context.actorMgr = actorMgr;

        Context.damageHelper = new SkillDamageHelper(Context);

        //var bulletMgr = new BulletMgr();
        //AddSystem(bulletMgr);
        //Context.bulletMgr = bulletMgr;

        //var gmMgr = new BattleGmMgr();
        //AddSystem(gmMgr);
        //GmMgr = gmMgr;

        if (!CallSystemInit())
        {
            Destroy();
            return false;
        }

        return true;
    }

    private bool DoStartLevel(StartLevelParam startParam)
    {
        int mapID = (int)startParam.m_mapID;

        BattleLevelLogic logic = null;
        switch (startParam.LevelType)
        {
            case (int)LevelLogicType.SoloLevelType:
                {
                    Context.IsPvpBattle = false;
                    logic = new NormalLevelLogic(Context);
                    break;
                }
            case (int)LevelLogicType.CompLevelType:
                {
                    Context.IsPvpBattle = true;
                    logic = new BattlePvpLevelLogic(Context);
                    break;
                }
        }

        if (logic == null)
        {
            return false;
        }

        if (!logic.Init(this))
        {
            return false;
        }

        if (!logic.Start(mapID, startParam))
        {
            return false;
        }

        Context.logic = logic;

        m_logic = logic;

        return true;
    }

    private void AddSystem(BattleSystem system)
    {
        m_listSystem.Add(system);
    }

    private bool CallSystemInit()
    {
        var ret = true;
        for (int i = 0; i < m_listSystem.Count; i++)
        {
            var system = m_listSystem[i];
            if (!system.Init(this))
            {
                ret = false;
                break;
            }
        }

        return ret;
    }

    public float TimeFloat()
    {
        return Context.time.AsFloat();
    }
}
