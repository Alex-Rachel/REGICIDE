using System.Collections.Generic;
using UnityEngine;


public delegate IEntityVisual AllocVisual(int typeId, Entity entity);
public delegate void FreeVisual(int typeId, IEntityVisual visual);

public class EntityVisualFactory
{
    private Dictionary<int, AllocVisual> m_dictAllocFactory = new Dictionary<int, AllocVisual>();
    private Dictionary<int, FreeVisual> m_dictFreeFactory = new Dictionary<int, FreeVisual>();

    public void RegVisualFactory(int typeId, AllocVisual alloc, FreeVisual free)
    {
        Debug.Assert(!m_dictAllocFactory.ContainsKey(typeId));
        m_dictAllocFactory.Add(typeId, alloc);
        m_dictFreeFactory.Add(typeId, free);
    }

    internal IEntityVisual CreateVisual(Entity entity)
    {
        var typeId = entity.GetTypeId();
        AllocVisual alloc;
        if (m_dictAllocFactory.TryGetValue(typeId, out alloc))
        {
            return alloc(typeId, entity);
        }

        return null;
    }

    internal void FreeVisual(Entity entity)
    {
        if (entity.visual == null)
        {
            return;
        }

        var typeId = entity.GetTypeId();
        FreeVisual free;
        if (m_dictFreeFactory.TryGetValue(typeId, out free))
        {
            free(typeId, entity.visual);
            entity.visual = null;
        }
    }
}
