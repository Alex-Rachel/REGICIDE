using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/// <summary>
/// 技能相关数据  可以考虑 用池子存储 优化
/// </summary>
public class SkillData : IBattleContextHost
{

    public BattleContext Context
    {
        get { return m_casterActor.Context; }
    }

    /// <summary>
    /// 技能内存Id,代表该玩家当前的唯一技能Id
    /// </summary>
    public uint m_skillGID = 0;

    /// <summary>
    /// 技能的配置Id
    /// </summary>
    public uint m_skillId;

    private ActorEntity m_casterActor = null;
    public ActorEntity CasterActor
    {
        get { return m_casterActor; }

        set
        {
            m_casterActor = value;
        }
    }

    public SkillData(ActorEntity actor)
    {
        m_casterActor = actor;
    }

    // 传入 技能ID 跟技能配置
    public void Init(uint skillid)
    {
        m_skillId = skillid;
    }
}


/*技能元素类型*/
enum SkillMagicType
{
    SKILL_MAGIC_NONE = 0,    /*无类型*/
    SKILL_MAGIC_POISON = 1,    /*毒类型*/
    SKILL_MAGIC_THUNDER = 2,    /*雷类型*/
    SKILL_MAGIC_FIRE = 3,    /*火类型*/
    SKILL_MAGIC_ICE = 4    /*冰类型*/
};

