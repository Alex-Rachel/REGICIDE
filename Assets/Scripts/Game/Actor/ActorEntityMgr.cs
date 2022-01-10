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

public enum ActorEntitySide
{
    SideNone = 0,
    SideAtk,
    SideDef,
    SidePvp1,
    SideCnt
}


/// <summary>
/// 管理所有 实体
/// </summary>
public class ActorEntityMgr : IBattleContextHost
{

    internal List<ActorEntity> m_listActor = new List<ActorEntity>();
    private Dictionary<uint, ActorEntity> m_actorPool = new Dictionary<uint, ActorEntity>();
    private List<ActorEntity>[] m_listSide = new List<ActorEntity>[(int)ActorEntitySide.SideCnt];
    private List<ActorEntity> m_listPlayer = new List<ActorEntity>();

    private uint m_nextActorId;

    public BattleContext Context
    {
        get
        {
            return Context;
        }
    }

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
            // FLogger.Error("create actor failed, create data is {0}", createData);
            return null;
        }

        // actor.IsStartActor = isStartActor;
        if (!actor.Create(createData))
        {
            DestroyActor(actor);
            return null;
        }

        // TODO事件
        //if (OnActorCreate != null)
        //{
        //    OnActorCreate(actor);
        //}

        // BLogger.Debug("actor created: {0}", actor.name);
        return actor;
    }

    /// <summary>
    /// 创建实体 obj接口
    /// </summary>
    /// <param name="actorType"></param>
    /// <param name="actorID"></param>
    /// <param name="side"></param>
    /// <returns></returns>
    private ActorEntity CreateActorEntityObject(ActorEntityType actorType, uint actorID, ActorEntitySide side)
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
                    // FLogger.Error("unknown actor type:{0}", actorType);
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
        // FLogger.Debug("on destroy actor {0}", actor.ActorID);

        if (actor.IsDestroyed)
        {
            return false;
        }

        var actorID = actor.ActorID;
        // FLogger.Assert(m_actorPool.ContainsKey(actorID));

        var side = actor.ActorEntitySide;
        var sideList = m_listSide[(int)side];
        sideList.Remove(actor);

        // TODO 事件
        //if (OnActorDestory != null)
        //{
        //    OnActorDestory(actor);
        //}

        actor.Destroy();
        m_actorPool.Remove(actorID);
        m_listActor.Remove(actor);
        // m_listPlayer.Remove(actor);

        return true;
    }


    protected void FixedUpdate()
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
            // actor.FlushVisualEvent();
        }

        // CheckDiedActor();
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


    internal static ActorEntityCreateData CreatePlayerCreateData(PlayerCreateParam param, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eGamePlayer;
        createData.m_side = side;
        createData.m_playerParam = param;

        return createData;
    }

    //internal static ActorEntityCreateData CreateMonsterCreateData(uint monsterID, ActorEntitySide side)
    //{
    //    var createData = new ActorEntityCreateData();
    //    createData.m_actorType = ActorEntityType.eMonster;
    //    createData.m_side = side;
    //    createData.m_monsterID = monsterID;
    //    return createData;
    //}

    //internal static ActorEntityCreateData CreateMonsterCreateData(MonsterCreateParam param, ActorEntitySide side)
    //{
    //    var createData = new ActorEntityCreateData();
    //    createData.m_actorType = ActorEntityType.eMonster;
    //    createData.m_side = side;
    //    createData.m_monsterID = param.m_monsterID;
    //    createData.m_monsterParam = param;
    //    return createData;
    //}
}


/// <summary>
/// 主角相关参数
/// </summary>
public class PlayerCreateParam
{
    public UInt64 roleId;
    public string roleName;
    public int playerLv;
    public int bodyType;

    //基础属性部分
    // public ActorAttrData m_baseAttrData = new ActorAttrData();

    //玩家血量
    public int HP;

    //玩家内力
    public int MP;

    //学习的技能列表
    internal List<uint> SelectSkillList = new List<uint>();

    //装备上的buff列表
    internal List<int> EquipBuffList = new List<int>();

    public PlayerCreateParam()
    {
        //for (int i = 0; i < m_zhaoShiList.Length; i++)
        //{
        //    m_zhaoShiList[i] = new ZhaoShiEntry();
        //}
    }

    public int GetSelectSkillCnt()
    {
        return SelectSkillList.Count;
    }

    public uint GetSkillID(int i)
    {
        return SelectSkillList[i];
    }

    public void AddSkill(uint skillID)
    {
        SelectSkillList.Add(skillID);
    }

    public int GetEquipBuffCnt()
    {
        return EquipBuffList.Count;
    }

    public int GetEquipBuffID(int idx)
    {
        return EquipBuffList[idx];
    }

    public void AddEquipBuff(int buffID)
    {
        EquipBuffList.Add(buffID);
    }
}
public class MonsterCreateParam
{
    public UInt32 m_monsterID;//怪物ID
    public float m_atkAddRate;//攻击系数
    public float m_hpAddRate;//生命系数
    public float m_damageReduceRate;//伤害减免系数
    public int m_wave;//当前所属波次
    public bool m_isBoss;//是否是boss
}
