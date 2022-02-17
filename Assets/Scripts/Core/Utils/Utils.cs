using System;
using System.Collections;
using RegicideProtocol;
using System.Collections.Generic;
using Google.Protobuf.Collections;
using UnityEngine;

public static class Utils
{
    public static string ToColor(this string str, string colorStr)
    {
        if (!string.IsNullOrEmpty(str))
        {
            str = string.Format("<color=#{0}>{1}</color>",colorStr,str);
        }
        return str; 
    }

    public static void Show(this GameObject gameObject,bool show)
    {
        if (gameObject!= null)
        {
            gameObject.transform.localScale = show ? Vector3.one : Vector3.zero;
        }
    }

    public static bool CheckHaveError(MainPack mainPack)
    {
        bool hasError = false;
        if (mainPack == null)
        {
            var tip = string.Format("网络数据错误{0}", mainPack.Actioncode);
            UISys.ShowTipMsg(tip);
            Debug.LogFormat("package {0} null!", mainPack.Actioncode);
            hasError = true;
            return hasError;
        }

        if (mainPack.Returncode == ReturnCode.Fail)
        {
            UISys.ShowTipMsg(mainPack.Str);
            hasError = true;
        }

        return hasError;
    }

    /// <summary>
    /// 存储字典的值到列表里面
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="W"></typeparam>
    /// <param name="dic"></param>
    /// <returns></returns>
    public static List<W> SaveDicValueToList<T, W>(Dictionary<T, W> dic)
    {
        List<W> listW = new List<W>();
        var ienuDic = dic.GetEnumerator();

        while (ienuDic.MoveNext())
        {
            listW.Add(ienuDic.Current.Value);
        }

        return listW;
    }

    public static List<W> ToList<T, W>(this Dictionary<T, W> dic)
    {
        List<W> listW = new List<W>();

        var ienuDic = dic.GetEnumerator();

        while (ienuDic.MoveNext())
        {
            listW.Add(ienuDic.Current.Value);
        }

        return listW;
    }

    public static List<T> ToList<T>(this RepeatedField<T> repeatedField)
    {
        List<T> list = new List<T>();

        foreach (var value in repeatedField)
        {
            list.Add(value);
        }

        return list;
    }

    public static IEnumerator Wait(float second = 1.0f,Action callBack = null)
    {
        yield return new WaitForSeconds(second);
        if (callBack != null)
        {
            callBack();
            callBack = null;
        }
    }
}