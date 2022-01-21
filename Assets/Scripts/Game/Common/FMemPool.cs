using System;
using System.Collections.Generic;

interface FMemPoolObject
{
    void InitFromPool();
    void Destroy();
}

class FMemPoolMgr : Singleton<FMemPoolMgr>
{
    List<FMemPoolBase> m_listPool = new List<FMemPoolBase>();

    public void RegMemPool(FMemPoolBase pool)
    {
        // BLogger.Assert(!m_listPool.Contains(pool));
        m_listPool.Add(pool);
    }

    public void ClearAllPool()
    {
        for (int i = 0; i < m_listPool.Count; i++)
        {
            var pool = m_listPool[i];
            pool.ClearPool();
        }
    }
}

interface FMemPoolBase
{
    void ClearPool();
}

class FMemPool<T> : Singleton<FMemPool<T>>, FMemPoolBase where T : FMemPoolObject, new()
{
    private List<T> m_objPool = new List<T>();

    public FMemPool()
    {
        FMemPoolMgr.Instance.RegMemPool(this);
    }

    public T Alloc()
    {
        T newObj;
        if (m_objPool.Count > 0)
        {
            var lastIndex = m_objPool.Count - 1;
            newObj = m_objPool[lastIndex];
            m_objPool.RemoveAt(lastIndex);
        }
        else
        {
            newObj = new T();
        }

        newObj.InitFromPool();
        return newObj;
    }

    public void Free(T obj)
    {
        if (obj == null)
        {
            return;
        }

        obj.Destroy();
        m_objPool.Add(obj);
    }

    public void ClearPool()
    {
        // BLogger.Info("clear memory[{0}] count[{1}]", typeof(T).FullName, m_objPool.Count);
        m_objPool.Clear();
    }
}
