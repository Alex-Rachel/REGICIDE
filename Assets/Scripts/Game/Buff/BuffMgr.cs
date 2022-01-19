using System.Collections.Generic;
using UnityEngine;

public static class BuffHelper
{
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
                value = (int)(bossActor.MaxHp * buff.BuffValue);
                bossActor.Hp += value;
                UISys.ShowTipMsg(string.Format("君主使用了回复,回复了<color=#13FF00>{0}</color>HP", value));
                break;
            case BuffType.BUFF_HUIFU:
                value = (int)(buff.BuffValue);
                bossActor.Hp += value;
                UISys.ShowTipMsg(string.Format("君主使用了恢复,恢复了<color=#13FF00>{0}</color>HP", value));
                break;
            case BuffType.BUFF_WEIYA:

                break;
            
        }
        EventCenter.Instance.EventTrigger("BossDataRefresh",bossActor);
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
            if (!m_buffDic.ContainsKey(buffs[i]))
            {
                var buff = BuffConfigMgr.Instance.GetCfg(buffID);
                if (buff == null)
                {
                    Debug.LogError("buff error: had no buff buffID =>" + buffID);
                    continue;
                }
#if UNITY_EDITOR
                Debug.LogError("buff add success:buffID =>" + buffID + buff.BuffName);
#endif
                m_buffDic.Add(buffID, buff);
                m_buffList.Add(buff);
            }
        }
    }


#endregion
}