using System;


/// <summary>
/// 定义统一的数据结构来影响数值系统
/// </summary>
class ActorAttrImpactData
{
    public void UpdateData(ActorAttrDataType dataType, ActorAttrAddType addType, float value)
    {
        m_addType = addType;
        m_dataType = dataType;
        m_value = value;
    }

    public void Add(ActorAttrImpactData b)
    {
        if (m_dataType != b.m_dataType)
        {
            return;
        }

        m_value += b.m_value;
    }

    /// <summary>
    /// 产生该数值的对象，用于调试跟踪
    /// </summary>
    public Type m_producer;

    /// <summary>
    /// 计算方式
    /// </summary>
    public ActorAttrAddType m_addType;

    /// <summary>
    /// 核心数值类型
    /// </summary>
    public ActorAttrDataType m_dataType;

    /// <summary>
    /// 数值
    /// </summary>
    public float m_value = 0f;

    /// <summary>
    /// 影响优先级,用于计算最终的数值用
    /// priority越高，越放在后面计算
    /// </summary>
    public int m_priority = 0;


    /// <summary>
    /// 计算影响后的数值
    /// </summary>
    /// <returns></returns>
    public float CalAddVal(float baseVal)
    {
        if (m_addType == ActorAttrAddType.ABSOLUTE_VAL)
        {
            return baseVal + m_value;
        }
        else if (m_addType == ActorAttrAddType.SUM_PERCENT_VAL || m_addType == ActorAttrAddType.MUL_PERCENT_VAL)
        {
            return baseVal + baseVal * m_value;
        }
        return baseVal;
    }

    /// <summary>
    /// 判断是否可以合并数值
    /// </summary>
    /// <param name="other"></param>
    /// <returns></returns>
    public bool CanMerge(ActorAttrImpactData other)
    {
        if (m_addType == other.m_addType &&
            m_dataType == other.m_dataType)
        {
            return true;
        }

        return false;
    }

    /// <summary>
    /// 合并数值
    /// </summary>
    /// <param name="other"></param>
    public void Merge(ActorAttrImpactData other)
    {
        m_value += other.m_value;
    }

    public ActorAttrImpactData Clone()
    {
        var data = new ActorAttrImpactData();
        data.UpdateData(m_dataType, m_addType, m_value);
        data.m_priority = m_priority;
        return data;
    }

    public void Init()
    {
        m_value = 0f;
        m_priority = 0;
    }

    public void InitFromPool()
    {
    }

    public void Destroy()
    {
    }
}

