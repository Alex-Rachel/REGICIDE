using System;
using System.Collections.Generic;

public class SkillImpactSource
{
    public uint m_skillId = 0;
    public int m_buffId = 0;
}

public class SkillEntityImpactVisualInter
{
    /// <summary>
    /// 受击整体效果
    /// </summary>
    public Action<uint, DamageInfo, SkillImpactData, SkillImpactSource> OnSkillImpact;
}


/// <summary>
/// 处理受击类的逻辑
/// </summary>
class SkillEntityImpactCmpt : ActorEntityCmpt
{
    private bool m_enableBackoff = true;

    // 助攻列表
    private List<ActorEntity> assistList = new List<ActorEntity>();

    /// <summary>
    /// 变化参数
    /// </summary>
    private SkillEntityImpactVisualInter m_visualInter = new SkillEntityImpactVisualInter();

    protected override void Awake()
    {
        AddEventListener<ActorEntity, DamageInfo, SkillImpactData, SkillImpactSource>(
            ActorEntityEventType.SkillImpacted, OnSkillImpact);

        // AddEventListener<int>(ActorEntityEventType.UpdateWorldBossHP, OnUpdateWorldBossHP);
        // m_moveCmpt = OwnActor.MoveCmpt;
    }

    public override void OnVisualReady()
    {
        var eventId = EntityVisualEvent.ACTOR_BIND_SKILLIMPACT;
        var eventParma = EntityVisualEventParam.CreateEventParam<EntityBindSkillImpactParam>(eventId);
        eventParma.visualInter = m_visualInter;
        OwnActor.SendVisualEvent(eventId, eventParma, false, true);
    }

    public void InitPlayer()
    {
        m_enableBackoff = false;
        // m_minImpactDurTime = ParamConfigMgr.Instance.GetFloatParam(FuncIdDef.PlayerMinImpactDurTime);
    }

    public void InitMonster(MonsterBaseConfig cfgData)
    {
        // m_enableBackoff = (cfgData.NoBackOff == 0);
    }

    protected override void OnDestroy()
    {
        // DestoryBackOffTimer();
    }

    void OnSkillImpact(ActorEntity caster, DamageInfo damage, SkillImpactData impactData, SkillImpactSource source)
    {
        var ownActor = OwnActor;

        if (OwnActor.IsDied)
        {
            return;
        }

        ///屏蔽所有的伤害
        if (Context.IsBattleFinish && damage.damage > 0)
        {
            return;
        }

        //if (damage.addMP > 0)
        //{
        //    ProcessAddMp(damage);
        //}
        //else
        //{
        //    ProcessDamage(caster, damage, impactData, source);
        //}
        ProcessDamage(caster, damage, impactData, source);


        if (m_visualInter.OnSkillImpact != null)
        {
            m_visualInter.OnSkillImpact(caster != null ? caster.ActorID : 0, damage, impactData, source);
        }

        ProcessImpactEffect(damage, impactData);

        ///处理事件
        if (damage.isDead)
        {
            //if (!ActorEntityHelper.IsDied(caster))
            if (caster != null)
            {
                caster.Event.SendEvent(ActorEntityEventType.KillEntity, ownActor);
                Context.actorMgr.OnActorKill(caster, ownActor, assistList);
                assistList.Clear();
            }
            if (source != null && source.m_skillId > 0)
            {
                SendKillEventToCaster(caster, ownActor, source.m_skillId, impactData.m_shootId);
            }
        }
    }

    private void SendKillEventToCaster(ActorEntity caster, ActorEntity target, uint skillId, int shootId)
    {
        if (caster.IsDied)
        {
            var skillCaster = caster.SkillMgr;
            if (skillCaster != null)
            {
                var repeatTrigger = skillCaster.RepeatTriggerMgr;
                repeatTrigger.TriggerKillTargetEvent(skillId, shootId, target);
            }
        }
    }

    ///处理伤害
    void ProcessDamage(ActorEntity caster, DamageInfo damage, SkillImpactData impactData, SkillImpactSource source)
    {
        var ownActor = OwnActor;
        var actorData = ownActor.ActorData;
        var currHp = actorData.HP;

        var damageHp = damage.damage;
        if (damageHp > 0)
        {
            damage.isDead = false;
            damage.damage = 0;

            return;
        }

        //通知buff处理下最终的伤害
        if (damageHp > 0)
        {
            //ActorEntityEventHelper.SendProcessDamage(ownActor, caster, damage, impactData, source);
            //damageHp = damage.damage;
        }

        var causeDeath = false;
        currHp -= damageHp;

        var oldHP = actorData.HP;
        int damageVal = 0;
        if (currHp <= 0)
        {
            currHp = 0;
            actorData.HP = 0;

            causeDeath = true;
            ActorEntityEventHelper.SendStateEvent(ownActor, ActorStateEvent.Actor_Die);
        }
        else
        {
            damageVal = oldHP - currHp;
            actorData.HP = currHp;
        }

#if DOD_DEBUG
            if (ownActor.ActorType == ActorEntityType.eGamePlayer)
            {
                BLogger.Error("Actor:{0} Dec HP, Curr: {1}, Dec:{2},After:{3}", ownActor.ActorID, oldHP, damageHp, actorData.HP);
            }
#endif

        ///这儿覆盖下，以实际计算为准
        damage.isDead = causeDeath;
        damage.damage = damageVal;

        //扣完血了触发一下受击事件
        if (damage.damage > 0)
        {
            ownActor.SkillMgr.RepeatTriggerMgr.TriggerBeHitEvent(caster, damage);
        }

        if (damage.damage > 0 && caster != null)
        {
            caster.TotalDamage += damage.damage;

            if (!assistList.Contains(caster))
            {
                assistList.Add(caster);
            }
        }
    }

    void ProcessAddMp(DamageInfo damage)
    {
        //var ownActor = OwnActor;
        //var actorData = ownActor.ActorData;
        //var currMp = actorData.MP;
        //var maxMp = actorData.AttrData.MaxMP;

        //var newMp = currMp + damage.addMP;
        //if (newMp > maxMp)
        //{
        //    newMp = maxMp;
        //}

        //damage.addMP = newMp - currMp;
        //actorData.MP = newMp;
    }

    void ProcessImpactEffect(DamageInfo damage, SkillImpactData impactData)
    {
        ///如果非死亡，那么启动高光效果
        if (!damage.isDead)
        {
            if (damage.damage > 0)
            {
                var impactType = impactData.m_ImpactType;

                ///如果是硬直类型
                //if (impactType == SkillImpactType.HIT_BACKOFF)
                //{
                //    if (m_enableBackoff)
                //    {
                //        StartDisplayBackOffEffect(damage.impactDir, impactData.m_backOffDist,
                //            impactData.m_backOffTime, impactData.m_backOffInterval, impactData.m_backAccTime);
                //    }
                //}
            }
        }
    }
}


public enum SkillImpactType
{
    NORMAL_HIT = 0,                 // 普通受伤
    HIT_RECOVERY,                   // 硬直击退,击退类型参考SkillHitBackType定义
    HIT_BACKOFF,                    //击退效果
    IMPACT_NONE,                    //没有受击效果,用于给友方的辅助技能
    //("加血效果")]
    ADD_HP,
    //("加MP效果")]
    ADD_MP,
    //"受伤效果,无任何受击表现,主要给buff")]
    HIT_NO_IMPACT,
}

public enum SkillHitDamageType
{
    /// <summary>
    /// 子弹类型
    /// </summary>
    Bullet,

    /// <summary>
    /// 碰撞类型
    /// </summary>
    BodyCollider,

    /// <summary>
    /// 机关伤害类型
    /// </summary>
    Machine,
}

public class SkillImpactData
{
    //伤害类型
    public SkillHitDamageType m_damageType;
    public SkillImpactType m_ImpactType;
    public int m_shootId = 0;
    // ("受击音效")]
    // public SkillImpactAudioData m_impactAudio = new SkillImpactAudioData();

    //("施法者死亡任然可以造成伤害")]
    public bool m_damageWhenCasterDeath = false;
}
