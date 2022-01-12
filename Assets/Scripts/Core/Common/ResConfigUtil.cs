using System;
using System.Collections.Generic;
using BestHTTP.JSON;
using LitJson;
using UnityEngine;


class ResConfigUtil
{
    #region 读取接口

    public static Dictionary<string, T> ReadConfigRes<T>(string fileName)
    {
        string resPath = "Config/" + fileName;
        TextAsset jsonStr = Resources.Load<TextAsset>(resPath);
        if (jsonStr == null)
        {
            Debug.LogWarningFormat("读取Json配置数据失败：{0}", fileName);
            return null;
        }

        Dictionary<string, T> dic = new Dictionary<string, T>();
        var jsonData = JsonHelper.Instance.Deserialize<Dictionary<string, T>>(jsonStr.text);
        // var jsonData = JsonMapper.ToObject<Dictionary<string, T>>(jsonStr.text);
        dic = jsonData;

        //var list = (List<T>)Json.Decode(jsonStr.text);
        return dic;
    }

    public static Dictionary<int, T> ReadConfigResIntKey<T>(string fileName)
    {
        string resPath = "Config/" + fileName;
        TextAsset jsonStr = Resources.Load<TextAsset>(resPath);
        if (jsonStr == null)
        {
            Debug.LogWarningFormat("读取Json配置数据失败：{0}", fileName);
            return null;
        }

        Dictionary<int, T> dic = new Dictionary<int, T>();
        var jsonData = JsonHelper.Instance.Deserialize<Dictionary<int, T>>(jsonStr.text);
        // var jsonData = JsonMapper.ToObject<Dictionary<string, T>>(jsonStr.text);
        dic = jsonData;

        //var list = (List<T>)Json.Decode(jsonStr.text);
        return dic;
    }

    #endregion

    public static UInt64 Make64Key(uint key1, uint key2)
    {
        return (((UInt64)key1) << 32) | key2;
    }

    public static string MakeStringKey(uint key1, uint key2, uint key3)
    {
        return key1 + "_" + key2 + "_" + key3;
    }

    public static string MakeStringKey(string key1, uint key2)
    {
        return key1 + "_" + key2;
    }

    public static string MakeStringKey(string key1, string key2)
    {
        return key1 + "_" + key2;
    }
}

