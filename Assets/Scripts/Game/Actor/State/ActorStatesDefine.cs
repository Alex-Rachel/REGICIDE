using System;


class ActorIdleState : SMBaseState
{
    public override void InitializeState()
    {
        AddTransition((int)ActorStateEvent.Actor_Move, (int)ActorStateID.Move);
        AddTransition((int)ActorStateEvent.Actor_Enter_Stun, (int)ActorStateID.Stun);
        AddTransition((int)ActorStateEvent.Actor_Skill_Cast, (int)ActorStateID.Skill);
        AddTransition((int)ActorStateEvent.Actor_Die, (int)ActorStateID.Die);
        AddTransition((int)ActorStateEvent.Actor_EnterAppear, (int)ActorStateID.Appear);
    }
}

internal class ActorMoveState : SMBaseState
{
    public override void InitializeState()
    {
        AddTransition((int)ActorStateEvent.Actor_Skill_Cast, (int)ActorStateID.Skill);

        AddTransition((int)ActorStateEvent.Actor_Enter_Stun, (int)ActorStateID.Stun);
        AddTransition((int)ActorStateEvent.Actor_Arrived, (int)ActorStateID.Idle);
        AddTransition((int)ActorStateEvent.Actor_StopMove, (int)ActorStateID.Idle);
        AddTransition((int)ActorStateEvent.Actor_Die, (int)ActorStateID.Die);
    }
}

/// <summary>
/// 眩晕状态
/// </summary>
internal class ActorStunState : SMBaseState
{
    public override void InitializeState()
    {
        //眩晕状态是可以进入硬直效果的
        //眩晕结束
        this.AddTransition((int)ActorStateEvent.Actor_Finish_Stun, (int)ActorStateID.Idle);
        this.AddTransition((int)ActorStateEvent.Actor_Die, (int)ActorStateID.Die);
    }
}

internal class ActorDieState : SMBaseState
{
    public override void InitializeState()
    {
        this.AddTransition((int)ActorStateEvent.Actor_Relive, (int)ActorStateID.Idle);
    }

    public override void OnReason(int transID, object data = null)
    {
        if (transID == (int)ActorStateEvent.Actor_Relive)
        {
            // Context.actorMgr.OnActorRelive(OwnActor);
        }

        base.OnReason(transID, data);
    }

    public override void OnEnter(object data = null)
    {
        var actor = OwnActor;
        if (actor == null)
        {
            return;
        }

        //if (actor.ConfigData.m_diedDestroyTime > FP.Zero)
        //{
        //    actor.m_waitDestroyTime = Context.time + actor.ConfigData.m_diedDestroyTime;
        //}

        Context.actorMgr.OnActorDied(actor);
    }

    public override void OnLeave()
    {
        if (!m_isDestroy)
        {
            var ownActor = OwnActor;
            if (ownActor != null)
            {
                // ownActor.m_waitDestroyTime = FP.Zero;
            }
        }
    }
}
