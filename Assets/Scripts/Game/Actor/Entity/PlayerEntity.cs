using System;


class PlayerEntity : ActorEntity
{
    /// <summary>
    /// 所属玩家角色ID
    /// </summary>
    public UInt64 m_roleId;

    protected string m_actorName = string.Empty;
    public override ActorEntityType ActorType
    {
        get { return ActorEntityType.eGamePlayer; }
    }


    public PlayerEntity(BattleContext context) : base(context) { }

    protected override bool OnCreate(ActorEntityCreateData createData)
    {
        m_roleId = createData.m_playerParam.roleId;

        m_actorName = createData.m_playerParam.roleName;
        m_roleId = createData.m_playerParam.roleId;
        return true;
    }

    protected override bool OnInitActorAttr()
    {
        var param = CreateData.m_playerParam;

        //if (param.m_baseAttrData != null)
        //{
        //    ActorData.m_baseData.Set(param.m_baseAttrData);
        //}

        //ActorData.RefreshAttr();

        //ActorData.HP = param.HP;
        //ActorData.MP = param.MP;

        return true;
    }

    protected override bool OnEnterMap()
    {
        return true;
    }

    protected override void AfterCreated()
    {

    }

    //public override uint GetSkillByIdx(uint idx)
    //{
    //    return m_attackID;
    //}

    //public override uint GetAITaskID()
    //{
    //    return 0;
    //}
}

