using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;


class BattleCoreSys : BaseLogicSys<BattleCoreSys>
{
    private Battle m_currBattle;
    private StartLevelParam m_currStartParam;

    public override bool OnInit()
    {
//        var coreDriver = new BattleCoreDriver();
//        coreDriver.OnShowGmText = ShowGmText;
//        BattleCoreMgr.RegDriver(coreDriver);

//        RefreshFps(false);
        
        DodEntityVisualFactory.Init();

//#if DOD_DEBUG
//            m_timer = GameTimerMgr.Instance.CreateLoopTimer("debug battle core", 5, DebugTimer);
//#endif
        return true;
    }

    public static int FixedFps = 30; 
    public bool InitBattle(StartLevelParam startParam)
    {
        DestroyBattle();

        BattleSys.Instance.LogicVisual.Init(false);

        // 帧率 随机种子
        var context = BattleCoreMgr.CreateContext(FixedFps, 1, 1);

        DodEntityVisualFactory.ApplyEntityVisualFactoru(context.visualFactory);

        var battle = BattleCoreMgr.CreateBattle(context);
        if (battle == null)
        {
            Debug.LogError("create battle failed");
            return false;
        }
        m_currBattle = battle;
        m_currStartParam = startParam;
        // BattleCoreUtil.CurrBattle = battle;

        var ret = m_currBattle.StartLevel(startParam);
        if (!ret)
        {
            Debug.LogError("create battle level failed");
            return false;
        }


        return true;
    }

    public void DestroyBattle()
    {
        if (m_currBattle != null)
        {
            BattleCoreMgr.DestroyBattle(m_currBattle);
            m_currBattle = null;
            m_currStartParam = null;
        }
    }
}


