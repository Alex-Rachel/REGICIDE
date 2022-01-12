using System.Collections.Generic;

/// <summary>
/// 整个战斗的玩法逻辑父类，不同的玩法创建不同的实例，主要是为了扩展接口
/// </summary>
public class BattleLevelLogic : Entity
{
    protected int m_mapID;

    protected StartLevelParam m_startParam;
    private LevelBaseConfig m_curLevelBaseCfg;

    internal LevelLogicType m_levelLogicType = LevelLogicType.BaseType;
    public int LogicType
    {
        get { return (int)m_levelLogicType; }
    }

    // 玩法的额外数据
    // protected BattleLogicData m_battleLogicData = new BattleLogicData();

    public override string name { get; }

    public BattleLevelLogic(BattleContext context)
    {
        InitEntity(context);
    }

    public void Destroy()
    {
        OnDestroy();
    }

    public bool Init(Battle battle)
    {
        return OnInit();
    }

    public bool Start(int mapID, StartLevelParam startParam)
    {
        m_mapID = mapID;
        m_startParam = startParam;
        m_curLevelBaseCfg = LevelCfgMgr.Instance.GetLevelBaseCfg(startParam.m_levelID);
        return OnStart();
    }

    public void Update()
    {
        OnUpdate();
    }

    protected virtual bool OnStart()
    {
        return true;
    }

    protected virtual bool OnInit()
    {
        return true;
    }

    protected virtual void OnDestroy()
    {
    }

    protected virtual void OnUpdate()
    {
    }

    public virtual void SyncPlayerEntityData(ulong roleID, int hp, int reliveNum, int noDeathCount, int shield)
    {

    }

    public virtual void SyncPlayerEntityAttr(ulong roleID, ActorAttrData attrData)
    {

    }

    public virtual void SyncPlayerSkill(ulong roleID, uint skillID)
    {

    }

    public virtual void OpenGate() { }

    internal virtual void RelivePlayer(ActorEntity entity, FP hpPercent, byte cmdReliveType = 0)
    {
        //复活玩家
        if (!entity.IsDied)
        {
            return;
        }

        ///记录复活次数
        entity.ActorData.TotalReliveCnt++;
        ActorEntityEventHelper.SendStateEvent(entity, ActorStateEvent.Actor_Relive);

        var addHp = entity.ActorData.AttrData.MaxHP * hpPercent;
        ActorEntityHelper.DirectAddHp(entity, addHp.AsInt());

        BLogger.Info("relive player now: {0}, frameId:{1} hpPercent:{2} currHP:{3}",
            entity.ActorID, Context.battle.m_currFrameId, hpPercent.AsFloat(),
            entity.ActorData.HP);

        var buffId = ParamConfigMgr.Instance.GetIntParam(FuncIdDef.UnDeadBuffId);
        entity.BuffMgr.AddBuff(buffId, entity, false);

        SendVisualEvent(EntityVisualEvent.LEVEL_PLAYER_ENTITY_RELIVE, entity);
    }

    public virtual void FindPath(TSVector startPos, TSVector endPos, ref List<TSVector> movePath)
    {

    }

    public virtual BattleLogicData GetBattleLogicData()
    {
        return m_battleLogicData;
    }

    internal LevelBaseConfig GetCurLevelBaseCfg()
    {
        return m_curLevelBaseCfg;
    }

    internal virtual LevelLogicInfo GetLogicInfo()
    {
        return null;
    }

    internal virtual LevelExpCalc GetExpCalc()
    {
        return null;
    }

    internal virtual LevelRandomSkillCtrl GetRandomSkillCtrl()
    {
        return null;
    }

    internal virtual void DestroyItem(LevelItemEntity entity)
    {
        FLogger.EditorFatal("call base DestroyItem. pls override");
    }

    /// <summary>
    /// 战斗结束后
    /// </summary>
    internal virtual void OnAfterBattleWin()
    {
    }

    /// <summary>
    /// 不同玩法的规则可能不一样
    /// </summary>
    /// <param name="selfActor"></param>
    /// <returns></returns>
    internal virtual void GetTargetList(ActorEntity selfActor, FMultiList<ActorEntity> listResult)
    {
        Context.actorMgr.GetAllActorsBySide(ActorEntityHelper.GetEnemySide(selfActor), listResult);
    }

    internal virtual void ClientLearnSkill(ulong roleId, int skillId)
    {
        //SyncPlayerSkill(roleId, (uint)skillId);
        //SendVisualEvent(EntityVisualEvent.LEVEL_PLAYER_LEARN_SKILL, new LearnSkillParam(roleId, skillId));
    }

    internal virtual void SelectClientRandomSkill(ActorEntity actor, uint gid, int skillId)
    {

    }

    internal virtual void ClientEquipZhaoShi(ActorEntity actor, int zhaoShiId)
    {

    }

    internal virtual void OnCmdSkill(ActorEntity actor, uint skillID)
    {

    }

    internal virtual void OnOnCollectSucc(ActorEntity actor, CollectItemEntity collectItemEntity)
    {

    }

    /// <summary>
    /// 检查actor是否可以拾取该物品，主要用于与玩法相关的非通用判断
    /// </summary>
    /// <returns></returns>
    internal virtual bool CheckActorCanCollect(ActorEntity actorEntity, CollectItemEntity collectItemEntity)
    {
        return true;
    }
}
