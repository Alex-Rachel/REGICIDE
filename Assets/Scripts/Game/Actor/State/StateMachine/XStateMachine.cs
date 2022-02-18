using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// 状态机基类
/// </summary>
public class SMBaseState : IBattleContextHost
{
    public BattleContext Context
    {
        get { return OwnActor.Context; }
    }

    public static int NullTransitionID = 0;
    public static int NullStateId = 0;

    protected Dictionary<int, int> map = new Dictionary<int, int>();
    protected int stateID;

    public int ID
    {
        get { return stateID; }
        set { stateID = value; }
    }

    public bool IsRunning
    {
        get { return StateMachine.getCurrentStateID() == stateID; }
    }

    public bool m_isDestroy = false;
    public int m_lastStateID;


    /// <summary>
    ///   Reference to State Machine. 
    /// </summary>

    public XStateMachine StateMachine { set; get; }

    /// <summary>
    ///   Reference to State machine's gameobject, used to register event
    /// </summary>
    protected ActorEntity OwnActor
    {
        get
        {
            if (StateMachine == null)
                return null;
            else
                return StateMachine.OwnActor;
        }
    }


    public void AddTransition(int trans, int id)
    {
        // Check if anyone of the args is invalid
        if (trans == NullTransitionID)
        {
            //Debug.LogError("FSMState ERROR: NullTransition is not allowed for a real transition");
            return;
        }

        if (id == NullStateId)
        {
            //Debug.LogError("FSMState ERROR: NullStateID is not allowed for a real ID");
            return;
        }

        // Since this is a Deterministic FSM,
        //   check if the current transition was already inside the map
        if (map.ContainsKey(trans))
        {
            //Debug.LogError("FSMState ERROR: State " + stateID.ToString() + " already has transition " + trans.ToString() + "Impossible to assign to another state");
            return;
        }

        map.Add(trans, id);
    }

    /// <summary>
    /// This method deletes a pair transition-state from this state's map.
    /// If the transition was not inside the state's map, an ERROR message is printed.
    /// </summary>
    public void DeleteTransition(int trans)
    {
        // Check for NullTransition
        if (trans == NullTransitionID)
        {
            //Debug.LogError("FSMState ERROR: NullTransition is not allowed");
            return;
        }

        // Check if the pair is inside the map before deleting
        if (map.ContainsKey(trans))
        {
            map.Remove(trans);
            return;
        }
        //Debug.LogError("FSMState ERROR: Transition " + trans.ToString() + " passed to " + stateID.ToString() + " was not on the state's transition list");
    }

    /// <summary>
    /// This method returns the new state the FSM should be if
    ///    this state receives a transition and 
    /// </summary>
    public int GetOutputState(int trans)
    {
        // Check if the map has this transition
        if (map.ContainsKey(trans))
        {
            return map[trans];
        }
        return NullStateId;
    }


    /// <summary>
    ///   Virtual methode used to initialize state.
    /// </summary>

    public virtual void InitializeState()
    {
    }

    /// <summary>
    /// This method is used to set up the State condition before entering it.
    /// It is called automatically by the FSMSystem class before assigning it
    /// to the current state.
    /// </summary>
    public virtual void OnEnter(object data = null)
    {
        // //Debug.Log("OnEnter State " + this.GetType().ToString());
    }

    /// <summary>
    /// This method is used to make anything necessary, as reseting variables
    /// before the FSMSystem changes to another one. It is called automatically
    /// by the FSMSystem before changing to a new state.
    /// </summary>
    public virtual void OnLeave()
    {
        ////Debug.Log("OnLeave State " + this.GetType().ToString());
    }

    /// <summary>
    /// This method decides if the state should transition to another on its list
    /// NPC is a reference to the object that is controlled by this class
    /// </summary>
    public virtual void OnReason(int transID, object data = null)
    {
        bool shouldChange = false;
        if (this.GetOutputState(transID) != SMBaseState.NullStateId)
        {
            shouldChange = true;
        }
        if (shouldChange)
        {
            this.StateMachine.PerformTransition(transID, data);
        }
    }

    /// <summary>
    /// This method controls the behavior of the NPC in the game World.
    /// Every action, movement or communication the NPC does should be placed here
    /// NPC is a reference to the object that is controlled by this class
    /// </summary>
    public virtual void OnUpdate(object data = null)
    {
    }

    /// <summary>
    ///   This methode is used to clean. When statemachine is destroyed, all its state
    ///   will be informed by calling this methode. Do cleanning something here;
    /// </summary>
    public virtual void OnClean()
    {
    }


    /// <summary>
    ///   Get  debug string, will be displayed on screen
    /// </summary>

    public virtual string OnGetDebugInfomation()
    {
        return null;
    }


} // class FSMState


/// <summary>
/// FSMSystem class represents the Finite State Machine class.
///  It has a List with the States the NPC has and methods to add,
///  delete a state, and to change the current state the Machine is on.
/// </summary>
public abstract class XStateMachine : ActorEntityCmpt
{
    protected List<SMBaseState> states;

    // The only way one can change the state of the FSM is by performing a transition
    // Don't change the CurrentState directly
    public int _currentStateID;
    public int _oldStateID;

    //public int CurrentStateID { get { return _currentStateID; } }

    public SMBaseState _currentState;

    public int getCurrentStateID()
    {
        return _currentStateID;
    }

    protected override void Awake()
    {
        states = new List<SMBaseState>();

        OnCreate();

        initializeStateMachine();
        _currentState.OnEnter();
    }

    protected virtual void OnCreate()
    {
    }

    /// <summary>
    ///   This virtual method is used to initialize fsm
    /// </summary>
    protected virtual void initializeStateMachine()
    {
    }


    /// <summary>
    /// This method places new states inside the FSM,
    /// or prints an ERROR message if the state was already inside the List.
    /// First state added is also the initial state.
    /// </summary>
    protected void AddState(SMBaseState s)
    {
        // Check for Null reference before deleting
        if (s == null)
        {
            //Debug.LogError("FSM ERROR: Null reference is not allowed");
        }

        // First State inserted is also the Initial state,
        //   the state the machine is in when the simulation begins
        if (states.Count == 0)
        {
            states.Add(s);
            _currentState = s;
            _currentStateID = s.ID;
            return;
        }

        // Add the state to the List if it's not inside it
        foreach (SMBaseState state in states)
        {
            if (state.ID == s.ID)
            {
                //Debug.LogError("FSM ERROR: Impossible to add state " + s.ID.ToString() + " because state has already been added");
                return;
            }
        }
        states.Add(s);
    }

    protected SMBaseState GetStateByID(uint ID)
    {
        SMBaseState _state = null;

        foreach (SMBaseState state in states)
        {
            if (state.ID == ID)
            {
                _state = state;
                break;
            }
        }

        return _state;
    }

    /// <summary>
    /// This method tries to change the state the FSM is in based on
    /// the current state and the transition passed. If current state
    ///  doesn't have a target state for the transition passed, 
    /// an ERROR message is printed.
    /// </summary>
    public void PerformTransition(int trans, object data = null)
    {
        // Check for NullTransition before changing the current state
        if (trans == SMBaseState.NullTransitionID)
        {
            //Debug.LogError("FSM ERROR: NullTransition is not allowed for a real transition");
            return;
        }

        // Check if the currentState has the transition passed as argument

        int id = _currentState.GetOutputState(trans);

        if (id == SMBaseState.NullStateId)
        {
            //Debug.LogError("FSM ERROR: State  + currentStateID.ToString() +   does not have a target state " + " for transition " + trans.ToString());
            return;
        }

        // Update the currentStateID and currentState	
        SMBaseState prevState = _currentState;
        SMBaseState newState = null;

        for (int index = 0; index < states.Count; index++)
        {
            SMBaseState state = states[index];
            if (state.ID == id)
            {
                newState = state;
                break;
            }
        }

        if (newState == null)
        {
            Debug.LogErrorFormat("invalid state id: {0}", id);
        }

        Debug.Assert(newState != null);
        prevState.OnLeave();

        _oldStateID = _currentStateID;
        _currentStateID = id;
        _currentState = newState;

        if (_currentState != null)
        {
            _currentState.m_lastStateID = _oldStateID;
        }

        _currentState.OnEnter(data);

        OnStateChange();

        if (_currentStateID != _currentState.ID)
        {
            Debug.LogError("set state failed");
        }
    }


    protected virtual void OnStateChange()
    {

    }

    protected override void OnDestroy()
    {
        if (_currentState != null)
        {
            _currentState.m_isDestroy = true;
            _currentState.OnLeave();
            _currentState = null;
            _currentStateID = 0;
        }

        if (this.states != null)
        {
            this.states.ForEach(st => { st.OnClean(); });
        }
    }

} //class FSMSystem
