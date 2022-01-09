using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/// <summary>
/// 技能管理 初始化 装卸 释放
/// </summary>
public class SkillMgr : ActorEntityCmpt
{


    private BuffManager m_buffMgr;


    private Dictionary<uint, SkillData> m_skillDataDic = new Dictionary<uint, SkillData>();

    // 根据配置 初始化角色技能
    public void Init()
    {

    }

    public void PlaySkill(uint skillId, ActorEntity targetActor = null)
    {
        SkillData playData = new SkillData(OwnActor);
    }
}

