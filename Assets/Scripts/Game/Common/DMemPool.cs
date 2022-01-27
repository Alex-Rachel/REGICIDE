using System;
using System.Collections.Generic;

using System.Reflection;
using System.Text;

interface IMemPoolObject
{
    void InitFromPool();
    void Destroy();
}

class GameMemPool : Singleton<GameMemPool>
{
    Dictionary<string, List<object>> m_objPool = new Dictionary<string, List<object>>();

    public GameMemPool()
    {
#if DOD_DEBUG
            GameTimerMgr.Instance.CreateLoopTimer("GameMemPool", 10, () =>
            {
                int totalCnt = 0;
                var itr = m_objPool.GetEnumerator();
                while (itr.MoveNext())
                {
                    var key = itr.Current.Key;
                    var list = itr.Current.Value;

                    totalCnt += list.Count;
                    DLogger.Info("[pool][{0}] [{1}]", key, list.Count);
                }

                DLogger.Info("-------------------------memory pool count: {0}", totalCnt);
            });
#endif
    }

    public T Alloc<T>() where T : IMemPoolObject, new()
    {
        string typeName = typeof(T).Name;
        List<object> listObj = null;
        if (!m_objPool.TryGetValue(typeName, out listObj))
        {
            listObj = new List<object>();
            m_objPool.Add(typeName, listObj);
        }

        T newObj = default(T);
        if (listObj.Count <= 0)
        {
            newObj = new T();
        }
        else
        {
            object existObj = listObj[listObj.Count - 1];
            listObj.RemoveAt(listObj.Count - 1);

#if UNITY_EDITOR
            DLogger.Assert(existObj.GetType() == typeof(T));
#endif

            newObj = (T)existObj;
        }

        if (newObj != null)
        {
            newObj.InitFromPool();
        }

        return newObj;
    }

    public void Free(object obj)
    {
        Type type = obj.GetType();
        string typeName = type.Name;
        List<object> listObj = null;
        if (!m_objPool.TryGetValue(typeName, out listObj))
        {
            listObj = new List<object>();
            m_objPool.Add(typeName, listObj);
        }

        IMemPoolObject memObj = (IMemPoolObject)obj;
        if (memObj != null)
        {
            memObj.Destroy();
        }

        if (listObj.Count <= 200)
        {
            listObj.Add(obj);
        }
        else
        {
            DLogger.Error("MemPool is full for type: {0}, count:{1}", typeName, listObj.Count);
        }
    }
}

