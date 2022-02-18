using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



class ActorEntityEventHelper
{
    public static void SendHpChg(ActorEntity actor, float hpPercent, bool isDecrease)
    {
        actor.Event.SendEvent(ActorEntityEventType.ActorHpChg, hpPercent, isDecrease);
    }

    public static void SendStateEvent(ActorEntity actor, ActorStateEvent eventId, object data = null)
    {
        actor.Event.SendEvent(ActorEntityEventType.ActorStateEvent, eventId, data);
    }
    public static void SendStateChanged(ActorEntity actor, ActorStateID old, ActorStateID newVal)
    {
        actor.Event.SendEvent(ActorEntityEventType.ActorStateChanged, old, newVal);
    }

    /// <summary>
    /// 发送技能命中处理
    /// </summary>
    /// <param name="actor"></param>
    /// <param name="caster"></param>
    /// <param name="damageInfo"></param>
    public static void SendSkillImpacted(ActorEntity actor, ActorEntity caster,
        DamageInfo damageInfo, SkillImpactData impactData,
        SkillImpactSource source)
    {
        //             actor.ActorData.HP = 0;
        //             ActorEntityEventHelper.SendStateEvent(actor, ActorStateEvent.Actor_Die);

        actor.Event.SendEvent(ActorEntityEventType.SkillImpacted, caster, damageInfo, impactData, source);
    }
}

