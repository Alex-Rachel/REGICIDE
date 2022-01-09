using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class ActorEntityCmpt : IBattleContextHost
{
    public BattleContext Context
    {
        get { return m_actor.Context; }
    }

    protected ActorEntity m_actor;
    private bool m_callStart;
    private bool m_calledOnDestroy;

    public bool m_destroy = false;

    public ActorEntity OwnActor
    {
        get { return m_actor; }
    }

    /// <summary>
    /// 只有添加到对象上，才触发下面的初始化逻辑
    /// </summary>
    /// <param name="actor"></param>
    /// <returns></returns>
    internal bool BeforeAddToActor(ActorEntity actor)
    {
        m_actor = actor;
        m_callStart = false;

        Awake();

        return true;
    }

    internal void Destroy()
    {
        if (m_calledOnDestroy)
        {
            return;
        }

        m_calledOnDestroy = true;
        if (m_actor != null)
        {
            OnDestroy();
        }
    }

    private void CallStart()
    {
        Start();
        m_callStart = true;
    }

    internal void CallFixedUpdate()
    {
        if (!m_callStart)
        {
            CallStart();
        }

        FixedUpdate();
    }


    #region 扩展的接口

    protected virtual void Awake()
    {
    }

    protected virtual void Start()
    {
    }

    protected virtual void FixedUpdate()
    {
    }

    protected virtual void OnDestroy()
    {
    }

    public virtual void OnDrawGizmos()
    {

    }

    public virtual void OnVisualReady()
    {
    }

    #endregion

    #region Event操作函数
    public void AddEventListener(ActorEntityEventType eventType, Action eventCallback)
    {
        m_actor.Event.AddEventListener(eventType, eventCallback, this);
    }

    //回调带参数
    public void AddEventListener<T>(ActorEntityEventType eventType, Action<T> eventCallback)
    {
        m_actor.Event.AddEventListener(eventType, eventCallback, this);
    }

    //回调带参数
    public void AddEventListener<T, U>(ActorEntityEventType eventType, Action<T, U> eventCallback)
    {
        m_actor.Event.AddEventListener(eventType, eventCallback, this);
    }

    public void AddEventListener<T, U, V>(ActorEntityEventType eventType, Action<T, U, V> eventCallback)
    {
        m_actor.Event.AddEventListener(eventType, eventCallback, this);
    }

    public void AddEventListener<T, U, V, S>(ActorEntityEventType eventType, Action<T, U, V, S> eventCallback)
    {
        m_actor.Event.AddEventListener(eventType, eventCallback, this);
    }

    #endregion
}

public enum ActorEntityEventType
{
    #region 控制相关

    /// <summary>
    /// 驱动AI移动消息
    /// 参数 Vector3 目标位置
    /// </summary>
    CtrlMoveToPos,

    ActorCtrlMoveDir,

    #endregion

    #region 基础属性

    /// <summary>
    /// 状态变化
    /// 参数ActorStateEvent 变化的event类型
    /// </summary>
    ActorStateEvent,

    /// <summary>
    /// Buff状态变化
    /// </summary>
    ActorBuffStateChange,

    /// <summary>
    /// 移动速度变化
    /// </summary>
    ActorMoveSpeedChanged,

    /// <summary>
    /// 是否可以移动变化
    /// </summary>
    ActorCanMoveChanged,

    /// <summary>
    /// 移动阻挡变化了
    /// </summary>
    MoveColliderMaskChanged,

    /// <summary>
    /// 玩家碰撞是否生效变化了
    /// </summary>
    ActorColliderEnableChange,

    /// <summary>
    /// 血量发生变化
    /// </summary>
    ActorHpChg,

    /// <summary>
    /// MP发生变化
    /// </summary>
    ActorMpChg,

    /// <summary>
    /// 状态变化了
    /// </summary>
    ActorStateChanged,

    /// <summary>
    /// 护体真气变化
    /// </summary>
    ActorShiledChanged,

    /// <summary>
    /// 金蝉脱壳变化
    /// </summary>
    ActorNoDeathCountChange,

    /// <summary>
    /// 角色变身开始
    /// </summary>
    ActorBianShenStart,

    /// <summary>
    /// 强制角色变身结束
    /// </summary>
    ActorBianShenEnd,

    /// <summary>
    /// 角色变身时间结束
    /// </summary>
    ActorBianShenTimeEnd,

    /// <summary>
    /// 召唤兽
    /// </summary>
    ActorSummonPet,
    #endregion

    #region 技能相关

    SkillImpacted,

    /// <summary>
    /// 过滤下伤害,主要用于buff
    /// </summary>
    ProcessDamage,

    /// <summary>
    /// 世界boss用
    /// </summary>
    UpdateWorldBossHP,


    /// <summary>
    /// Buff变化
    /// </summary>
    ActorBuffAdd,
    ActorBuffRmv,

    /// <summary>
    /// buff进入隐身状态，统一由SkillImpact组件来处理
    /// </summary>
    BuffImpactInvsible,

    /// <summary>
    /// buff进入完全隐形状态，统一由SkillImpact组件来处理
    /// </summary>
    BuffImpactFullInvsible,

    /// <summary>
    /// 杀死目标
    /// </summary>
    KillEntity,

    /// <summary>
    /// 使用了主动技能
    /// </summary>
    UseActiveSkill,

    /// <summary>
    /// 技能播放结束
    /// </summary>
    SkillAniPlayEnd,

    /// <summary>
    /// 使用了灵契技能
    /// </summary>
    UseLingQiSkill,
    #endregion
}
