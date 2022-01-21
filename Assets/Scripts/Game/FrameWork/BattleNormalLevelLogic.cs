using System.Collections.Generic;
using UnityEngine;

public class NormalLevelLogic : BattleLevelLogic
{
    // private MapConfig m_mapCfg;

    //internal LevelLogicInfo m_info;

    /// <summary>
    /// 怪物刷新
    /// </summary>
    private LevelMonsterMgr m_monsterMgr;


    public NormalLevelLogic(BattleContext context) : base(context)
    {
        m_levelLogicType = LevelLogicType.SoloLevelType;
    }

    protected override bool OnInit()
    {
        m_monsterMgr = new LevelMonsterMgr(this);
        // m_itemMgr = new LevelItemMgr(this);
        // 地图表现相关的方法 例如寻路 地图拾取物等
        // m_info = new LevelLogicInfo();

        // 注册实体管理器的事件
        Context.actorMgr.OnActorCreate += OnActorCreate;
        Context.actorMgr.OnActorDieAction += OnActorDie;
        return true;
    }

    protected override void OnDestroy()
    {
        //m_monsterMgr.DestroyAll();
        //m_itemMgr.DestroyAll();

        //if (FTimer.IsNull(m_autoReliveTimer))
        //{
        //    Context.timerMgr.DestroyTimer(m_autoReliveTimer);
        //}
    }

    protected override bool OnStart()
    {
        Debug.Log("start normal level logic");
        //m_mapCfg = LevelCfgMgr.Instance.GetMapCfg((uint)m_mapID);
        //if (m_mapCfg == null)
        //{
        //    FLogger.EditorFatal("找不到关卡地图配置表:{0}", m_mapID);
        //    return false;
        //}

        m_monsterMgr.Init(m_curLevelBaseCfg.MonsterID);

        return true;
    }

    //internal override LevelLogicInfo GetLogicInfo()
    //{
    //    return m_info;
    //}

    void OnActorCreate(ActorEntity actor)
    {
        m_monsterMgr.OnActorCreate(actor);
    }

    void OnActorDie(ActorEntity actor)
    {
    }

    protected override void OnUpdate()
    {
        if (!Context.IsBattleFinish)
        {
            ///判断玩家是否结束了
            bool hasPlayerAlive = false;
            var listPlayer = Context.actorMgr.GetPlayerEntityList();
            for (int i = 0; i < listPlayer.Count; i++)
            {
                var playerEntity = listPlayer[i] as PlayerEntity;
                if (!playerEntity.IsDied)
                {
                    hasPlayerAlive = true;
                    break;
                }
            }


            if (m_monsterMgr.CheckAllkill())
            {

                //Debug.LogFormat("player is alive, end the battle, CurrFrame:{0}", Context.battle.m_currFrameId);
                Debug.Log("战斗结束");
                Context.IsBattleFinish = true;
            }
        }
    }

    internal override void OnAfterBattleWin()
    {
        //通知 logic 全部怪物死亡
        //SendVisualEvent(EntityVisualEvent.LEVEL_ALL_KILLED);
    }

    //internal override void DestroyItem(LevelItemEntity entity)
    //{
    //    m_itemMgr.DestroyItem(entity);
    //}

    public void SpawnNextWave()
    {
        m_monsterMgr.StartSpawn();
    }
}

