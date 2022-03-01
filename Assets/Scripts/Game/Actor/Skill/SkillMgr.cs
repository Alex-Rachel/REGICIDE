using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BestHTTP.Extensions;
using UnityEngine;


/// <summary>
/// 技能管理 初始化 装卸 释放
/// </summary>
public class SkillMgr : ActorEntityCmpt
{


    private BuffManager m_buffMgr;

    private SkillRepeatMgr m_repeatSkillMgr;

    internal SkillRepeatMgr RepeatTriggerMgr
    {
        get { return m_repeatSkillMgr; }
    }


    private Dictionary<uint, SkillData> m_skillDataDic = new Dictionary<uint, SkillData>();

    // 根据配置 初始化角色技能
    public void Init()
    {

    }

    public void PlaySkill(uint skillId, ActorEntity targetActor = null)
    {
        Debug.AssertFormat(skillId > 0, "ActorName: {0}", OwnActor.name);
        Debug.LogFormat("Start Play SKill[{0}]", skillId);

        var skillBaseConfig = SkillConfigMgr.Instance.GetSkillBaseCfg(skillId);
        if (skillBaseConfig == null)
        {
            Debug.LogErrorFormat("GetSkillBaseConfig faild, invalid skillID: {0}", skillId);
            return;
        }

        SkillData playData = new SkillData(OwnActor);
        playData.Init(skillId);

        DamageInfo dmgInfo = new DamageInfo();
        var damageDic = skillBaseConfig.DamageDic;
        foreach (var item in damageDic)
        {
            switch (Convert.ToInt32(item.Key))
            {
                case 1:
                    // 直接伤害类型 伤害值 = 攻击力*伤害参数
                    var atk = OwnActor.ActorData.AttrData.Damage;
                    dmgInfo.damage += Mathf.FloorToInt((float)(atk * item.Value));
                    break;
            }
        }


        SkillImpactData impactData = new SkillImpactData();
        SkillImpactSource m_source = new SkillImpactSource();

        ActorEntityEventHelper.SendSkillImpacted(targetActor, OwnActor, dmgInfo, impactData, m_source);

        DoPlaySkill(playData, skillBaseConfig);

    }

    private void CalSkillDamage()
    {

    }

    private void DoPlaySkill(SkillData playData, SkillBaseConfig skillBaseConfig)
    {

    }
}

