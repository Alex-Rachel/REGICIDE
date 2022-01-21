using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    }
}

