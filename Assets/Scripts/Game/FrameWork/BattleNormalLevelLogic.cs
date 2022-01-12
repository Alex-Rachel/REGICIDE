using System.Collections.Generic;
using DodGame;

namespace BattleCore
{
    public class NormalLevelLogic : BattleLevelLogic
    {
        // private MapConfig m_mapCfg;

        internal LevelLogicInfo m_info;

        /// <summary>
        /// 怪物刷新
        /// </summary>
        private MonsterMgr m_monsterMgr;


        public NormalLevelLogic(BattleContext context) : base(context)
        {
            m_levelLogicType = LevelLogicType.NormalLevelType;
        }

        protected override bool OnInit()
        {
            m_monsterMgr = new LevelMonsterMgr(this);
            m_itemMgr = new LevelItemMgr(this);
            m_info = new LevelLogicInfo();
            Context.actorMgr.OnActorCreate += OnActorCreate;
            Context.actorMgr.OnActorDieAction += OnActorDie;
            return true;
        }

        protected override void OnDestroy()
        {
            m_monsterMgr.DestroyAll();
            m_itemMgr.DestroyAll();

            if (FTimer.IsNull(m_autoReliveTimer))
            {
                Context.timerMgr.DestroyTimer(m_autoReliveTimer);
            }
        }

        protected override bool OnStart()
        {
            BLogger.Debug("start normal level logic");
            m_mapCfg = LevelCfgMgr.Instance.GetMapCfg((uint)m_mapID);
            if (m_mapCfg == null)
            {
                FLogger.EditorFatal("找不到关卡地图配置表:{0}", m_mapID);
                return false;
            }

            FProfiler.BeginTraceTime("GetLevelData");
            m_levelData = BattleLevelConfigMgr.Instance.LoadLevelData(m_mapCfg.LevelCfgPath);
            FProfiler.EndTraceTime();

            if (m_levelData == null)
            {
                FLogger.EditorFatal("读取地图{0}分布数据{1}失败", m_mapID, m_mapCfg.LevelCfgPath);
                return false;
            }

            m_info.Init(m_mapCfg, m_levelData);

            m_monsterMgr.Init(m_levelData.m_Monsters, m_mapCfg.RefreshTime);
            m_itemMgr.Init(m_levelData.m_Obstacles);

            var param = m_startParam.m_playerCreateParam;
            int playerCnt = param.Count;

            for (int i = 0; i < playerCnt; i++)
            {
                var createData = ActorEntityCreateData.CreatePlayerCreateData(param[i], ActorEntitySide.SideAtk);

                var bornPos = GetBornPos(i, playerCnt);
                createData.SetBornPos(bornPos, TSVector.forward);

                var playerEntity = Context.actorMgr.CreateActorEntity(createData, true) as PlayerEntity;
                if (playerEntity == null)
                {
                    FLogger.Error("create actor failed");
                    continue;
                }

                //var bornPos = GetBornPos(i, playerCnt);
                //playerEntity.transform.SetInitPos(bornPos, TSVector.forward);

                #region 分身

                bool isWear = param[i].ShadowData.IsWear;
                if (isWear)
                {
                    createData = ActorEntityCreateData.CreateShadowPlayerCreateData(param[i], ActorEntitySide.SideAtk);
                    createData.SetBornPos(bornPos, TSVector.forward);
                    var shadowPlayer = Context.actorMgr.CreateActorEntity(createData) as ShadowPlayerEntity;
                    if (shadowPlayer == null)
                    {
                        FLogger.Error("create shadowPlayer failed");
                    }
                    else
                    {
                        shadowPlayer.SetOwnerEntity(playerEntity);
                    }
                }

                #endregion
                for (int j = 0; j < param[i].m_petList.Count; j++)
                {
                    createData = ActorEntityCreateData.CreatePetCreateData(param[i].m_petList[j], ActorEntitySide.SideAtk);
                    var petEntity = Context.actorMgr.CreateActorEntity(createData) as PetEntity;
                    if (petEntity == null)
                    {
                        FLogger.Error("create actor pet failed {0}", createData.m_petParam.m_petID);
                        continue;
                    }

                    var tmp = Context.random.RandomInsideCircle(2);
                    var dstPos = bornPos;
                    dstPos.x += tmp.x;
                    dstPos.z += tmp.y;

                    FP radius = petEntity.ConfigData.RuntimeCapusRadius;
                    int layerMask = ActorEntityLayer.GetAllSceneColliderLayerMask();

                    var inDir = dstPos - bornPos;
                    var maxDist = inDir.magnitude;
                    if (maxDist > FP.EN4)
                    {
                        var inDirNormal = inDir / maxDist;
                        FP dist;
                        if (Context.world.CircleCastQuick(bornPos, radius, inDirNormal, out dist, maxDist, layerMask))
                        {
                            dstPos = dist * inDirNormal + bornPos;
                            FLogger.Info("sphere or line cast hit wall ");
                        }
                    }

                    petEntity.transform.position = dstPos;
                    petEntity.SetOwnerEntity(playerEntity);
                }

                playerEntity.RefreshPetSkill();

                ///判断是否需要挂worldboss的buff
                if (Context.m_worldBossParam != null || Context.m_customBossParam != null || Context.m_wuxingBossParam != null || Context.m_teamBossParam != null)
                {
                    var addBuffId = ParamConfigMgr.Instance.GetIntParam(FuncIdDef.WorldBossAddPlayerBuff);
                    if (addBuffId != 0)
                    {
                        playerEntity.BuffMgr.AddBuff(addBuffId, null, false);
                    }
                    else
                    {
                        BLogger.Error("invalid worldboss add player buff");
                    }
                }

                //五行洞窟boss给玩家的buffID 
                if (Context.m_wuxingBossParam != null)
                {
                    var buffCnt = Context.m_wuxingBossParam.BuffCnt;
                    var arr = Context.m_wuxingBossParam.BuffList;
                    for (int j = 0; j < buffCnt; j++)
                    {
                        if (arr[j] != 0)
                        {
                            playerEntity.BuffMgr.AddBuff((int)arr[j], null, false);
                        }
                    }
                }

                //先计后战boss给玩家的buffID 
                if (Context.m_teamBossParam != null)
                {
                    var buffCnt = Context.m_teamBossParam.BuffCnt;
                    var arr = Context.m_teamBossParam.BuffList;
                    for (int j = 0; j < buffCnt; j++)
                    {
                        if (arr[j] != 0)
                        {
                            playerEntity.BuffMgr.AddBuff((int)arr[j], null, false);
                        }
                    }
                }

                if (m_startParam.m_progress == 0)
                {
                    ActorEntityEventHelper.SendStateEvent(playerEntity, ActorStateEvent.Actor_EnterAppear);
                }
            }

            return true;
        }

        internal override LevelLogicInfo GetLogicInfo()
        {
            return m_info;
        }

        /// <summary>
        /// 获取出生位置
        /// </summary>
        /// <returns></returns>
        private TSVector GetBornPos(int idx, int playerCnt)
        {
            var size = m_info.GetMapSize();
            //第一关的话，直接出生在中间
            var ypos = m_startParam.m_progress == 0 ? TSMath.Ceiling(size.y / 2) : 1;
            var middleX = TSMath.Ceiling(size.x / 2);
            FP xPos;
            if (playerCnt == 1)
            {
                xPos = middleX;
            }
            else
            {
                if (idx == 0)
                {
                    xPos = middleX - 1;
                }
                else
                {
                    xPos = middleX + 1;
                }
            }

            //             FP xPos = TSMath.Ceiling(size.x / (1 + playerCnt)) * (idx + 1);

            return m_info.ConvGridPosToMapPos(new TSVector2(xPos, ypos), true);
        }

        void OnActorCreate(ActorEntity actor)
        {
            m_monsterMgr.OnActorCreate(actor);
        }

        void OnActorDie(ActorEntity actor)
        {
            if (ActorEntityHelper.IsPlayerActor(actor))
            {
                BLogger.Info("player is died, Frame[{0}]", Context.battle.m_currFrameId);

                if (actor.ActorData.AutoReliveCnt > 0)
                {
                    if (!FTimer.IsNull(m_autoReliveTimer))
                    {
                        Context.timerMgr.DestroyTimer(m_autoReliveTimer);
                    }

                    m_autoReliveTimer = Context.timerMgr.CreateOnceTimer("auto relive timer", 2, delegate
                    {
                        FP reliveHpPercent =
                            ParamConfigMgr.Instance.GetFloatParam(FuncIdDef.SkillReliveRecoveryHpPercent);
                        RelivePlayer(actor, reliveHpPercent);
                        actor.ActorData.AutoReliveCnt--;
                        SendVisualEvent(EntityVisualEvent.LEVEL_MAIN_ENTITY_DECREASE_AUTORELIVE, actor);
                    });

                }
                else
                {
                    // 通知 logic 显示复活界面
                    SendVisualEvent(EntityVisualEvent.LEVEL_SHOW_RELIVE, actor);
                }
            }
            else
            {
                m_monsterMgr.OnActorDie(actor);
            }
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

                ///如果全都死掉了，那么不用判断怪物是否结束,等待上层逻辑的死亡超时处理
                if (!hasPlayerAlive)
                {
                    return;
                }

                if (m_startParam.m_isAutoFinish || m_monsterMgr.CheckAllkill())
                {
                    var entities = Context.actorMgr.GetPlayerEntityList();
                    for (int i = 0; i < entities.Count; i++)
                    {
                        var bootyCmpt = entities[i].GetCmpt<ActorBootyCmpt>();
                        if (bootyCmpt != null && !bootyCmpt.NoRecoveryItem())
                        {
                            return;
                        }
                    }

                    BLogger.Info("player is alive, end the battle, CurrFrame:{0}", Context.battle.m_currFrameId);

                    Context.IsBattleFinish = true;
                }
            }
        }

        internal override void OnAfterBattleWin()
        {
            //通知 logic 全部怪物死亡
            SendVisualEvent(EntityVisualEvent.LEVEL_ALL_KILLED);
        }

        public override bool CheckPosIsValid(FP x, FP y)
        {
            return m_info.CheckPosIsValid(x, y);
        }

        public override void FindPath(TSVector startPos, TSVector endPos, ref List<TSVector> movePath)
        {
            m_info.FindPath(startPos, endPos, movePath);
        }

        public override void SyncPlayerEntityData(ulong roleID, int hp, int reliveNum, int noDeathCount, int shield)
        {
            if (!Context.IsBattleFinish)
            {
                FLogger.EditorFatal("只能在关卡结束后调用");
                return;
            }

            var actor = Context.actorMgr.FindPlayerEntityByRoleId(roleID);
            if (actor != null)
            {
                int chgNum = hp - actor.ActorData.HP;
                if (chgNum != 0)
                {
                    ActorEntityHelper.DirectAddHp(actor, chgNum);
                }

                actor.ActorData.AutoReliveCnt = reliveNum;
                actor.ActorData.NoDeathCount = noDeathCount;
                actor.ActorData.Shield = shield;
                actor.ActorData.MarkBaseImpactDirty();

                BLogger.Info("HP[{0}] AutoRelive[{1}] NoDeathCount[{2}] Shield[{3}]", hp, reliveNum, noDeathCount, shield);
            }
        }

        public override void SyncPlayerEntityAttr(ulong roleID, ActorAttrData attrData)
        {
            if (!Context.IsBattleFinish)
            {
                FLogger.EditorFatal("只能在关卡结束后调用");
                return;
            }

            var actor = Context.actorMgr.FindPlayerEntityByRoleId(roleID);
            if (actor != null)
            {
                actor.ActorData.m_baseData.Set(attrData);
                actor.ActorData.MarkBaseImpactDirty();
            }
        }

        public override void SyncPlayerSkill(ulong roleID, uint skillID)
        {
            if (!Context.IsBattleFinish)
            {
                FLogger.EditorFatal("只能在关卡结束后调用");
                return;
            }

            var actor = Context.actorMgr.FindPlayerEntityByRoleId(roleID);
            if (actor != null)
            {
                actor.LearnSkill(skillID);
            }
        }

        public override void OpenGate()
        {
            Context.battleLevel.OpenGate();
        }

        internal override void DestroyItem(LevelItemEntity entity)
        {
            m_itemMgr.DestroyItem(entity);
        }

        public void SpawnNextWave()
        {
            m_monsterMgr.StartSpawn();
        }
    }
}
