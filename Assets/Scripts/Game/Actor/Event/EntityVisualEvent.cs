using System;
using System.Collections.Generic;


/// <summary>
/// ACTOR_SKILL_PLAY
/// </summary>
public class EntityVisualSkillPlayParam
{
    /// <summary>
    /// 唯一ID，用来做标识用
    /// </summary>
    public uint m_skillGID;

    /// <summary>
    /// 技能ID
    /// </summary>
    public uint m_skillId;

    /// <summary>
    /// 技能表现ID
    /// </summary>
    public int m_skillDispId;

    /// <summary>
    /// 技能配置
    /// </summary>
    // public SkillDispData m_dispData;

    /// <summary>
    /// 实际游戏的运行接口
    /// </summary>
    // public SkillPlayData m_entityPlayData;
}

public class EntityVisualSkillDestroyParam
{
    public uint m_skillGID;
    public uint m_skillId;
}

public class EntityVisualSkillCreateRepeatMgrParam
{
    /// <summary>
    /// 唯一ID，用来logic层注册
    /// </summary>
    // public SkillRepeatVisualInterface visualInter;
}

/// <summary>
/// ACTOR_BIND_SKILLIMPACT
/// </summary>
public class EntityBindSkillImpactParam
{
    /// <summary>
    /// 唯一ID，用来logic层注册
    /// </summary>
    public SkillEntityImpactVisualInter visualInter;
}

/// <summary>
/// ACTOR_BUFF_STATE_CHANGE
/// </summary>
public class EntityBuffStateChangeParam
{
    /// <summary>
    /// 变化的buff状态ID
    /// </summary>
    public int buffStateId;
}

/// <summary>
/// 关卡场景掉落处理
/// </summary>
public class LevelDropParam
{
    public ulong roleID;

    public int itemID;

    public int itemNum;

    public uint DropGold;

    public int RecoverNum;

    public bool IsFixEquip;

    public bool IsBoss;

    public LevelDropParam Clone()
    {
        LevelDropParam param = new LevelDropParam();
        param.roleID = roleID;
        param.itemID = itemID;
        param.itemNum = itemNum;
        param.DropGold = DropGold;
        param.RecoverNum = RecoverNum;
        param.IsFixEquip = IsFixEquip;
        param.IsBoss = IsBoss;
        return param;
    }
}

public class LevelMonsterWaveParam
{
    public int waveCount;

    public int curWave;

    public float refreshTime;

    public bool isBoss;
}

/// <summary>
/// ACTOR_BUFF_VISUAL_BIND
/// </summary>
//public class EntityBuffVisualBind
//{
//    public BuffMangerVisualInter visualInter;
//}



public class LearnSkillParam
{
    public ulong RoleId;
    //随机技能库id
    public List<int> SkillList = new List<int>();

    public bool IsInit = false;

    public LearnSkillParam(ulong _roleId, int skillId, bool isInit)
    {
        RoleId = _roleId;
        SkillList.Clear();
        SkillList.Add(skillId);
        IsInit = isInit;
    }
}

public class LevelEventParam
{
    public ulong RoleId;
    public uint GID;
    public List<int> SkillList = new List<int>();
}

/// <summary>
/// 
/// </summary>
public class EntityRageChangeParam
{
    /// <summary>
    /// 怒气值
    /// </summary>
    public int Rage;

    /// <summary>
    /// 是否正在消退
    /// </summary>
    public bool IsDeclining;
}

public enum EntityVisualEvent
{
    #region 最通用的事件
    BASE_BEGIN = 0,

    /// <summary>
    /// 坐标变化了
    /// </summary>
    BASE_TRANSFROM_CHANGE,
    BASE_TRANSFROM_INIT_POS,
    /// <summary>
    /// 调试信息变化了
    /// </summary>
    BASE_DEBUGER_CHANGE,
    BASE_END = 100,

    #endregion


    #region 角色相关
    ACTOR_BEGIN,

    /// <summary>
    /// 状态变化
    /// </summary>
    ACTOR_STATE_CHANGE,

    /// <summary>
    /// 技能动作变化
    /// </summary>
    ACTOR_SKILL_ANIM_ID_CHANGE,

    /// <summary>
    /// 技能动作速度变化
    /// </summary>
    ACTOR_SKILL_ANIM_SCALE_CHANGE,
    /// <summary>
    /// 移动动作速度变化
    /// </summary>
    ACTOR_WALK_ANIM_SCALE_CHANGE,

    /// <summary>
    /// 选中目标变化
    /// </summary>
    ACTOR_TARGET_CHANGE,

    /// <summary>
    /// 当前收集的物品变化
    /// </summary>
    ACTOR_COLLECT_TARGET_CHANGE,

    /// <summary>
    /// 触发绑定技能受击事件
    /// EntityBindSkillImpactParam
    /// </summary>
    ACTOR_BIND_SKILLIMPACT,

    #region 技能播放相关

    /// <summary>
    /// 播放新技能
    /// EntityVisualSkillPlayParam
    /// </summary>
    ACTOR_SKILL_PLAY,

    /// <summary>
    /// EntityVisualSkillDestroyParam
    /// </summary>
    ACTOR_SKILL_DESTROY,
    /// <summary>
    /// 创建技能的repeat管理对象
    /// EntityVisualSkillCreateRepeatMgrParam
    /// </summary>
    ACTOR_SKILL_CREATE_REPEAT_MGR,

    /// <summary>
    /// 召唤完毕
    /// </summary>
    ACTOR_SUMMON_OVER,
    #endregion

    #region Buff相关

    /// <summary>
    /// buff状态变化
    /// EntityBuffStateChangeParam
    /// </summary>
    ACTOR_BUFF_STATE_CHANGE,

    /// <summary>
    /// 初始化Buff的显示模块
    /// </summary>
    ACTOR_BUFF_VISUAL_BIND,

    #endregion

    ACTOR_END = 1000,

    #endregion


    #region 关卡逻辑事件
    /// <summary>
    /// 关卡怪物批次刷新
    /// </summary>
    LEVEL_SHOW_MONSTER_WAVE,

    /// <summary>
    /// 显示复活界面
    /// </summary>
    LEVEL_SHOW_RELIVE,

    /// <summary>
    /// 关卡结束
    /// </summary>
    LEVEL_ALL_KILLED,

    /// <summary>
    /// 显示场景掉落
    /// </summary>
    LEVEL_SHOW_DROP,

    /// <summary>
    /// 主角减血
    /// </summary>
    PLAYER_ENTITY_DECREASE_HP,

    /// <summary>
    /// 主角使用复活次数
    /// </summary>
    LEVEL_MAIN_ENTITY_DECREASE_AUTORELIVE,

    /// <summary>
    /// 玩家复活
    /// </summary>
    LEVEL_PLAYER_ENTITY_RELIVE,

    /// <summary>
    /// 尖刺陷阱显示切换
    /// </summary>
    LEVEL_JIANCI_TRAP_VISIBLE_CHG,

    /// <summary>
    /// 主角MP变化
    /// </summary>
    PLAYER_ENTITY_MP_CHG,

    /// <summary>
    /// 主角招式变化
    /// </summary>
    PLAYER_ENTITY_ZHAOSHI_CHG,

    /// <summary>
    /// pvp玩法中玩家杀敌死亡数变化 param:PvpPlayerBattleRecore
    /// </summary>
    PVP_BATTLE_PLAYER_KDDATE_CHANGE,

    /// <summary>
    /// 局内玩家等级经验变化，只有pvp是客户端来计算等级的，其他玩法走的服务器 param:ExpParam
    /// </summary>
    LEVEL_PLAYER_LV_EXP_CHANGE,

    /// <summary>
    /// 显示战斗开始倒计时
    /// </summary>
    LEVEL_SHOW_BEGIN_COUNT_DOWN,

    ///// <summary>
    ///// 显示结束倒计时
    ///// </summary>
    //LEVEL_SHOW_END_COUNT_DOWN,

    /// <summary>
    /// 场景拾取物数据变化
    /// </summary>
    LEVEL_COLLECTITEM_DATA_CHG,

    /// <summary>
    /// 玩家学习技能，用于pvp模拟服务器，发消息到logic层，把逻辑跑一边
    /// </summary>
    LEVEL_PLAYER_LEARN_SKILL,

    /// <summary>
    /// 开始一个关卡事件
    /// </summary>
    LEVEL_START_LEVEL_EVENT,

    /// <summary>
    /// 无法拾取该道具，需要通知到表现现实tips
    /// </summary>
    LEVEL_CANT_GET_COLLECTITEM,

    //秘境积分变化
    LEVEL_MIJING_SCORE_CHANGE,

    //秘境剩余怪物数量
    LEVEL_MIJING_REMAIN_MONSTER_CNT,

    //秘境内各种提示
    LEVEL_MIJING_TIPS_CHANGE,

    //秘境进入下一个关卡
    LEVEL_MIJING_ENTER_NEXT_STAGE,

    //秘境是否需要在技能选择界面暂停战斗
    LEVEL_MIJING_NEED_PASUE_IN_SELECT_SKILL_UI,

    /// <summary>
    /// 守卫闪击积分变化
    /// </summary>
    LEVEL_GUARD_BLITZ_SCORE_CHANGE,

    /// <summary>
    /// 怪物走到终点
    /// </summary>
    LEVEL_MONSTER_GOTO_END_POS,

    /// <summary>
    /// 主角怒气值变化
    /// </summary>
    PLAYER_ENTITY_RAGE_CHG,
    #endregion


}
