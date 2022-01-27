using System;
using System.Collections.Generic;

public class ActorEventDispatcher : IMemPoolObject
{
    private Dictionary<int, List<EventRegInfo>> m_dictAllEventListener = new Dictionary<int, List<EventRegInfo>>();
    private List<int> m_processEevent = new List<int>(10);
    private List<int> m_delayDeleteEvent = new List<int>(10);

    #region IMemPoolObject
    public void InitFromPool()
    {

    }

    public void Destroy()
    {
        DestroyAllEventListener();
    }
    #endregion

    public void DestroyAllEventListener()
    {
        ///list暂时保留，不做清理,下次可能会继续使用
        var itr = m_dictAllEventListener.GetEnumerator();
        while (itr.MoveNext())
        {
            var kv = itr.Current;
            kv.Value.Clear();
        }

        m_processEevent.Clear();
        m_delayDeleteEvent.Clear();
    }

    private void AddDelayDelete(int eventId)
    {
        if (!m_delayDeleteEvent.Contains(eventId))
        {
            m_delayDeleteEvent.Add(eventId);
            DLogger.Info("delay delete eventId[{0}]", eventId);
        }
    }

    private void CheckDelayDetete(int eventId)
    {
        if (m_delayDeleteEvent.Contains(eventId))
        {
            List<EventRegInfo> listListener;
            if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
            {
                for (int i = 0; i < listListener.Count; i++)
                {
                    if (listListener[i].deleted)
                    {
                        DLogger.Info("remove delay delete eventId[{0}]", eventId);

                        listListener[i] = listListener[listListener.Count - 1];
                        listListener.RemoveAt(listListener.Count - 1);
                        i--;


                    }
                }
            }

            m_delayDeleteEvent.Remove(eventId);
        }
    }

    public void SendEvent(int eventId)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
        {

            m_processEevent.Add(eventId);
#if UNITY_EDITOR
            int iEventCnt = m_processEevent.Count;
#endif

            var count = listListener.Count;
            for (int i = 0; i < count; i++)
            {
                Action callBack = listListener[i].callback as Action;
                if (callBack != null)
                {
                    callBack();
                }
                else
                {
                    DLogger.EditorFatal("Invalid event data type: {0}", eventId);
                }
            }


#if UNITY_EDITOR
            DLogger.Assert(iEventCnt == m_processEevent.Count);
            DLogger.Assert(eventId == m_processEevent[m_processEevent.Count - 1]);
#endif
            m_processEevent.RemoveAt(m_processEevent.Count - 1);

            CheckDelayDetete(eventId);
        }
    }

    public void SendEvent<T>(int eventId, T data)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
        {
            m_processEevent.Add(eventId);
#if UNITY_EDITOR
            int iEventCnt = m_processEevent.Count;
#endif

            var count = listListener.Count;
            for (int i = 0; i < count; i++)
            {
                Action<T> callBack = listListener[i].callback as Action<T>;
                if (callBack != null)
                {
                    callBack(data);
                }
                else
                {
                    DLogger.EditorFatal("Invalid event data type: {0}", eventId);
                }
            }


#if UNITY_EDITOR
            DLogger.Assert(iEventCnt == m_processEevent.Count);
            DLogger.Assert(eventId == m_processEevent[m_processEevent.Count - 1]);
#endif

            m_processEevent.RemoveAt(m_processEevent.Count - 1);

            CheckDelayDetete(eventId);
        }
    }
    public void SendEvent<T, U>(int eventId, T dataT, U dataU)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
        {
            m_processEevent.Add(eventId);
#if UNITY_EDITOR
            int iEventCnt = m_processEevent.Count;
#endif

            var count = listListener.Count;
            for (int i = 0; i < count; i++)
            {
                Action<T, U> callBack = listListener[i].callback as Action<T, U>;
                if (callBack != null)
                {
                    callBack(dataT, dataU);
                }
                else
                {
                    DLogger.EditorFatal("Invalid event data type: {0}", eventId);
                }
            }


#if UNITY_EDITOR
            DLogger.Assert(iEventCnt == m_processEevent.Count);
            DLogger.Assert(eventId == m_processEevent[m_processEevent.Count - 1]);
#endif
            m_processEevent.RemoveAt(m_processEevent.Count - 1);

            CheckDelayDetete(eventId);
        }
    }

    public void SendEvent<T, U, V>(int eventId, T dataT, U dataU, V dataV)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
        {
            m_processEevent.Add(eventId);
#if UNITY_EDITOR
            int iEventCnt = m_processEevent.Count;
#endif

            var count = listListener.Count;
            for (int i = 0; i < count; i++)
            {
                var node = listListener[i];
                if (node.deleted)
                {
                    continue;
                }

                Action<T, U, V> callBack = node.callback as Action<T, U, V>;
                if (callBack != null)
                {
                    callBack(dataT, dataU, dataV);
                }
                else
                {
                    DLogger.EditorFatal("Invalid event data type: {0}", eventId);
                }
            }


#if UNITY_EDITOR
            DLogger.Assert(iEventCnt == m_processEevent.Count);
            DLogger.Assert(eventId == m_processEevent[m_processEevent.Count - 1]);
#endif
            m_processEevent.RemoveAt(m_processEevent.Count - 1);

            CheckDelayDetete(eventId);
        }
    }

    public void SendEvent<T, U, V, S>(int eventId, T dataT, U dataU, V dataV, S dataS)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventId, out listListener))
        {
            m_processEevent.Add(eventId);
#if UNITY_EDITOR
            int iEventCnt = m_processEevent.Count;
#endif


            var count = listListener.Count;
            for (int i = 0; i < count; i++)
            {
                Action<T, U, V, S> callBack = listListener[i].callback as Action<T, U, V, S>;
                if (callBack != null)
                {
                    callBack(dataT, dataU, dataV, dataS);
                }
                else
                {
                    DLogger.EditorFatal("Invalid event data type: {0}", eventId);
                }
            }


#if UNITY_EDITOR
            DLogger.Assert(iEventCnt == m_processEevent.Count);
            DLogger.Assert(eventId == m_processEevent[m_processEevent.Count - 1]);
#endif
            m_processEevent.RemoveAt(m_processEevent.Count - 1);

            CheckDelayDetete(eventId);
        }
    }

    public void AddEventListener(int eventHashId, Action eventCallback, object owner)
    {
        AddEventListenerImp(eventHashId, eventCallback, owner);
    }

    //回调带参数
    public void AddEventListener<T>(int eventHashId, Action<T> eventCallback, object owner)
    {
        AddEventListenerImp(eventHashId, eventCallback, owner);
    }

    //回调带参数
    public void AddEventListener<T, U>(int eventHashId, Action<T, U> eventCallback, object owner)
    {
        AddEventListenerImp(eventHashId, eventCallback, owner);
    }

    public void AddEventListener<T, U, V>(int eventHashId, Action<T, U, V> eventCallback, object owner)
    {
        AddEventListenerImp(eventHashId, eventCallback, owner);
    }

    public void AddEventListener<T, U, V, S>(int eventHashId, Action<T, U, V, S> eventCallback, object owner)
    {
        AddEventListenerImp(eventHashId, eventCallback, owner);
    }

    private void AddEventListenerImp(int eventHashId, Delegate listener, object owner)
    {
        List<EventRegInfo> listListener;
        if (!m_dictAllEventListener.TryGetValue((int)eventHashId, out listListener))
        {
            listListener = new List<EventRegInfo>();
            m_dictAllEventListener.Add((int)eventHashId, listListener);
        }

        var existNode = listListener.Find((node) => { return node.callback == listener; });
        if (existNode != null)
        {
            //如果被删除了，又重新给加回来
            if (existNode.deleted)
            {
                existNode.deleted = false;
                DLogger.EditorWarning("AddEvent hashId deleted, repeat add: {0}", eventHashId);
                return;
            }

            DLogger.EditorFatal("AddEvent hashId repeated: {0}", eventHashId);
            return;
        }

        listListener.Add(new EventRegInfo(listener, owner));
    }

    public void RemoveAllListenerByOwner(object owner)
    {
        var itr = m_dictAllEventListener.GetEnumerator();
        while (itr.MoveNext())
        {
            var kv = itr.Current;
            var list = kv.Value;

            int eventId = kv.Key;
            bool isProcessing = m_processEevent.Contains(eventId);
            bool delayDeleted = false;

            for (int i = 0; i < list.Count; i++)
            {
                var regInfo = list[i];
                if (regInfo.owner == owner)
                {
                    if (isProcessing)
                    {
                        regInfo.deleted = true;
                        delayDeleted = true;
                    }
                    else
                    {
                        list[i] = list[list.Count - 1];
                        list.RemoveAt(list.Count - 1);
                        i--;
                    }
                }
            }

            if (delayDeleted)
            {
                AddDelayDelete(eventId);
            }
        }
    }

    public void RemoveEventListener(int eventHashId, Action eventCallback)
    {
        RemoveEventListenerImp(eventHashId, eventCallback);
    }

    //回调带参数
    public void RemoveEventListener<T>(int eventHashId, Action<T> eventCallback)
    {
        RemoveEventListenerImp(eventHashId, eventCallback);
    }

    //回调带参数
    public void RemoveEventListener<T, U>(int eventHashId, Action<T, U> eventCallback)
    {
        RemoveEventListenerImp(eventHashId, eventCallback);
    }
    //回调带参数
    public void RemoveEventListener<T, U, V>(int eventHashId, Action<T, U, V> eventCallback)
    {
        RemoveEventListenerImp(eventHashId, eventCallback);
    }
    //回调带参数
    public void RemoveEventListener<T, U, V, S>(int eventHashId, Action<T, U, V, S> eventCallback)
    {
        RemoveEventListenerImp(eventHashId, eventCallback);
    }

    protected void RemoveEventListenerImp(int eventHashId, Delegate listener)
    {
        List<EventRegInfo> listListener;
        if (m_dictAllEventListener.TryGetValue(eventHashId, out listListener))
        {
            bool isProcessing = m_processEevent.Contains(eventHashId);
            if (!isProcessing)
            {
                listListener.RemoveAll((node) => { return node.callback == listener; });
            }
            else
            {
                int listenCnt = listListener.Count;
                for (int i = 0; i < listenCnt; i++)
                {
                    var node = listListener[i];
                    if (node.callback == listener)
                    {
                        node.deleted = true;
                        AddDelayDelete(eventHashId);
                        break;
                    }
                }
            }
        }
    }

}

