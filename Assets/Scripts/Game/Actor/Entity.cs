using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;


abstract public class Entity : IBattleContextHost
{
    private BattleContext m_context;
    public BattleContext Context
    {
        get { return m_context; }
    }

    private EntityVisualEventParam m_eventParam = new EntityVisualEventParam();
    private EntityVisualEventCache m_visualEventCache;

    /// <summary>
    /// 获取参数
    /// </summary>
    public EntityVisualEventParam EventParam
    {
        get { return m_eventParam; }
    }

    public abstract string name { get; }
    public IEntityVisual visual = null;

    public abstract int GetTypeId();

    public Entity()
    {
        m_context = null;
    }
    public Entity(BattleContext context)
    {
        InitEntity(context);
    }

    public void InitEntity(BattleContext context)
    {
        m_context = context;
    }

    /// <summary>
    /// 发送可视化的消息
    /// </summary>
    /// <param name="evnetId"></param>
    internal void SendVisualEvent(EntityVisualEvent eventId, object eventParam = null, bool canMerged = true,
        bool syncSend = false)
    {
        if (visual != null)
        {
            m_visualEventCache.SendEvent((int)eventId, eventParam, canMerged);
            if (syncSend)
            {
                m_visualEventCache.Flush();
            }
        }
    }
}


/// <summary>
/// 有些事件，是需要带参数的，但参数往上层传递会导致接口的复杂和不一致
/// 所以改为统一的获取接口
/// </summary>
public class EntityVisualEventParam
{
    private static Dictionary<int, List<object>> m_dictPoolCache = new Dictionary<int, List<object>>();

    private int m_eventId;
    private object m_currEventParam;

    internal static T CreateEventParam<T>(EntityVisualEvent eventId) where T : new()
    {
        List<object> listCache;
        if (!m_dictPoolCache.TryGetValue((int)eventId, out listCache))
        {
            listCache = new List<object>();
            m_dictPoolCache.Add((int)eventId, listCache);
        }

        T newObj;
        if (listCache.Count > 0)
        {
            newObj = (T)listCache[listCache.Count - 1];
            listCache.RemoveAt(listCache.Count - 1);
        }
        else
        {
            newObj = new T();
        }

        return newObj;
    }

    internal static void FreeEventParam(int eventId, object param)
    {
        Debug.Assert(eventId != 0 && param != null);
        List<object> listCache;
        if (m_dictPoolCache.TryGetValue(eventId, out listCache))
        {
            listCache.Add(param);
        }
    }

    internal void BeginDispatchEvent(int eventId, object param)
    {
        m_eventId = eventId;
        m_currEventParam = param;
    }

    internal void EndDispatchEvent()
    {
        m_eventId = 0;
        m_currEventParam = null;
    }

    public object GetCurrentParam(int eventId)
    {
        Debug.AssertFormat(eventId == m_eventId, "invalid eventId: {0}, {1}", eventId, m_eventId);
        return m_currEventParam;
    }
}

class EntityVisualEventNode : FMemPoolObject
{
    public int eventId;
    public object eventParam;

    public void InitFromPool()
    {
        eventId = 0;
        eventParam = null;
    }

    public void Destroy()
    {
        if (eventParam != null)
        {
            EntityVisualEventParam.FreeEventParam(eventId, eventParam);
        }
    }

    public void UpdateEventParam(object newParam)
    {
        if (eventParam != null)
        {
            EntityVisualEventParam.FreeEventParam(eventId, eventParam);
        }

        eventParam = newParam;
    }
}

class EntityVisualEventCache
{
    private Entity m_ownEntity;
    private List<EntityVisualEventNode> m_listEvent = new List<EntityVisualEventNode>();

    public EntityVisualEventCache(Entity entity)
    {
        m_ownEntity = entity;
    }

    public void SendEvent(int eventId, object parma, bool canMerge = true)
    {
        var visual = m_ownEntity.visual;
        if (visual != null)
        {
            EntityVisualEventNode node = null;
            if (canMerge)
            {
                for (int i = 0; i < m_listEvent.Count; i++)
                {
                    var exist = m_listEvent[i];
                    if (exist.eventId == eventId)
                    {
                        node = exist;
                        break;
                    }
                }
            }

            if (node == null)
            {
                node = FMemPool<EntityVisualEventNode>.Instance.Alloc();
                m_listEvent.Add(node);
                node.eventId = eventId;
                node.eventParam = parma;
            }
            else
            {
                node.UpdateEventParam(parma);
            }
        }
    }

    public void Flush()
    {
        if (m_listEvent.Count > 0)
        {
            var visual = m_ownEntity.visual;
            if (visual != null)
            {
                var eventParma = m_ownEntity.EventParam;
                for (int i = 0; i < m_listEvent.Count; i++)
                {
                    var eventNode = m_listEvent[i];
                    eventParma.BeginDispatchEvent(eventNode.eventId, eventNode.eventParam);
                    visual.OnEntityEvent(eventNode.eventId);
                    eventParma.EndDispatchEvent();

                    FMemPool<EntityVisualEventNode>.Instance.Free(eventNode);
                }
            }

            m_listEvent.Clear();
        }
    }

    public void Clear()
    {
        m_listEvent.Clear();
    }
}