using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public interface IBattleContextHost
{
    BattleContext Context { get; }
}

/// <summary>
/// 用于一些通用数据的存储和管理
/// </summary>
public class BattleContext
{
    #region Context实例化的数据
    /// <summary>
    /// 当前帧的流逝时间，固定值
    /// </summary>
    internal float deltaTime { get; private set; }

    //帧率
    public int fps { get; private set; }

    /// <summary>
    /// 按照模拟帧来计算的时间
    /// </summary>
    internal float time;

    public EntityVisualFactory visualFactory = new EntityVisualFactory();
    #endregion

    /// <summary>
    /// 战斗是否结束
    /// </summary>
    public bool IsBattleFinish = false;

    internal Battle battle;
    internal ActorEntityMgr actorMgr;
    internal SkillDamageHelper damageHelper;
    internal BattleLevelLogic logic;
    public int randomSeed;

    public void Init(int _fps, int _randSeed, Int64 _monsterWeakenHpRatio)
    {
        randomSeed = _randSeed;
        // random = TSRandom.New(randomSeed);

        deltaTime = 1f / _fps;
        fps = _fps;

    }

    public void BindVisual(Entity entity)
    {
        var typeId = entity.GetTypeId();
        switch (typeId)
        {
            case (int)EntityTypeDefine.EntityHero:
                var Visual = ActorMgr.Instance.GetPlayerActor();
                Visual.OwnActor = entity as ActorEntity;
                Visual.BindEntity = entity as ActorEntity;
                break;
            case (int)EntityTypeDefine.EntityMonster:
                var bossVisual = GameMgr.Instance.BossActor;
                bossVisual.OwnActor = entity as ActorEntity;
                bossVisual.BindEntity = entity as ActorEntity;
                break;
        }

        return; 
    }
}
