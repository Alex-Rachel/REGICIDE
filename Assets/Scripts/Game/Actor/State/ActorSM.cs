enum ActorStateEvent
{
    NullTransitionID = 0,

    //Common
    Actor_Move, //角色移动
    Actor_StopMove,

    Actor_Arrived, //角色已经到达

    //Spell cast
    Actor_Skill_Cast, //释放技能
    Actor_Finish_Cast, //结束释放技能

    //stun                    
    Actor_Enter_Stun, //进入眩晕状态
    Actor_Finish_Stun, //退出眩晕状态

    //Dealth
    Actor_Die, // 角色死亡
    Actor_Relive, // 角色复活

    Actor_EnterAppear,
    Actor_LeaveAppear,
    Actor_State_Max
}

public enum ActorStateID
{
    NullStateID = 0,
    Idle, //站立，空闲状态
    Move, //移动状态
    Skill, //技能状态
    Die, //死亡
    Stun, //眩晕状态
    Appear, //出生动画状态
    Count,
}

/// <summary>
/// 角色状态机
/// </summary>
class ActorSM
{

}
