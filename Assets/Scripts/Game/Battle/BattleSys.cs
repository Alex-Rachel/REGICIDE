using System;
using System.Collections.Generic;


/// <summary>
/// 开启战斗入口 包括异步加载 接受网络回调开启战斗 并且用于与 局内进行交互
/// </summary>
class BattleSys : Singleton<BattleSys>
{
    /// <summary>
    /// 专门用于管理
    /// </summary>
    public LevelLogicVisual LogicVisual = new LevelLogicVisual();

    public void StartLevel(LevelDiffType diff)
    {
        LevelMgr.Instance.StartLevel(diff);
    }

    public bool InitBattle()
    {
        //var context = BattleCoreMgr.CreateContext(BattleCoreUtil.FixedFps, battleParam.randSeed,
        //    battleParam.monsterWeakenHpRatio);
        return true;
    }

    public void OnLevelEnd()
    {
        // m_levelMgr.OnLevelEnd();
    }
}

