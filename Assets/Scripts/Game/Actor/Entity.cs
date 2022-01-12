using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


abstract public class Entity : IBattleContextHost
{
    private BattleContext m_context;
    public BattleContext Context
    {
        get { return m_context; }
    }

    public abstract string name { get; }


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
}