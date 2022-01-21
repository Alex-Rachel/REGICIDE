using System;
using System.Collections.Generic;
using UnityEngine;

public class SkillRepeatVisualInterface
{
    //public Action<uint, uint, SkillElemEffect> OnCreateEffectHandle;
    //public Action<uint, uint, SkillElemSound> OnCreateSoundHandle;
    //public Action<uint, uint, SkillElemHideObj> OnCreateHideObjHandle;
    public Action<uint, uint> OnDestroyHandle;

    /// <summary>
    /// 自我销毁
    /// </summary>
    public Action OnSelfDestroy;


    #region 事件机制

    //public Action<uint, uint, SkillShootTargetData> OnShootTarget;
    //public Action<uint, uint> OnTranslateFinish;
    //public Action<uint, uint, HitWallTriggerData> OnHitScene;
    //public Action<uint, uint> OnSelfTrigger;

    #endregion

    public void Clear()
    {
        //OnCreateEffectHandle = null;
        //OnCreateSoundHandle = null;
        //OnCreateHideObjHandle = null;
        OnDestroyHandle = null;
        OnSelfDestroy = null;

        //OnShootTarget = null;
        //OnTranslateFinish = null;
        //OnHitScene = null;
        //OnSelfTrigger = null;
    }
}

class SkillRepeatMgr : IBattleContextHost
{
    public BattleContext Context
    {
        get { return m_ownActor.Context; }
    }

    // public List<SkillRepeatPlayData> m_listRepeat = new List<SkillRepeatPlayData>();
    public ActorEntity m_ownActor;

    public SkillRepeatVisualInterface VisualInter = new SkillRepeatVisualInterface();
    private bool m_hasCreateVisual = false;

    public bool m_destroy = false;

    private static List<SkillRepeatMgr> s_listWaitFree = new List<SkillRepeatMgr>();


    /// <summary>
    /// 被子弹引用的个数
    /// </summary>
    public int m_bulletRefCount = 0;

    public uint m_mainSkillId;


    public void AddBulletCnt()
    {
        m_bulletRefCount++;

#if DOD_DEBUG
            if (m_ownActor != null)
            {
                m_ownActor.SkillCaster.SetDebugInfo("Repeat Trigger", m_bulletRefCount.ToString());
            }
#endif
    }

    public void DecBulletCnt()
    {
        m_bulletRefCount--;
        Debug.Assert(m_bulletRefCount >= 0);


#if DOD_DEBUG
            if (m_ownActor != null)
            {
                m_ownActor.SkillCaster.SetDebugInfo("Repeat Trigger", m_bulletRefCount.ToString());
            }
#endif
    }

    public SkillRepeatMgr(ActorEntity ownActor)
    {
        m_ownActor = ownActor;
        m_mainSkillId = 0;
        m_hasCreateVisual = false;
    }

    public void TriggerBeHitEvent(ActorEntity caster, DamageInfo damageInfo)
    {
        if (m_destroy)
        {
            Debug.LogError("repeat mgr is destroy");
            return;
        }

        if (damageInfo.damage < 0 || damageInfo.isDead)
        {
            return;
        }

        if (caster == null || caster.ActorID == m_ownActor.ActorID)
        {
            return;
        }

        //var listGlobalHandle = m_listGlobalBeHitHandle;
        //var globalCount = m_listGlobalBeHitHandle.Count;
        //for (int i = 0; i < globalCount; i++)
        //{
        //    var handle = listGlobalHandle[i];
        //    handle.OnHited(caster, m_ownActor);
        //}
    }

    public void TriggerKillTargetEvent(uint skillId, int shootId, ActorEntity target)
    {
        if (m_destroy)
        {
            Debug.LogError("repeat mgr is destroy");
            return;
        }

        //var playData = FindRepeatPlayData(skillId);
        //if (playData == null)
        //{
        //    return;
        //}

        //playData.OnKillTarget(m_ownActor, shootId, target);

        //if (skillId == m_mainSkillId)
        //{
        //    var listGlobalHandle = m_listGlobaKillTargetHandle;
        //    var globalCount = listGlobalHandle.Count;
        //    for (int i = 0; i < globalCount; i++)
        //    {
        //        var handle = listGlobalHandle[i];
        //        if (handle.m_skillId != skillId)
        //        {
        //            handle.OnKillTarget(m_ownActor, target);
        //        }
        //    }
        //}
    }

}
