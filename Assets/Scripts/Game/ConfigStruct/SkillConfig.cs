//
// Auto Generated Code By excel2json
// https://neil3d.gitee.io/coding/excel2json.html
// 1. 每个 Sheet 形成一个 Struct 定义, Sheet 的名称作为 Struct 的名称
// 2. 表格约定：第一行是变量名称，第二行是变量类型

// Generate From SkillConfig.xlsx

using System.Collections.Generic;

public class SkillBaseConfig
{
	public int ID; // 技能ID
	public string Name; // 技能名称
	public Dictionary<int,double> DamageDic; // 伤害字典（伤害类型，伤害参数）
	public int[] BuffIDArray; // BuffID数组
	public string[] DescArray; // 描述数组
}


// End of Auto Generated Code
