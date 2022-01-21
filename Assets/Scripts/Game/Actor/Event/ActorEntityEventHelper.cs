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
}

