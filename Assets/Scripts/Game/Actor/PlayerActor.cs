using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerActor:GameActor
{
    private ActorEventMgr eventMgr = new ActorEventMgr();

    public ActorEventMgr Event
    {
        get
        {
            return eventMgr;
        }
    }
    public int Index = 0;

    private List<CardData> m_curList = new List<CardData>(GameMgr.Instance.MyMaxCardNum);    //手卡
    private List<CardData> m_choiceList = new List<CardData>();                             //当前回合选择的卡

    private void RegisterEvent()
    {
        
    }

    #region 战斗中卡排操作
 
    #endregion
}