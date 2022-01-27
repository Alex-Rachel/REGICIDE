using System.Collections.Generic;

/// <summary>
/// 整个战斗的玩法逻辑父类，不同的玩法创建不同的实例，主要是为了扩展接口
/// </summary>
public class BattleLevelLogic : Entity
{
    protected int m_mapID;

    protected StartLevelParam m_startParam;
    protected LevelBaseConfig m_curLevelBaseCfg;

    internal LevelLogicType m_levelLogicType = LevelLogicType.BaseType;
    public int LogicType
    {
        get { return (int)m_levelLogicType; }
    }

    // 玩法的额外数据
    // protected BattleLogicData m_battleLogicData = new BattleLogicData();

    public override string name { get; }

    public override int GetTypeId()
    {
        return (int)EntityTypeDefine.BattleLevelLogic;
    }

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
        m_curLevelBaseCfg = LevelConfigMgr.Instance.GetLevelBaseCfg((int)startParam.m_levelID);
        return OnStart();
    }

    public bool AfterStart()
    {
        return OnAfterStart();
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

    protected virtual bool OnAfterStart()
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

    public virtual void SyncPlayerSkill(ulong roleID, uint skillID)
    {

    }

    public virtual void OpenGate() { }


    internal LevelBaseConfig GetCurLevelBaseCfg()
    {
        return m_curLevelBaseCfg;
    }

    /// <summary>
    /// 战斗结束后
    /// </summary>
    internal virtual void OnAfterBattleWin()
    {
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


}
