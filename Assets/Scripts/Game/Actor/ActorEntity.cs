using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;


/// <summary>
/// 实体类 管理所有实体间的交互
/// </summary>
public abstract class ActorEntity : Entity
{
    protected string m_actorName = string.Empty;

    public uint ActorID { get; private set; }

    public abstract ActorEntityType ActorType { get; }
    public ActorEntitySide ActorEntitySide { get; private set; }

    private ActorStateID m_currState = ActorStateID.Idle;
    public ActorStateID CurrState
    {
        get { return m_currState; }
        set
        {
            if (m_currState != value)
            {
                var oldVal = m_currState;
                m_currState = value;

                OnEntityStateChg(oldVal, value);
            }
        }
    }

    private void OnEntityStateChg(ActorStateID oldVal, ActorStateID newVal)
    {
        ActorEntityEventHelper.SendStateChanged(this, oldVal, newVal);
        SendVisualEvent(EntityVisualEvent.ACTOR_STATE_CHANGE);

        if (oldVal == ActorStateID.Die || newVal == ActorStateID.Die)
        {
            // RefreshColliderVisible();
        }
    }

    public ActorEntityCreateData CreateData { get; private set; }

    public ActorData ActorData { get; private set; }

    public bool IsDestroyed = false;

    public override string name
    {
        get { return GetActorName(); }
    }

    /// <summary>
    /// 总伤害数据
    /// </summary>
    public int TotalDamage;

    #region 事件封装
    private ActorEntityEventDispatcher m_event;
    internal ActorEntityEventDispatcher Event
    {
        get
        {
            if (m_event == null)
            {
                m_event = FMemPool<ActorEntityEventDispatcher>.Instance.Alloc();
            }
            return m_event;
        }
    }
    #endregion

    #region 组件封装

    /// <summary>
    /// 组件封装
    /// </summary>
    private List<ActorEntityCmpt> m_listCmpt = new List<ActorEntityCmpt>();
    private Dictionary<string, ActorEntityCmpt> m_mapCmpt = new Dictionary<string, ActorEntityCmpt>();
    private bool m_isDestroyAlling = false;


    public ActorEntity(BattleContext context) : base(context)
    {
        // 配置一些角色 常用的 配置属性
        // ConfigData = new ActorConfigData();
        //Event = new ActorEntityEventDispatcher();
    }

    #region 组件相关 模板方法
    public T AddCmpt<T>() where T : ActorEntityCmpt, new()
    {
        //当前正在销毁，不能添加新的组件了
        if (IsDestroyed || m_isDestroyAlling)
        {
            // FLogger.EditorFatal("Actor is destoryed, cant add component: {0}, IsDestrying[{1}]", GetClassName(typeof(T)), m_isDestroyAlling);
            return null;
        }

        T cmpt = GetCmpt<T>();
        if (cmpt != null)
        {
            return cmpt;
        }

        //如果不存在，则创建
        //cmpt = new T();
        cmpt = new T();
        if (!AddCmpt_Imp(cmpt))
        {
            // FLogger.EditorWarning("AddComponent failed, Component name: {0}", GetClassName(typeof(T)));
            cmpt.Destroy();
            return null;
        }

        return cmpt;
    }

    public T GetCmpt<T>() where T : ActorEntityCmpt
    {
        ActorEntityCmpt cmpt;
        if (m_mapCmpt.TryGetValue(GetClassName(typeof(T)), out cmpt))
        {
            return cmpt as T;
        }

        return null;
    }

    public void RemoveCmpt<T>() where T : ActorEntityCmpt
    {
        if (m_isDestroyAlling)
        {
            // FLogger.Debug("ActorEntity[{0}] is destroying, no need destroy cmpt anyway", name);
            return;
        }

        string className = GetClassName(typeof(T));
        ActorEntityCmpt cmpt;
        if (m_mapCmpt.TryGetValue(className, out cmpt))
        {
            cmpt.Destroy();

            // Event.RemoveAllListenerByOwner(cmpt);
            m_mapCmpt.Remove(className);
            m_listCmpt.Remove(cmpt);

            FreeCmpt(cmpt);
        }
    }

    private void FreeCmpt(ActorEntityCmpt cmpt)
    {
        if (cmpt.m_destroy)
        {
            return;
        }

        cmpt.m_destroy = true;
    }


    private bool AddCmpt_Imp<T>(T cmpt) where T : ActorEntityCmpt
    {
        //判断是否已经存在
        if (!cmpt.BeforeAddToActor(this))
        {
            return false;
        }

        m_listCmpt.Add(cmpt);
        m_mapCmpt[GetClassName(typeof(T))] = cmpt;

        return true;
    }

    private string GetClassName(Type type)
    {
        return type.FullName;
    }

    private void BeforeDestroyAllCmpt()
    {
        var listCmpt = m_listCmpt;
        for (int i = listCmpt.Count - 1; i >= 0; i--)
        {
            //然后释放内存，触发OnDestroy
            listCmpt[i].Destroy();
        }
    }

    private void DestroyAllCmpt()
    {
        var listCmpt = m_listCmpt;
        for (int i = listCmpt.Count - 1; i >= 0; i--)
        {
            //然后释放内存，触发OnDestroy
            FreeCmpt(listCmpt[i]);
        }

        m_listCmpt.Clear();
        m_mapCmpt.Clear();
    }

    public void OnDrawGizmos()
    {
        var listCmpt = m_listCmpt;
        for (int i = 0; i < listCmpt.Count; i++)
        {
            var cmpt = listCmpt[i];
            cmpt.OnDrawGizmos();
        }
    }

    #endregion


    public BuffManager BuffMgr { get; private set; }

    public SkillMgr SkillMgr { get; private set; }

    public bool IsDied
    {
        get { return m_currState == ActorStateID.Die; }
    }

    internal bool Create(ActorEntityCreateData createData)
    {
        CreateData = createData;

        BaseInit();
        if (!OnCreate(createData))
        {
            return false;
        }

        if (!BaseAfterInit())
        {
            return false;
        }

        for (int i = 0; i < m_listCmpt.Count; i++)
        {
            m_listCmpt[i].OnVisualReady();
        }

        AfterCreated();
        return true;
    }

    protected virtual void AfterCreated()
    {
    }

    private void BaseInit()
    {
        ///数据属性
        //ActorData = AddCmpt<ActorData>();
    }

    protected bool BaseAfterInit()
    {

        if (!OnInitActorAttr())
        {
            Debug.LogErrorFormat("OnInitActorAttr failed: {0}", name);
            return false;
        }

        // TODO 属性管理
        //ActorData.RefreshAttr();
        //if (ActorData.HP == 0 && !IsDied)
        //{
        //    SetInitHP();
        //}

        InitInnerCmpt();
        return OnEnterMap();
    }

    private void InitInnerCmpt()
    {
        BuffMgr = AddCmpt<BuffManager>();
    }

    protected void AddSkillCaster()
    {
        SkillMgr = AddCmpt<SkillMgr>();
    }

    #region 初始化接口

    internal void SetBaseData(uint actorID, ActorEntitySide side)
    {
        ActorID = actorID;
        ActorEntitySide = side;
    }

    #endregion

    #region 扩展接口
    protected virtual string GetActorName()
    {
        return m_actorName;
    }

    protected virtual bool OnCreate(ActorEntityCreateData createData)
    {
        return true;
    }

    protected virtual bool OnEnterMap()
    {
        return true;
    }

    /// <summary>
    /// 初始化数值
    /// </summary>
    protected virtual bool OnInitActorAttr()
    {
        return true;
    }
    protected virtual void OnDestroy()
    {
    }

    /// <summary>
    /// 所属的怪物类型
    /// </summary>
    internal virtual MonsterType GetMonsterType()
    {
        return MonsterType.MonsterNoneType;
    }

    public virtual bool IsBoss()
    {
        return false;
    }

    /// <summary>
    /// 获取技能ID
    /// </summary>
    /// <param name="idx"></param>
    /// <returns></returns>
    public virtual uint GetSkillByIdx(uint idx)
    {
        return 0;
    }

    #endregion

    internal void CallFixedUpdate()
    {
        if (IsDestroyed || m_isDestroyAlling)
        {
            return;
        }

        for (int i = 0; i < m_listCmpt.Count; i++)
        {
            var cmpt = m_listCmpt[i];

            cmpt.CallFixedUpdate();
        }
    }

    internal void Destroy()
    {
        if (IsDestroyed || m_isDestroyAlling)
        {
            return;
        }

        m_isDestroyAlling = true;

        OnDestroy();

        BeforeDestroyAllCmpt();
        DestroyAllCmpt();

        IsDestroyed = true;
        m_isDestroyAlling = false;
    }
#endregion
}
