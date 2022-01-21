using System;
using System.Collections.Generic;
using UnityEngine;


/// <summary>
/// 每个Actor身上挂着个这个对象，用于计算玩家最终的属性数值
/// 上层的其他系统，比如技能，buff等，通过将影响的数值增加到
/// EffectMgr中，来影响到最终的数值结果
/// </summary>
class ActorAttrImpactMgr
{
    //为了方便定位，强制增加名称
    public ActorAttrImpactMgr(string name)
    {
        m_name = name;
    }

    //变换通知
    public Action m_changed;

    List<ActorAttrImpactData> m_listEffect = new List<ActorAttrImpactData>();

    //计算属性用
    private List<ActorAttrImpactData> m_listAbEffect = new List<ActorAttrImpactData>();
    private List<ActorAttrImpactData> m_listRelEffect = new List<ActorAttrImpactData>();
    private List<ActorAttrImpactData> m_listMulEffect = new List<ActorAttrImpactData>();

    public List<ActorAttrImpactData> listEffect
    {
        get { return m_listEffect; }
    }

    public string Name
    {
        get { return m_name; }
    }

    private string m_name;

    public void RmvAttrImpact(ActorAttrImpactData impactData)
    {
        int index = 0;

        for (int i = 0; i < m_listEffect.Count; i++)
        {
            ActorAttrImpactData item = m_listEffect[i];
            if (item == impactData)
            {
                break;
            }

            index++;
        }

        if (index < m_listEffect.Count)
        {
            m_listEffect.RemoveAt(index);
        }
    }

    /// <summary>
    /// 合并多个不同的AttrImpactMgr
    /// </summary>
    /// <param name="other"></param>
    public void Merge(ActorAttrImpactMgr other)
    {
        for (int i = 0; i < other.m_listEffect.Count; i++)
        {
            ActorAttrImpactData item = other.m_listEffect[i];
            MergeAttrImpact(item);
        }
    }

    /// <summary>
    /// 增加新的影响数值
    /// </summary>
    /// <param name="impactData"></param>
    /// <returns></returns>
    public void MergeAttrImpact(ActorAttrImpactData impactData)
    {
        //根据优先级找到合适的节点插入
        //按照prioroy的优先级顺序排序
        int index = 0;

        for (int i = 0; i < m_listEffect.Count; i++)
        {
            ActorAttrImpactData item = m_listEffect[i];
            if (item.m_priority > impactData.m_priority)
            {
                break;
            }

            if (item.CanMerge(impactData))
            {
                item.Merge(impactData);
                return;
            }

            index++;
        }

        var newImpactData = impactData.Clone();

        if (index >= m_listEffect.Count)
        {
            m_listEffect.Add(newImpactData);
        }
        else
        {
            m_listEffect.Insert(index, newImpactData);
        }
    }

    public void AddAttrImpact(ActorAttrDataType dataType, ActorAttrAddType addType, float val)
    {
        if (dataType == ActorAttrDataType.None)
        {
            return;
        }

        ActorAttrImpactData attrData = new ActorAttrImpactData();
        attrData.UpdateData(dataType, addType, val);
        MergeAttrImpact(attrData);
    }

    public void AddAttrImpact(ResAttrImpactData resData)
    {
        AddAttrImpact(resData, 0f);
    }

    public void AddAttrImpact(ResAttrImpactData resData, float additveVal)
    {
        if (resData.DataType == (short)ActorAttrDataType.None ||
            resData.Value == 0f)
        {
            return;
        }

        AddAttrImpact((ActorAttrDataType)resData.DataType, (ActorAttrAddType)resData.AddType, resData.Value + additveVal);
    }

    public void ClearImpact()
    {
        m_listEffect.Clear();
        m_listAbEffect.Clear();
        m_listMulEffect.Clear();
        m_listRelEffect.Clear();
    }

    public void SetDirty()
    {
        if (m_changed != null)
        {
            m_changed();
        }
    }

    /// <summary>
    /// 不同等级的impactMgr 合并成一个
    /// </summary>
    /// <param name="attrImpactList"></param>
    /// <returns></returns>
    public static ActorAttrImpactMgr MergeAttrImpactList(List<ActorAttrImpactMgr> attrImpactList)
    {
        ActorAttrImpactMgr ret = new ActorAttrImpactMgr("inner_merge_list");

        for (int i = 0; i < attrImpactList.Count; i++)
        {
            ret.Merge(attrImpactList[i]);
        }

        return ret;
    }

    public void PrintDebug(ActorAttrDataType dataType)
    {
        for (int i = 0; i < m_listEffect.Count; i++)
        {
            if (dataType == ActorAttrDataType.None ||
                m_listEffect[i].m_dataType == dataType)
            {
                Debug.LogFormat("[{0}] DataType[{1}] AddType[{2}] Val[{3}] ", m_name,
                    dataType, m_listEffect[i].m_addType, m_listEffect[i].m_value);
            }
        }
    }

    public static int CompareTo(ActorAttrImpactData data1, ActorAttrImpactData data2)
    {
        if (data1.m_addType != data2.m_addType)
        {
            if (data1.m_addType == ActorAttrAddType.ABSOLUTE_VAL)
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

        if ((int)data1.m_dataType < (int)data2.m_dataType)
        {
            return -1;
        }

        if ((int)data1.m_dataType > (int)data2.m_dataType)
        {
            return 1;
        }

        return 0;
    }

    /// <summary>
    /// 刷新属性
    /// </summary>
    /// <param name="attrData"></param>
    public void RefreshFinalAttr(ActorAttrData attrData)
    {
        m_listAbEffect.Clear();
        m_listMulEffect.Clear();
        m_listRelEffect.Clear();

        for (int i = 0; i < m_listEffect.Count; i++)
        {
            if (ActorAttrAddType.ABSOLUTE_VAL == m_listEffect[i].m_addType)
            {
                m_listAbEffect.Add(m_listEffect[i]);
            }
            else if (ActorAttrAddType.SUM_PERCENT_VAL == m_listEffect[i].m_addType)
            {
                m_listRelEffect.Add(m_listEffect[i]);
            }
            else if (ActorAttrAddType.MUL_PERCENT_VAL == m_listEffect[i].m_addType)
            {
                m_listMulEffect.Add(m_listEffect[i]);
            }
        }

        //先加法
        CalAttrList(attrData, m_listAbEffect);
        CalAttrList(attrData, m_listRelEffect);
        CalAttrList(attrData, m_listMulEffect);
    }

    private void CalAttrList(ActorAttrData attrData, List<ActorAttrImpactData> listAttr)
    {
        var attrCount = listAttr.Count;

        for (int i = 0; i < attrCount; i++)
        {
            var impactData = listAttr[i];
            attrData.CalImpact(impactData);
        }
    }
}
