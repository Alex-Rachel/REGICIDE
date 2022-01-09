using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


internal class SkillDamageHelper
{
}

public class DamageInfo
{
    /// <summary>
    /// 伤害值，负数表示是加血
    /// </summary>
    public int damage;

    /// <summary>
    /// 是否暴击
    /// </summary>
    public bool isCrit;

    /// <summary>
    /// 是否miss
    /// </summary>
    public bool isMiss;

    /// <summary>
    /// 是否抵挡
    /// </summary>
    public bool isBlockDamage;


    /// <summary>
    /// 是否导致死亡
    /// </summary>
    public bool isDead;

    /// <summary>
    /// 技能伤害类型
    /// SkillMagicType类型
    /// </summary>
    public int magicType;

    public void Reset()
    {
        damage = 0;
        isCrit = false;
        isMiss = false;
        isBlockDamage = false;
        isDead = false;
        magicType = (int)SkillMagicType.SKILL_MAGIC_NONE;
    }
}

