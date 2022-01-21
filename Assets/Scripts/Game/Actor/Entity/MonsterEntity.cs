
using UnityEngine;

public class MonsterEntity : ActorEntity
{
    private MonsterBaseConfig m_cfg;

    /// <summary>
    /// 上一次更新的HP
    /// </summary>
    public int m_BossLastUpdateHP = 0;

    public MonsterEntity(BattleContext context) : base(context) { }

    public override ActorEntityType ActorType
    {
        get { return ActorEntityType.eMonster; }
    }

    internal MonsterBaseConfig Cfg
    {
        get { return m_cfg; }
    }

    public override int GetTypeId()
    {
        return (int)EntityTypeDefine.EntityMonster;
    }

    protected override bool OnCreate(ActorEntityCreateData createData)
    {
        m_cfg = MonsterConfigMgr.Instance.GetMonsterConfig((int)createData.m_monsterID);
        if (m_cfg == null)
        {
            return false;
        }

        return true;
    }

    protected override bool OnEnterMap()
    {
        AddSkillCaster();

        var impact = AddCmpt<SkillEntityImpactCmpt>();
        impact.InitMonster(m_cfg);

        return true;
    }

    // 附身技能
    private void InitMonsterAttachSkill()
    {
        //uint attachSkillID = GetAttachSkill();
        //if (attachSkillID > 0)
        //{
        //    SkillCaster.PlaySkill(attachSkillID);
        //}
    }

    protected override void AfterCreated()
    {
        InitMonsterAttachSkill();
    }

    private void OnSelfDied()
    {
        ActorEntityEventHelper.SendStateEvent(this, ActorStateEvent.Actor_Die);
    }

    protected override void OnDestroy()
    {
    }

    public override uint GetSkillByIdx(uint idx)
    {
        var skills = m_cfg.Skills;
        if (idx >= 0 && idx < skills.Length)
        {
            return (uint)skills[idx];
        }
        else
        {
            Debug.LogErrorFormat("Invalid skill index: {0}", idx);
        }

        return 0;
    }

    protected override bool OnInitActorAttr()
    {
        var baseAttr = ActorData.m_baseData;

        LevelBaseConfig cfg = null;
        cfg = Context.logic.GetCurLevelBaseCfg();

        if (cfg != null)
        {
            baseAttr.MaxHP = m_cfg.Hp;
            baseAttr.Damage = m_cfg.Atk ;
        }
        else
        {
            baseAttr.MaxHP = m_cfg.Hp;
            baseAttr.Damage = m_cfg.Atk;
        }

        //在基础生命和攻击上增加
        if (CreateData.m_monsterParam != null && CreateData.m_monsterParam.m_hpAddRate != 0 && CreateData.m_monsterParam.m_atkAddRate != 0)
        {
            baseAttr.MaxHP = Mathf.CeilToInt(baseAttr.MaxHP * CreateData.m_monsterParam.m_hpAddRate);
            baseAttr.Damage = Mathf.CeilToInt(baseAttr.Damage * CreateData.m_monsterParam.m_atkAddRate);
        }

        var newHp = baseAttr.MaxHP;
        baseAttr.MaxHP = Mathf.CeilToInt(newHp);

        InitExtAddAttr();
        InitMonsterParamAddAttr();
        // InitHellLevelExtAttr();

        ///初始化模型相关的参数
        //var modelId = m_cfg.ModelID;
        //InitModelAttr(modelId);

        return true;
    }

    private void InitExtDefaultAttr()
    {
        //var defaultAttr = m_cfg.DefaultAttr;
        //if (defaultAttr == null || defaultAttr.Length <= 0)
        //{
        //    return;
        //}

        //if (defaultAttr[0].DataType == 0)
        //{
        //    return;
        //}

        //var impactMgr = new ActorAttrImpactMgr("MonsterDefault");
        //for (int i = 0; i < defaultAttr.Length; i++)
        //{
        //    var attr = defaultAttr[i];
        //    if (attr.DataType != 0)
        //    {
        //        impactMgr.AddAttrImpact(attr);
        //    }
        //}

        //ActorData.RegAttrImpact(impactMgr);
    }

    //初始化享受关卡加成的额外属性
    private void InitExtAddAttr()
    {
        //LevelBaseConfig cfg = null;
        //if (!Context.IsSkillEditor)
        //{
        //    cfg = Context.logic.GetCurLevelBaseCfg();
        //}

        //var addAttr = m_cfg.AddAttr;
        //if (addAttr == null || addAttr.Length <= 0)
        //{
        //    return;
        //}

        //var impactMgr = new ActorAttrImpactMgr("MonsterExtAddAttr");

        //for (int i = 0; i < addAttr.Length; i++)
        //{
        //    var attr = addAttr[i];
        //    if (attr.DataType != 0)
        //    {

        //        if (cfg == null || i >= cfg.AttrAddRate.Length)
        //        {
        //            impactMgr.AddAttrImpact(attr);
        //        }
        //        else
        //        {
        //            impactMgr.AddAttrImpact((ActorAttrDataType)attr.DataType, (ActorAttrAddType)attr.AddType, attr.Value * (1 + cfg.AttrAddRate[i]));
        //        }
        //    }
        //}

        //ActorData.RegAttrImpact(impactMgr);
    }

    //初始化CreateMonsterParam带来的额外属性
    private void InitMonsterParamAddAttr()
    {
        //if (CreateData.m_monsterParam == null)
        //{
        //    return;
        //}

        //var addAttr = m_cfg.AddAttr;
        //if (addAttr == null || addAttr.Length <= 0)
        //{
        //    return;
        //}

        //var impactMgr = new ActorAttrImpactMgr("MonsterParamAddAttr");
        //for (int i = 0; i < addAttr.Length; i++)
        //{
        //    var attr = addAttr[i];
        //    if (attr.DataType != 0)
        //    {
        //        FP addValue = 0;
        //        if (Context.damageHelper.CheckFiveAtkAttr((ActorAttrDataType)attr.DataType))
        //        {
        //            //怪物五行伤害加成
        //            FP fiveAddRate = CreateData.m_monsterParam != null ? CreateData.m_monsterParam.m_fiveDamageRate : 0;
        //            fiveAddRate = TSMath.Max(0, fiveAddRate);
        //            addValue = (fiveAddRate - 1) * attr.Value;
        //        }

        //        //伤害减免
        //        if ((ActorAttrDataType)attr.DataType == ActorAttrDataType.DamageReduce)
        //        {
        //            //伤害减免加成
        //            FP damageReduceRate = CreateData.m_monsterParam != null ? CreateData.m_monsterParam.m_damageReduceRate : 0;
        //            damageReduceRate = TSMath.Max(0, damageReduceRate);
        //            addValue += (damageReduceRate - 1) * attr.Value;
        //        }

        //        impactMgr.AddAttrImpact((ActorAttrDataType)attr.DataType, (ActorAttrAddType)attr.AddType, addValue);

        //    }
        //}

        //ActorData.RegAttrImpact(impactMgr);
    }

    //protected override void SetInitHP()
    //{
    //    ///设置动态血量
    //    if (m_cfg.IsWorldBoss != 0 && Context.m_worldBossParam != null)
    //    {
    //        ActorData.HP = Context.m_worldBossParam.m_currHP;
    //        ActorData.HpCount = Context.m_worldBossParam.m_curHPCount;
    //    }
    //    else if (Context.m_teamBossParam != null)
    //    {
    //        ActorData.HP = Context.m_teamBossParam.m_currHP;
    //        ActorData.HpCount = Context.m_teamBossParam.m_curHPCount;
    //    }
    //    else
    //    {
    //        base.SetInitHP();
    //    }

    //    m_BossLastUpdateHP = ActorData.HP;
    //}

    public override bool IsBoss()
    {
        return Cfg.IsBoss == 1;
    }

}


enum MonsterType
{
    MonsterNoneType = 0,    /*非法类型*/
    MonsterMaleType = 1,    /*男性怪物类型*/
    MonsterFemaleType = 2,    /*女性怪物类型*/
    MonsterBeastType = 3,    /*野兽怪物类型*/
    MonsterMachineryType = 4    /*机械怪物类型*/
};
