using System.Collections.Generic;

namespace BattleCore
{
    class LevelMonsterMgr
    {
        private BattleLevelLogic m_ownLogic;

        private List<ActorEntity> m_monsters = new List<ActorEntity>();

        private bool m_haveSpawned;

        private bool m_hasSendStartBattleEvent;

        public LevelMonsterMgr(BattleLevelLogic logic)
        {
            m_ownLogic = logic;
            m_hasSendStartBattleEvent = false;
        }

        /// <summary>
        /// 初始化管理器
        /// </summary>
        /// <param name="monsters">怪物分布数据</param>
        /// <param name="refreshTime">刷新时间</param>
        /// <param name="mapStartPos">地图起始位置</param>
        public void Init(int[] monsterArr)
        {

        }

        /// <summary>
        /// 开始生成怪物
        /// </summary>
        public void SpawnMonsterByWave()
        {
        }


        /// <summary>
        /// 触发开始战斗
        /// </summary>
        private void TriggerStartBattle()
        {
            m_hasSendStartBattleEvent = true;

        }

        public void OnActorCreate(ActorEntity actor)
        {
            if (actor.ActorType == ActorEntityType.eMonster)
            {
                m_monsters.Add(actor);
            }
        }

        /// <summary>
        /// 怪物死亡
        /// </summary>
        /// <param name="actor"></param>
        public void OnActorDie(ActorEntity actor)
        {
            m_monsters.Remove(actor);
        }

        /// <summary>
        /// 检查当前怪物是否被击杀完
        /// </summary>
        /// <returns></returns>
        public bool CheckAllkill()
        {

            return true;
        }

        /// <summary>
        /// 生成怪物
        /// </summary>
        /// <param name="monster"></param>
        void SpawnMonster(int monsterID)
        {
            MonsterBaseConfig monsterCfg = MonsterConfigMgr.Instance.GetMonsterConfig(monsterID);
            if (monsterCfg == null)
            {
                return;
            }

            ActorEntityCreateData data = ActorEntityCreateData.CreateMonsterCreateData((uint)monsterID, ActorEntitySide.SideDef);


            //var actor = m_ownLogic.Context.actorMgr.CreateActorEntity(data);
            //if (actor != null)
            //{
            //    var entities = m_ownLogic.Context.actorMgr.GetAllActorsBySide(ActorEntitySide.SideAtk);
            //    for (int i = 0; i < entities.Count; i++)
            //    {
            //        if (ActorEntityHelper.CanBeSelectAsTarget(entities[i]))
            //        {
            //            actor.Target = entities[i];
            //            break;
            //        }
            //    }

            //}
        }

        public void DisableAllMonsterAI()
        {
            for (int i = 0; i < m_monsters.Count; i++)
            {
                // m_monsters[i].RemoveCmpt<AICmpt>();
            }
        }

        public void DestroyAll()
        {
            m_monsters.Clear();
        }

        public void StartSpawn()
        {

            SpawnMonsterByWave();
            
        }
    }
}
