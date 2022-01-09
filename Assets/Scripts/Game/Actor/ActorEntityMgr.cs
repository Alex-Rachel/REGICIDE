using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public enum ActorEntityType
{
    eActorNone,
    eGamePlayer,
    eMonster,
    ePet,
    eMaxType,
}


/// <summary>
/// 管理所有 实体
/// </summary>
public class ActorEntityMgr
{

    internal List<ActorEntity> m_listActor = new List<ActorEntity>();


    /// <summary>
    /// 创建实体接口
    /// </summary>
    /// <param name="createData"></param>
    /// <param name="isStartActor"></param>
    /// <returns></returns>
    public ActorEntity CreateActorEntity(ActorEntityCreateData createData, bool isStartActor = false)
    {
        var actor = CreateActorEntityObject(createData.m_actorType, ++m_nextActorId, createData.m_side);
        if (actor == null)
        {
            FLogger.Error("create actor failed, create data is {0}", createData);
            return null;
        }

        actor.IsStartActor = isStartActor;
        if (!actor.Create(createData))
        {
            DestroyActor(actor);
            return null;
        }

        if (OnActorCreate != null)
        {
            OnActorCreate(actor);
        }

        BLogger.Debug("actor created: {0}", actor.name);
        return actor;
    }

    /// <summary>
    /// 创建实体 obj接口
    /// </summary>
    /// <param name="actorType"></param>
    /// <param name="actorID"></param>
    /// <param name="side"></param>
    /// <returns></returns>
    private ActorEntity CreateActorEntityObject(ActorEntityType actorType, uint actorID)
    {
        ActorEntity newActor = null;

        switch (actorType)
        {
            case ActorEntityType.eGamePlayer:
                {
                    newActor = new PlayerEntity(Context);
                    break;
                }
            default:
                {
                    FLogger.Error("unknown actor type:{0}", actorType);
                    break;
                }
        }

        if (newActor != null)
        {
            newActor.SetBaseData(actorID, side);
            m_actorPool.Add(actorID, newActor);
            m_listActor.Add(newActor);

            var sideList = m_listSide[(int)side];
            sideList.Add(newActor);
            if (actorType == ActorEntityType.eGamePlayer)
            {
                m_listPlayer.Add(newActor);
            }
        }

        return newActor;
    }


    private bool DestroyActor(ActorEntity actor)
    {
        FLogger.Debug("on destroy actor {0}", actor.ActorID);

        if (actor.IsDestroyed)
        {
            return false;
        }

        var actorID = actor.ActorID;
        FLogger.Assert(m_actorPool.ContainsKey(actorID));

        var side = actor.ActorEntitySide;
        var sideList = m_listSide[(int)side];
        sideList.Remove(actor);
        if (OnActorDestory != null)
        {
            OnActorDestory(actor);
        }

        actor.Destroy();
        m_actorPool.Remove(actorID);
        m_listActor.Remove(actor);
        m_listPlayer.Remove(actor);

        return true;
    }


    protected override void FixedUpdate()
    {
        var listActor = m_listActor;

        for (int i = 0; i < listActor.Count; i++)
        {
            var actor = listActor[i];
            actor.CallFixedUpdate();
        }
        for (int i = 0; i < listActor.Count; i++)
        {
            var actor = listActor[i];
            actor.FlushVisualEvent();
        }

        CheckDiedActor();
    }
}

public class ActorEntityCreateData
{
    //通用
    public ActorEntitySide m_side;

    public ActorEntityType m_actorType;

    //主角
    public PlayerCreateParam m_playerParam;

    //怪物
    public uint m_monsterID;

    //怪物创建参数
    public MonsterCreateParam m_monsterParam;

    //宠物相关
    public PetCreateParam m_petParam;

    //召唤数据
    public PlayerSummonElemData m_summonData;

    //召唤已战斗时间
    public uint m_summonCanShowTime;

    //召唤战斗时间
    public uint m_summonShowTime;

    public bool m_hasBornPos = false;
    public TSVector m_bornPos;
    public TSVector m_bornForward;

    /// <summary>
    /// 设置出生点
    /// </summary>
    /// <param name="bornPos"></param>
    public void SetBornPos(TSVector bornPos, TSVector forward)
    {
        m_hasBornPos = true;
        m_bornPos = bornPos;
        m_bornForward = forward;
    }

    public override string ToString()
    {
        return string.Format("monsterid:{0}\n bodytype:{1}\n clothid:{2}\n actortype:{3}\n", m_monsterID,
            m_playerParam.bodyType, m_playerParam.clothID, m_actorType);
    }

    internal static ActorEntityCreateData CreatePlayerCreateData(PlayerCreateParam param, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eGamePlayer;
        createData.m_side = side;
        createData.m_playerParam = param;

        return createData;
    }

    internal static ActorEntityCreateData CreateMonsterCreateData(uint monsterID, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eMonster;
        createData.m_side = side;
        createData.m_monsterID = monsterID;
        return createData;
    }

    internal static ActorEntityCreateData CreateMonsterCreateData(MonsterCreateParam param, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eMonster;
        createData.m_side = side;
        createData.m_monsterID = param.m_monsterID;
        createData.m_monsterParam = param;
        return createData;
    }

    internal static ActorEntityCreateData CreatePetCreateData(PetCreateParam petData, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.ePet;
        createData.m_side = side;
        createData.m_petParam = petData;
        return createData;
    }

    internal static ActorEntityCreateData CreateShadowPlayerCreateData(PlayerCreateParam param, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eShadowPlayer;
        createData.m_side = side;
        createData.m_playerParam = param;

        return createData;
    }

    internal static ActorEntityCreateData CreateSummonPetCreateData(PlayerSummonElemData summonData,
        ActorEntitySide side, uint summonShowedTime, uint summonShowTime)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eSummonPet;
        createData.m_side = side;
        createData.m_summonData = summonData;
        createData.m_summonCanShowTime = summonShowedTime;
        createData.m_summonShowTime = summonShowTime;
        return createData;
    }
}
