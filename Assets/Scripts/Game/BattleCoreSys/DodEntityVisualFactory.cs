using System.Collections.Generic;


class FactoryRegInfo
{
    public EntityTypeDefine m_typeId;
    public AllocVisual m_allocAction;
    public FreeVisual m_freeAction;

    public FactoryRegInfo(EntityTypeDefine typeId, AllocVisual allocAction, FreeVisual freeAction)
    {
        m_typeId = typeId;
        m_allocAction = allocAction;
        m_freeAction = freeAction;
    }
}

class DodEntityVisualFactory
{
    private static List<FactoryRegInfo> m_listRegInfo = new List<FactoryRegInfo>();

    public static void Init()
    {
        RegFactory(EntityTypeDefine.EntityHero, CreateActorVisual, FreeActorVisual);
        RegFactory(EntityTypeDefine.EntityMonster, CreateActorVisual, FreeActorVisual);
        RegFactory(EntityTypeDefine.EntityPet, CreateActorVisual, FreeActorVisual);

        RegFactory(EntityTypeDefine.BattleLevelLogic, CreateBattleLevelLogicVisual, DestroyBattleLevelLogicVisual);
    }

    public static void ApplyEntityVisualFactoru(EntityVisualFactory factory)
    {
        for (int i = 0; i < m_listRegInfo.Count; i++)
        {
            var regInfo = m_listRegInfo[i];
            factory.RegVisualFactory((int)regInfo.m_typeId, regInfo.m_allocAction, regInfo.m_freeAction);
        }
    }

    #region 关卡逻辑
    private static void DestroyBattleLevelLogicVisual(int typeid, IEntityVisual visual)
    {
    }

    private static IEntityVisual CreateBattleLevelLogicVisual(int typeid, Entity entity)
    {
        //if (GameRuntime.IsSkillEditor)
        //{
        //    return null;
        //}

        var visual = BattleSys.Instance.LogicVisual;
        visual.SetOwner(entity);
        return visual;
    }
    #endregion

    private static void RegFactory(EntityTypeDefine typeId, AllocVisual allocAction, FreeVisual freeAction)
    {
        m_listRegInfo.Add(new FactoryRegInfo(typeId, allocAction, freeAction));
    }

    #region Actor相关

    static IEntityVisual CreateActorVisual(int typeId, Entity entity)
    {
        DLogger.Debug("create actor visual: {0}", typeId);
        var actorEntity = entity as ActorEntity;
        if (actorEntity == null)
        {
            DLogger.Error("invalid entity type: {0}", entity.GetType().ToString());
            return null;
        }

        switch (typeId)
        {
            case (int)EntityTypeDefine.EntityHero:
                return ActorMgr.Instance.GetPlayerActor();
            case (int)EntityTypeDefine.EntityMonster:
                return GameMgr.Instance.BossActor;
        }

        return null;
        // return ActorManager.Instance.CreateActor(typeId, actorEntity);
    }

    static void FreeActorVisual(int typeId, IEntityVisual visual)
    {
        var actor = visual as GameActor;
        if (actor != null)
        {
            // ActorManager.Instance.DestroyActor(actor);
        }
    }

    #endregion


    #region 子弹相关

    #endregion
}
