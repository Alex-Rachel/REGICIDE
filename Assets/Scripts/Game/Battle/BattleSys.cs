using System;
using System.Collections.Generic;


/// <summary>
/// 开启战斗入口 包括异步加载 接受网络回调开启战斗
/// </summary>
class BattleSys : Singleton<BattleSys>
{
    public void StartLevel(LevelDiffType diff)
    {
        LevelMgr.Instance.StartLevel(diff);
    }

    public bool InitBattle()
    {
        var context = BattleCoreMgr.CreateContext(BattleCoreUtil.FixedFps, battleParam.randSeed,
            battleParam.monsterWeakenHpRatio);
    }
}

