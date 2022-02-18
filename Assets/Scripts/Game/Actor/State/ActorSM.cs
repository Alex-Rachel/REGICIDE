using UnityEngine;

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
class ActorSM : XStateMachine
{
    public SMBaseState CurrentState
    {
        get { return _currentState; }
    }

    #region Initialization

    protected override void initializeStateMachine()
    {
        for (int i = 1; i < (int)ActorStateID.Count; i++)
        {
            this.initOneState((ActorStateID)i);
        }
    }

    private SMBaseState initOneState(ActorStateID stateID)
    {
        SMBaseState _state = null;
        switch (stateID)
        {
            case ActorStateID.Idle:
            {
                _state = new ActorIdleState();
                break;
            }
            case ActorStateID.Move:
            {
                _state = new ActorMoveState();
                break;
            }
            case ActorStateID.Die:
            {
                _state = new ActorDieState();
                break;
            }
            case ActorStateID.Stun:
            {
                _state = new ActorStunState();
                break;
            }
            default:
            {
                Debug.LogErrorFormat("invalid state: {0}", stateID);
            }
                break;
        }

        _state.StateMachine = this;
        _state.ID = (int)stateID;
        _state.InitializeState();
        this.AddState(_state);

        return _state;
    }

    #endregion

    protected override void OnCreate()
    {
        OwnActor.CurrState = ActorStateID.Idle;
        AddEventListener<ActorStateEvent, object>(ActorEntityEventType.ActorStateEvent, OnChangeActorStateEvent);
    }

    protected override void OnStateChange()
    {
        OwnActor.CurrState = (ActorStateID)_currentStateID;
        // SetDebugInfo("CurrState", ((ActorStateID)_currentStateID).ToString());
    }

    protected override void FixedUpdate()
    {
        var currState = _currentState;
        if (currState != null)
        {
            //FProfiler.BeginSample(_currentState.GetType().FullName);
            currState.OnUpdate(null);
            //FProfiler.EndSample(); 

            //SetDebugInfo("CurrState", ((ActorStateID)_currentStateID).ToString());
        }
    }

    #region Call back for event

    private void OnChangeActorStateEvent(ActorStateEvent actorEvent, object data)
    {
        if (_currentState != null)
            _currentState.OnReason((int)actorEvent, data);
    }

    #endregion

}
