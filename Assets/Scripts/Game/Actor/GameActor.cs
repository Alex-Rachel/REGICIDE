using System;
using System.Collections;
using UnityEngine;

public abstract class GameActor: IActor, IEntityVisual
{
    public ActorEntity BindEntity;

    protected ActorEntity m_actor;

    public ActorEntity OwnActor
    {
        get
        {
            if (m_actor != null && m_actor.IsDied)
            {
                m_actor = null;
                return null;
            }

            return m_actor;
        }
        set
        {
            m_actor = value;
        }
    }

    /// <summary>
    /// 负责Entity发送过来的变化事件
    /// </summary>
    private ActorEventDispatcher m_entityEvent;
    public ActorEventDispatcher EntityEvent
    {
        get
        {
            if (m_entityEvent == null)
            {
                m_entityEvent = GameMemPool.Instance.Alloc<ActorEventDispatcher>();
            }
            return m_entityEvent;
        }
    }


    #region Event操作函数
    //public void AddEventListener(ActorEventType eventType, Action eventCallback)
    //{
    //    EntityEvent.AddEventListener((int)eventType, eventCallback, this);
    //}

    ////回调带参数
    //public void AddEventListener<T>(ActorEventType eventType, Action<T> eventCallback)
    //{
    //    EntityEvent.AddEventListener((int)eventType, eventCallback, this);
    //}

    public void AddEntityEventListener(EntityVisualEvent eventType, Action<int> eventCallback)
    {
        EntityEvent.AddEventListener((int)eventType, eventCallback, this);
    }

    public void OnEntityEvent(int eventId)
    {
        EntityEvent.SendEvent(eventId, eventId);
    }

    #endregion
}

public interface IActor
{

}