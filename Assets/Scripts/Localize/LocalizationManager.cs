using System.Collections.Generic;
using UnityEngine;

public class LocalizationManager :Singleton<LocalizationManager>
{
    //存储语言字典
    private Dictionary<string, string> __languageDict;

    //ctor
    public LocalizationManager()
    {
        __languageDict = new Dictionary<string, string>();
        //根据系统语言读取文本
        if (Application.isEditor)
        {
            //设置默认语言为中文
            //GlobalConfig.LANGUAGE = "1";
        }
        LoadLanguageDictByTxt();
    }

    /// <summary>
    /// 通过txt文件加载游戏文字语言，路径 地址：Resources/Doc/doc.txt
    /// </summary>
    private void LoadLanguageDictByTxt()
    {
        if (__languageDict.Count > 0)
        {
            __languageDict.Clear();
        }
        //根据语言，将text格式的行录入语言字典中
        string p = "Doc/doc";
        TextAsset asseet = Resources.Load<TextAsset>(p);
        string l = asseet.ToString();

        //解析字符串
        string[] firstSplit = l.Split('\n');
        for (int i = 0; i < firstSplit.Length; i++)
        {
            if (!string.IsNullOrEmpty(firstSplit[i]))
            {
                string[] secondSplit = firstSplit[i].Split(';');
                if ("Text" == secondSplit[1])
                {
                    //string value = secondSplit[int.Parse(GlobalConfig.LANGUAGE) + 2];
                    //if (string.IsNullOrEmpty(value))
                    //{
                    //    //如果当前语言没有设置，默认读取中文
                    //    value = secondSplit[4];
                    //}
                    //__languageDict.Add(secondSplit[0], value);
                }
                else
                    continue;
            }
        }
    }

    /// <summary>
    /// 根据key值，读取文字
    /// </summary>
    /// <returns>The dic string.</returns>
    /// <param name="varKey">Variable key.</param>
    public string GetDicStr(string varKey)
    {
        if (string.IsNullOrEmpty(varKey))
            return null;
        string text;
        if (__languageDict.TryGetValue(varKey, out text))
        {
            return text;
        }
        return null;
    }
}