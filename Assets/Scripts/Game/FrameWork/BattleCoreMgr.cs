using System;

public class BattleCoreMgr
{
    public static bool IsDebugMode()
    {
#if DOD_DEBUG
            return true;
#else
        return false;
#endif
    }

    public static BattleContext CreateContext(int fps, int randSeed,
        Int64 monsterWeakenHpRatio)
    {
        var context = new BattleContext();
        context.Init(fps, randSeed, monsterWeakenHpRatio);
        return context;
    }

    public static Battle CreateBattle(BattleContext context)
    {

        var battle = new Battle(context);
        if (!battle.Create())
        {
            return null;
        }

        context.battle = battle;
        return battle;
    }

    public static void DestroyBattle(Battle battle)
    {
        battle.Destroy();
        // FMemPoolMgr.Instance.ClearAllPool();
    }
}
