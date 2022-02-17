using System.Collections.Generic;
using UnityEngine;

public static class BuffHelper
{
    //处理被攻击时的buff
    public static void HandleBeAttackBuff(this BossActor bossActor,ref int value)
    {
        if (bossActor == null)
        {
            return;
        }

        var buffMgr = bossActor.ActorBuffMgr;

        if (buffMgr == null)
        {
            return;
        }

        if (buffMgr.BuffCount <= 0)
        {
            return;
        }

        foreach (var buff in buffMgr.buffList)
        {
            buffMgr.HandleBeAttackBuff(bossActor, buff,ref value);
        }
    }

    //处理被攻击后的buff
    public static bool HandleAfterAttackBuff(this BossActor bossActor)
    {
        if (bossActor == null)
        {
            return false;
        }

        var buffMgr = bossActor.ActorBuffMgr;

        if (buffMgr == null)
        {
            return false;
        }

        if (buffMgr.BuffCount <= 0)
        {
            return false;
        }

        bool value = false;

        foreach (var buff in buffMgr.buffList)
        {
            if (buffMgr.HandleAfterAttackBuff(bossActor, buff))
            {
                value = true;
            }
        }

        return value;
    }

    //处理阶段时的buff
    public static void HandleBuff(this BossActor bossActor)
    {
        if (bossActor == null)
        {
            return;
        }

        var buffMgr = bossActor.ActorBuffMgr;

        if (buffMgr == null)
        {
            return;
        }

        if (buffMgr.BuffCount <= 0)
        {
            return;
        }

        foreach (var buff in buffMgr.buffList)
        {
            buffMgr.HandleBuff(bossActor, buff);
        }
    }

    /// <summary>
    /// 初始化BUFF
    /// </summary>
    /// <param name="bossActor"></param>
    public static void InitBuff(this BossActor bossActor)
    {
        if (bossActor == null)
        {
            return;
        }

        var buffMgr = bossActor.ActorBuffMgr;

        if (buffMgr == null)
        {
            return;
        }

        if (buffMgr.BuffCount <= 0)
        {
            return;
        }

        foreach (var buff in buffMgr.buffList)
        {
            buffMgr.InitBuff(bossActor, buff);
        }
    }
}

public class BuffMgr
{
    Dictionary<int,BuffConfig> m_buffDic = new Dictionary<int, BuffConfig>();
    List<BuffConfig> m_buffList = new List<BuffConfig>();

    public List<BuffConfig> buffList
    {
        get
        {
            return m_buffList;
        }
    }

    public Dictionary<int, BuffConfig> buffDic
    {
        get
        {
            return m_buffDic;
        }
    }

    public int BuffCount
    {
        get
        {
            return m_buffDic.Count;
        }
    }

    public void ClearBuff()
    {
        m_buffDic.Clear();
        m_buffList.Clear();
    }

    public void RemoveBuff(int buffID)
    {
        if (m_buffDic.ContainsKey(buffID))
        {
            for (int i = 0; i < m_buffList.Count; i++)
            {
                if (m_buffList[i].BuffID == buffID)
                {
                    m_buffList.Remove(m_buffList[i]);
                    break;
                }
            }
            m_buffDic.Remove(buffID);
        }
    }

    /// <summary>
    /// 初始化BUFF 属性增幅
    /// </summary>
    /// <param name="bossActor"></param>
    /// <param name="buff"></param>
    public void InitBuff(BossActor bossActor, BuffConfig buff)
    {
        var handleState = (GameMgr.GameState)buff.HandleState;

        if (handleState != GameMgr.GameState.NONE)
        {
            return;
        }

        switch ((BuffType)buff.BuffType)
        {
            case BuffType.BUFF_ADD_DEMAGE:
                bossActor.Atk += (int)(bossActor.Atk * buff.BuffValue);
                break;
            case BuffType.BUFF_ADD_HP:
                bossActor.Hp += (int)(bossActor.Hp * buff.BuffValue);
                bossActor.MaxHp = bossActor.Hp;
                break;
            case BuffType.BUFF_ADD_DEMAGE_VALUE:
                bossActor.Atk += (int)(buff.BuffValue);
                break;
            case BuffType.BUFF_JUEMU:
                var value = GameMgr.Instance.UseCardDatas.Count / (buff.BuffValue);
                bossActor.Atk += (int)value;
                break;
        }
#if UNITY_EDITOR
        Debug.LogFormat("bossActor Init Buff:{0},bossAtk:{1},bossHp,{2}",buff.BuffName,bossActor.Atk,bossActor.Hp);
#endif
        EventCenter.Instance.EventTrigger("BossDataRefresh", bossActor);
    }

    public void HandleBuff(BossActor bossActor,BuffConfig buff)
    {
        if (bossActor == null||buff == null)
        {
            return;
        }

        var currentState = GameMgr.Instance.gameState;

        var handleState = (GameMgr.GameState) buff.HandleState;

        if (handleState == GameMgr.GameState.NONE)
        {
            return;
        }

        if (handleState != currentState)
        {
            return;
        }

        int value;
        switch ((BuffType)buff.BuffType)
        {
            case BuffType.BUFF_QUICK_ATTACK:
                if (!bossActor.HadChongFeng)
                {
                    UISys.ShowTipMsg("君主使用了冲锋！！！");
                    MonoManager.Instance.StartCoroutine(Utils.Wait(1.0f,(() =>
                    {
                        bossActor.HadChongFeng = true;
                        value = (int)(bossActor.Atk * buff.BuffValue);
                        EventCenter.Instance.EventTrigger("BossAttack", value);
                    })));
                }
                break;
            case BuffType.BUFF_ADD_HEALTH:
                if (bossActor.Hp<=0 || bossActor.Hp >= bossActor.MaxHp)
                {
                    return;
                }
                value = (int)(bossActor.MaxHp * buff.BuffValue);
                bossActor.Hp += value;
                UISys.ShowTipMsg(string.Format("君主使用了回复,回复了<color=#13FF00>{0}</color>HP", value));
                break;
            case BuffType.BUFF_HUIFU:
                if (bossActor.Hp <= 0 || bossActor.Hp >= bossActor.MaxHp)
                {
                    return;
                }
                value = (int)(buff.BuffValue);
                bossActor.Hp += value;
                UISys.ShowTipMsg(string.Format("君主使用了恢复,恢复了<color=#13FF00>{0}</color>HP", value));
                break;
            case BuffType.BUFF_BUQU:

                break;
            case BuffType.BUFF_ADD_DEMAGE:
                value = (int)(bossActor.Atk * buff.BuffValue);
                UISys.ShowTipMsg(string.Format("君主发动了<color=#FF00F0>炼狱</color>增加<color=#FF0000>{0}</color>ATK", value));
                bossActor.Atk += value;
                break;
            case BuffType.BUFF_ADD_DEMAGE_VALUE:
                value = (int)(buff.BuffValue);
                UISys.ShowTipMsg(string.Format("君主发动了<color=#FF00F0>炼狱</color>增加<color=#FF0000>{0}</color>ATK", value));
                bossActor.Atk += value;
                break;

        }
        EventCenter.Instance.EventTrigger("BossDataRefresh",bossActor);
    }

    public void HandleBeAttackBuff(BossActor bossActor, BuffConfig buff,ref int attackValue)
    {
        if (bossActor == null || buff == null)
        {
            return;
        }

        var currentState = GameMgr.Instance.gameState;

        var handleState = (GameMgr.GameState)buff.HandleState;

        if (handleState == GameMgr.GameState.NONE)
        {
            return;
        }

        if (handleState != currentState)
        {
            return;
        }

        int value;
        switch ((BuffType)buff.BuffType)
        {
            case BuffType.BUFF_WEIYA:
                if (attackValue > buff.BuffValue)
                {
                    UISys.ShowTipMsg("Boss发动了<color=#00F9FF>霜寒</color>，降低所受伤害");
                    attackValue = (int)buff.BuffValue;
                }
                break;

        }
        EventCenter.Instance.EventTrigger("BossDataRefresh", bossActor);
    }

    public bool HandleAfterAttackBuff(BossActor bossActor, BuffConfig buff)
    {
        if (bossActor == null || buff == null)
        {
            return false;
        }

        var currentState = GameMgr.Instance.gameState;

        var handleState = (GameMgr.GameState)buff.HandleState;

        if (handleState == GameMgr.GameState.NONE)
        {
            return false;
        }

        if (handleState != currentState)
        {
            return false;
        }

        int value;
        bool handleBuff = false;
        switch ((BuffType)buff.BuffType)
        {
            case BuffType.BUFF_BUQU:
                handleBuff = true;
                bossActor.HadBuQuIng = true;
                EventCenter.Instance.EventTrigger("BossAttack", bossActor.Atk);
                MonoManager.Instance.StartCoroutine(Utils.Wait(0.5f, (() =>
                {
                    UISys.ShowTipMsg(string.Format("领主发动{0}！！！",buff.BuffName.ToColor("FFD200")));
                })));
                break;
        }
        EventCenter.Instance.EventTrigger("BossDataRefresh", bossActor);
        return handleBuff;
    }
    

    #region 设置BUFF

    public void SetBuffByFeatures(List<FeatureConfig> featureConfigs, BossActor bossActor = null)
    {
        m_buffDic.Clear();
        m_buffList.Clear();
        if (featureConfigs == null)
        {
            return;
        }

        for (int i = 0; i < featureConfigs.Count; i++)
        {
            var feature = featureConfigs[i];
            SetBuffByFeature(feature,bossActor);
        }
        bossActor.InitBuff();
    }

    public void SetBuffByFeature(FeatureConfig featureConfig, BossActor bossActor = null)
    {
        if (featureConfig == null)
        {
            return;
        }

        var buffs = featureConfig.BuffIDArray;

        for (int i = 0; i < buffs.Length; i++)
        {
            var buffID = buffs[i];
            if (buffID == 0)
            {
                continue;
            }

            var buff = BuffConfigMgr.Instance.GetCfg(buffID);

            if (buff == null)
            {
#if UNITY_EDITOR
                Debug.LogError("buff error: had no buff buffID =>" + buffID);
#endif
                continue;
            }

            bool canAddBuff = buff.CanAddBuff == 1;

            if (!m_buffDic.ContainsKey(buffID))
            {
#if UNITY_EDITOR
                Debug.LogError("buff add success:buffID =>" + buffID + buff.BuffName);
#endif
                m_buffDic.Add(buffID, buff);
                m_buffList.Add(buff);
            }
            //else if (canAddBuff)
            //{
            //    BuffConfig buffConfig;
            //    if (m_buffDic.TryGetValue(buffID,out buffConfig))
            //    {
            //        buffConfig.BuffValue += buffConfig.BuffValue;
            //    }
            //}
        }
    }


#endregion
}