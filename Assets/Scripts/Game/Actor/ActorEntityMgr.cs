using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

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
class ActorEntityMgr : BattleSystem
{

    internal List<ActorEntity> m_listActor = new List<ActorEntity>();
    private Dictionary<uint, ActorEntity> m_actorPool = new Dictionary<uint, ActorEntity>();
    private List<ActorEntity>[] m_listSide = new List<ActorEntity>[(int)ActorEntitySide.SideCnt];
    private List<ActorEntity> m_listPlayer = new List<ActorEntity>();
    private List<ActorEntity> m_listDiedActor = new List<ActorEntity>();


    public event Action<ActorEntity> OnActorCreate;
    public event Action<ActorEntity> OnActorDestory;
    public event Action<ActorEntity> OnActorDieAction;
    public event Action<ActorEntity, ActorEntity, List<ActorEntity>> OnActorKillAction;

    private uint m_nextActorId;

    protected override bool OnInit()
    {
        for (int i = 0; i < m_listSide.Length; i++)
        {
            m_listSide[i] = new List<ActorEntity>();
        }

        // m_actorPhysics = new ActorPhysics(this);
        return true;
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
            Debug.LogErrorFormat("create actor failed, create data is {0}", createData);
            return null;
        }

        // actor.IsStartActor = isStartActor;
        if (!actor.Create(createData))
        {
            DestroyActor(actor);
            return null;
        }

        // TODO事件
        if (OnActorCreate != null)
        {
            OnActorCreate(actor);
        }

        Debug.LogFormat("actor created: {0}", actor.name);
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
            case ActorEntityType.eMonster:
                {
                    newActor = new MonsterEntity(Context);
                    break;
                }
            default:
                {
                    Debug.LogErrorFormat("unknown actor type:{0}", actorType);
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


    public List<ActorEntity> GetPlayerEntityList()
    {
        return m_listPlayer;
    }

    private bool DestroyActor(ActorEntity actor)
    {
        Debug.LogFormat("on destroy actor {0}", actor.ActorID);

        if (actor.IsDestroyed)
        {
            return false;
        }

        var actorID = actor.ActorID;
        Debug.Assert(m_actorPool.ContainsKey(actorID));

        var side = actor.ActorEntitySide;
        var sideList = m_listSide[(int)side];
        sideList.Remove(actor);

        // TODO 事件
        if (OnActorDestory != null)
        {
            OnActorDestory(actor);
        }

        actor.Destroy();
        m_actorPool.Remove(actorID);
        m_listActor.Remove(actor);
        // m_listPlayer.Remove(actor);

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

        // CheckDiedActor();
    }

    protected override void OnDestroy()
    {
        var listActor = m_listActor;
        for (int i = 0; i < listActor.Count; i++)
        {
            var actor = listActor[i];
            actor.Destroy();
        }

        m_listActor.Clear();
        m_actorPool.Clear();
        m_listPlayer.Clear();
        for (int i = 0; i < m_listSide.Length; i++)
        {
            m_listSide[i].Clear();
        }
    }

    private void CheckDiedActor()
    {
        var nowTime = Context.time;
        var listDied = m_listDiedActor;
        for (int i = 0; i < listDied.Count; i++)
        {
            var actor = listDied[i];
            if (actor.IsDestroyed)
            {
                listDied.RemoveAt(i);
                i--;
                continue;
            }

            ///判断是否需要清理
            //if (actor.m_waitDestroyTime <= nowTime)
            //{
            //    DestroyActor(actor);

            //    listDied.RemoveAt(i);
            //    i--;
            //    continue;
            //}
        }
    }

    #region 通用事件

    public void OnActorDied(ActorEntity actor)
    {
        if (actor.ActorType != ActorEntityType.eGamePlayer)
        {
            var listDiedActor = m_listDiedActor;
            if (!listDiedActor.Contains(actor))
            {
                listDiedActor.Add(actor);
            }
        }

        if (OnActorDieAction != null)
        {
            OnActorDieAction(actor);
        }
    }

    public void OnActorKill(ActorEntity killer, ActorEntity victim, List<ActorEntity> assistList)
    {
        if (OnActorKillAction != null)
        {
            OnActorKillAction(killer, victim, assistList);
        }
    }

    #endregion

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

    internal static ActorEntityCreateData CreateMonsterCreateData(uint monsterID, ActorEntitySide side)
    {
        var createData = new ActorEntityCreateData();
        createData.m_actorType = ActorEntityType.eMonster;
        createData.m_side = side;
        createData.m_monsterID = monsterID;
        return createData;
    }

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
