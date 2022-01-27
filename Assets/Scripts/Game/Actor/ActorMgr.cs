using System.Collections;
using UnityEngine;

public class ActorMgr : Singleton<ActorMgr>
{
    public GameActor InstanceActor(CardData cardData)
    {
        return new BossActor(cardData);
    }

    public BossActor InstanceBossActor(CardData cardData)
    {
        if (GameMgr.Instance.BossActor == null)
        {
            return new BossActor(cardData);
        }
        else
        {
            GameMgr.Instance.BossActor = null;
            var actor = new BossActor(cardData);
            GameMgr.Instance.BossActor = actor;
            return actor;
        }
    }

    public BossActor InstanceBossActor(int cardInt)
    {
        var cardData = new CardData(cardInt);

        GameOnlineMgr.Instance.CurrentBossIndex++;

        if (GameMgr.Instance.BossActor == null)
        {
            return new BossActor(cardData);
        }
        else
        {
            GameMgr.Instance.BossActor = null;
            var actor = new BossActor(cardData);
            GameMgr.Instance.BossActor = actor;
            return actor;
        }
    }

    public PlayerActor GetPlayerActor()
    {
        if (GameMgr.Instance.BossActor == null)
        {
            return new PlayerActor();
        }
        else
        {
            // GameMgr.Instance.BossActor = null;
            var actor = new PlayerActor();
            // GameMgr.Instance.BossActor = actor;
            return actor;
        }
    }



    public GameActor CreateActor(int typeId, ActorEntity entity)
    {
        GameActor ret = CreateGameActorObject(typeId, entity);

        //if (ret == null)
        //{
        //    DLogger.Error("create actor failed, create data is {0}", typeId, entity.name);
        //    return null;
        //}

        //if (!ret.Create(entity))
        //{
        //    DestroyActor(ret);
        //    return null;
        //}

        //if (ret.IsCtrlActor)
        //{
        //    m_ctrlActor = ret;
        //}

        //if (OnActorCreate != null)
        //{
        //    OnActorCreate(ret);
        //}

        return ret;
    }

    private GameActor CreateGameActorObject(int typeId, ActorEntity entity)
    {
        GameActor newActor = null;

        //switch (typeId)
        //{
        //    case (int)EntityTypeDefine.EntityHero:
        //    {
        //        newActor = new GamePlayer();
        //        break;
        //    }
        //    case (int)EntityTypeDefine.EntityMonster:
        //    {
        //        newActor = new GameMonster();
        //        break;
        //    }
        //    case (int)EntityTypeDefine.EntityPet:
        //    {
        //        newActor = new GamePet();
        //        break;
        //    }
        //    case (int)EntityTypeDefine.EntityShadowPlayer:
        //    {
        //        newActor = new GameShadowPlayer();
        //        break;
        //    }
        //    case (int)EntityTypeDefine.EntitySummonPet:
        //    {
        //        newActor = new GameSummonPet();
        //        break;
        //    }
        //    default:
        //    {
        //        DLogger.Error("unknown actor type:{0}", typeId);
        //        break;
        //    }
        //}

        //if (newActor != null)
        //{
        //    newActor.ActorID = entity.ActorID;
        //    DLogger.EditorAssert(!m_dictAllActor.ContainsKey(newActor.ActorID));
        //    m_dictAllActor[newActor.ActorID] = newActor;

        //    if (newActor.GetActorType() == ActorType.eGamePlayer)
        //    {
        //        m_dictRoleIDActor[entity.CreateData.m_playerParam.roleId] = newActor;
        //    }
        //}

        return newActor;
    }

    public bool DestroyActor(GameActor actor)
    {
        if (actor != null)
        {

            //if (actor.BindEntity != null && actor.GetActorType() == ActorType.eGamePlayer)
            //{
            //    var roleID = actor.BindEntity.CreateData.m_playerParam.roleId;
            //    m_dictRoleIDActor.Remove(roleID);
            //}

            //actor.Destroy();
            //if (OnActorDestory != null)
            //{
            //    OnActorDestory(actor);
            //}

            return true;
        }

        return false;
    }
}