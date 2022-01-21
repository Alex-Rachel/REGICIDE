using System.Collections.Generic;

/// <summary>    /// 定义对象的数值属性字段    /// </summary>
public class ActorAttrData
{
    public int MaxHP;
    public float Damage;
    public float CritAtkRatio;

    private Dictionary<int, ActorAttrImpactMgr> m_dictZhaoShiAttr = new Dictionary<int, ActorAttrImpactMgr>();

    internal void CalImpact(ActorAttrImpactData impact)
    {
        var dataType = impact.m_dataType;
        switch (dataType)
        {
            case ActorAttrDataType.MaxHp:
                MaxHP = (int)impact.CalAddVal(MaxHP);
                break;
            case ActorAttrDataType.Damage:    /*攻击力*/
                Damage = impact.CalAddVal(Damage);
                break;
            case ActorAttrDataType.CritAtkRatio:    /*暴击几率*/
                CritAtkRatio = impact.CalAddVal(CritAtkRatio);
                break;
        }
    }

    public void Set(ActorAttrData src)
    {
        MaxHP = src.MaxHP;
        Damage = src.Damage;
        CritAtkRatio = src.CritAtkRatio;
    }

}


/*属性类型*/
enum ActorAttrDataType
{
    None = 0,    /*无效数据*/
    MaxHp = 1,    /*最大血量*/
    Damage = 2,    /*攻击力*/
    CritAtkRatio = 3,    /*暴击几率*/
};

/*增加类型*/
enum ActorAttrAddType
{
    INVAL_VAL = 0,    /*无效数值*/
    ABSOLUTE_VAL = 1,    /*加法计算*/
    SUM_PERCENT_VAL = 2,    /*多个项结果累加，然后对加法做乘法*/
    MUL_PERCENT_VAL = 3    /*每一项都是对最终结果做乘法*/
};

/*对玩家属性的影响*/
public class ResAttrImpactData
{
    public int DataType;
    public byte AddType;
    public float Value; //基础数值
}
