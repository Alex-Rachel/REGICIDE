using System;
using System.Collections.Generic;
using UnityEngine;


/// <summary>
/// Actor属性数据管理
/// </summary>
public class ActorData : ActorEntityCmpt
{
    /// <summary>
    /// 上层各个模块注册的数值模块
    /// </summary>
    private List<ActorAttrImpactMgr> m_listImpact = new List<ActorAttrImpactMgr>();
    private List<ActorAttrImpactMgr> m_listRuntimeImpact = new List<ActorAttrImpactMgr>();

    /// <summary>
    /// 属性数据
    /// </summary>
    private ActorAttrData m_attrData = new ActorAttrData();

    /// <summary>
    /// 初始数据
    /// </summary>
    internal ActorAttrData m_baseData = new ActorAttrData();
    private ActorAttrData m_runtimeBase = new ActorAttrData();
    private ActorAttrData m_hpPercentBase = new ActorAttrData();

    private bool m_baseChanged = true;
    private bool m_runtimeChanged = true;
    private bool m_hpPercentChanged = true;


    #region 管理数值

    internal void RegAttrImpact(ActorAttrImpactMgr impactMgr)
    {
        Debug.Assert(!m_listImpact.Contains(impactMgr));
        m_listImpact.Add(impactMgr);
        impactMgr.m_changed = MarkBaseImpactDirty;
        m_baseChanged = true;
    }

    /// <summary>
    /// 注册动态频繁变化的属性管理，比如buff之类，避免每次全部都要重新算一次
    /// </summary>
    internal void RegRuntimgAttrImpact(ActorAttrImpactMgr impactMgr)
    {
        m_runtimeChanged = true;
        m_listRuntimeImpact.Add(impactMgr);
        impactMgr.m_changed = MarkRuntimeImpactDirty;
    }


    public ActorAttrData AttrData
    {
        get { return m_attrData; }
    }

    #endregion

    #region 计算和更新数值

    private float m_hpPercent;
    private int m_hp;
    public int HP
    {
        set
        {
            if (m_hp != value)
            {
                bool isDecrease = m_hp > value;
                m_hp = value;
                if (m_attrData.MaxHP == 0)
                {
                    m_hpPercent = 1f;
                }
                else
                {
                    m_hpPercent = ((float)m_hp) / (float)m_attrData.MaxHP;
                }

                m_hpPercent = Mathf.Clamp(m_hpPercent, 0f, 0f);

                //if (NeedHpPercentChgRefresh())
                //{
                //    m_hpPercentChanged = true;
                //    RefreshAttr();
                //}

                ActorEntityEventHelper.SendHpChg(OwnActor, m_hpPercent, isDecrease);

                var param = EntityVisualEventParam.CreateEventParam<EntityVisualRefreshAttrParam>(EntityVisualEvent.ACTOR_REFRESH_ATTR);
                param.hp = m_hp;
                OwnActor.SendVisualEvent(EntityVisualEvent.ACTOR_REFRESH_ATTR);
                if (isDecrease)
                {
                    // OwnActor.SendVisualEvent(EntityVisualEvent.PLAYER_ENTITY_DECREASE_HP);
                }
            }
        }

        get { return m_hp; }
    }


    public float HpPercent
    {
        get { return m_hpPercent; }
    }

    public void RefreshAttr()
    {
        var attrData = m_attrData;

        var oldMaxHP = attrData.MaxHP;
        if (m_baseChanged)
        {
            attrData.Set(m_baseData);
            var list = m_listImpact;
            var count = list.Count;

            for (int i = 0; i < count; i++)
            {
                var impactMgr = list[i];
                impactMgr.RefreshFinalAttr(attrData);
            }

            m_runtimeBase.Set(attrData);
            RefreshRuntimeAttr(attrData);
            m_hpPercentBase.Set(attrData);
            RefreshHpPercentAttr(attrData);
        }
        else if (m_runtimeChanged)
        {
            attrData.Set(m_runtimeBase);
            RefreshRuntimeAttr(attrData);
            m_hpPercentBase.Set(attrData);
            RefreshHpPercentAttr(attrData);
        }
        else if (m_hpPercentChanged)
        {
            attrData.Set(m_hpPercentBase);
            RefreshHpPercentAttr(attrData);
        }

        m_baseChanged = false;
        m_runtimeChanged = false;
        m_hpPercentChanged = false;

        //对最大血量的处理
        if (attrData.MaxHP != oldMaxHP)
        {
            var chgVal = AttrData.MaxHP - oldMaxHP;
            if (chgVal < 0)
            {
                if (HP > AttrData.MaxHP)
                {
                    int damage = HP - AttrData.MaxHP;
                    // ActorEntityHelper.DirectAddHp(OwnActor, -damage);
                }
            }
            else
            {
                // ActorEntityHelper.DirectAddHp(OwnActor, chgVal);
            }
        }
    }
    #endregion
    public void MarkBaseImpactDirty()
    {
        m_baseChanged = true;
        RefreshAttr();
    }

    private void MarkRuntimeImpactDirty()
    {
        m_runtimeChanged = true;
        RefreshAttr();
    }

    private void RefreshRuntimeAttr(ActorAttrData attr)
    {
        var listImpact = m_listRuntimeImpact;
        var count = listImpact.Count;

        for (int i = 0; i < count; i++)
        {
            var impact = listImpact[i];
            impact.RefreshFinalAttr(attr);
        }
    }

    private void RefreshHpPercentAttr(ActorAttrData attr)
    {
    }

    //private bool NeedHpPercentChgRefresh()
    //{
    //    return m_attrData.HPPercentAddAtkDamage != FP.Zero || m_attrData.HPPercentAddAtkSpeed != FP.Zero
    //         || m_attrData.HPPercentAddRecoveryHp != FP.Zero || m_attrData.HPPercentAddDogeRatio != FP.Zero;
    //}

    protected override void OnDestroy()
    {
        ClearImpactList(m_listImpact);
        ClearImpactList(m_listRuntimeImpact);
    }

    private void ClearImpactList(List<ActorAttrImpactMgr> listImpact)
    {
        for (int i = 0; i < listImpact.Count; i++)
        {
            var impcat = listImpact[i];
            impcat.m_changed = null;
        }

        listImpact.Clear();
    }

}

