using System;



class ActorEntityHelper
{
    private static DamageInfo m_damageInfo;
    private static SkillImpactData m_skillImpactData;

    /// <summary>
    /// 升级、添加最大血量时，回血
    /// </summary>
    /// <param name="actor"></param>
    /// <param name="num"></param>
    public static void DirectAddHp(ActorEntity actor, int num)
    {
        if (m_damageInfo == null)
        {
            m_damageInfo = new DamageInfo();
            m_damageInfo.Reset();
        }

        if (m_skillImpactData == null)
        {
            m_skillImpactData = new SkillImpactData();
        }
        if (num > 0)
        {
            m_skillImpactData.m_ImpactType = SkillImpactType.ADD_HP;
        }
        else
        {
            m_skillImpactData.m_ImpactType = SkillImpactType.IMPACT_NONE;
        }

        //确保不超过最大生命值
        num = Math.Min(num, actor.ActorData.AttrData.MaxHP - actor.ActorData.HP);
        m_damageInfo.damage = -num;

        // ActorEntityEventHelper.SendSkillImpacted(actor, actor, m_damageInfo, m_skillImpactData, null);
    }

    public static bool IsDied(ActorEntity actor)
    {
        return actor == null || actor.IsDied;
    }

    public static bool IsPlayerActor(ActorEntity actor)
    {
        if (actor == null)
        {
            return false;
        }

        return actor.ActorType == ActorEntityType.eGamePlayer;
    }

    public static bool IsPetActor(ActorEntity actor)
    {
        if (actor == null)
        {
            return false;
        }

        return actor.ActorType == ActorEntityType.ePet;
    }

    //public static bool CanBeSelectAsTarget(ActorEntity entity)
    //{
    //    if (IsDied(entity) || entity.ActorType == ActorEntityType.ePet || 
    //        entity.ActorType == ActorEntityType.eShadowPlayer ||
    //        (entity.BuffMgr != null && !entity.BuffMgr.CanBeSelect()))
    //    {
    //        return false;
    //    }

    //    return entity.ColliderEnable;
    //}
}
