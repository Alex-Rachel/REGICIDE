using System;
using System.Collections;
using System.Collections.Generic;
using BestHTTP;
using UnityEngine;

public class RankDataMgr : Singleton<RankDataMgr>
{
    public string url
    {
        get
        {
            switch (GameApp.Instance.hostPoint)
            {
                case (GameApp.HostPoint.LocalHost):
                    return "http://127.0.0.1:8767/";
                case (GameApp.HostPoint.LinuxServer):
                    return "http://1.12.241.46:8767/";
                case (GameApp.HostPoint.WinServer):
                    return "http://1.14.132.143:8767/";
            }
            return "ws://127.0.0.1:8767/ws";
        }
    }
    public void GetRankDatas(int rankIndex)
    {
        //HTTPRequest request = new HTTPRequest(new Uri("http://1.14.132.143:12345/rankList"), OnRequestFinished); request.Send();
        HTTPRequest request = new HTTPRequest(new Uri(url+"rankList"), HTTPMethods.Post,
            OnRequestRankList);
        request.AddField("rankIndex", rankIndex.ToString());
        request.Send();
    }

    public void PushRankData(int rankIndex,int userId,int completeType)
    {
        HTTPRequest request = new HTTPRequest(new Uri(url+"rankPush"), HTTPMethods.Post,
            OnRequestFinished);
        request.AddField("rankIndex", rankIndex.ToString());
        request.AddField("userId", userId.ToString());
        request.AddField("userName", GameOnlineMgr.Instance.MyName);
        request.AddField("completeType", completeType.ToString());
        request.Send();
    }

    void OnRequestFinished(HTTPRequest request, HTTPResponse response)
    {
        Debug.Log("Request Finished! Text received: " + response.DataAsText);
        UISys.ShowTipMsg("成绩上传成功！！");
    }

    void OnRequestRankList(HTTPRequest request, HTTPResponse response)
    {
        RankDatas.Clear();
        var res = response.DataAsText;

        var jsonData = JsonHelper.Instance.Deserialize(res);

        var rankData = jsonData.GetJsonDataByKey("data");

        var msg = jsonData.GetStringDataByKey("msg");

        var ranks = rankData.GetJsonDataByKey("ranks");

        bool online = msg.Equals("Online");

        var count = ranks.ArrayCount;

        if (online)
        {
            for (int i = 0; i < count; i++)
            {
                var data = ranks.GetJsonDataByIndex(i);

                RankDatas.Add(new RankData(data,true));

                RankDatas.Sort((a, b) =>
                {
                    if (a.time > b.time)
                    {
                        return 1;
                    }
                    else
                    {
                        return -1;
                    }
                });
            }
            EventCenter.Instance.EventTrigger("RefreshRankList", RankDatas);
            return;
        }

        for (int i = 0; i < count; i++)
        {
            var data = ranks.GetJsonDataByIndex(i);
            RankDatas.Add(new RankData(data));
        }

        RankDatas.Sort((a,  b) => {
            if (a.GoldCount>b.GoldCount)
            {
                return -1;
            }
            else if (a.GoldCount == b.GoldCount)
            {
                if (a.YinCount!=b.YinCount)
                {
                    if (a.YinCount > b.YinCount)
                    {
                        return -1;
                    }
                    else
                    {
                        return 1;
                    }
                }
                else
                {
                    if (a.TongCount != b.TongCount)
                    {
                        if (a.TongCount > b.TongCount)
                        {
                            return -1;
                        }
                        else
                        {
                            return 1;
                        }
                    }
                    return a.TongCount.CompareTo(b.TongCount);
                }
            }
            else
            {
                return 1;
            }
        });

        EventCenter.Instance.EventTrigger("RefreshRankList", RankDatas);
    }

    public List<RankData> RankDatas = new List<RankData>();
}

public class RankData
{
    public bool isOnline;
    public long time;
    public string name;
    public int GoldCount;
    public int YinCount;
    public int TongCount;
    public RankData(DJsonData jsonData)
    {
        name = jsonData.GetStringDataByKey("Username");
        GoldCount = jsonData.GetIntDataByKey("GoldCount");
        YinCount = jsonData.GetIntDataByKey("YinCount");
        TongCount = jsonData.GetIntDataByKey("TongCount");
    }

    public RankData(DJsonData jsonData,bool onlineFlag)
    {
        isOnline = onlineFlag;
        name = jsonData.GetStringDataByKey("Usersname");
        time = jsonData.GetInt64DataByKey("WinTime");
    }
}