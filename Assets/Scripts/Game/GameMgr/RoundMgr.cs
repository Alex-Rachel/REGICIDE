using System;
using System.Collections.Generic;
using UnityEngine;


enum RoundStatus
{
    RoundInit,
    RoundStart,
    Rounding,
    RoundEnd,
    RoundStop,
    RoundOver,
}

class RoundMgr : Singleton<RoundMgr>
{
    private bool m_isInited = false;

    private uint m_roundNum;

    private RoundStatus m_lastRound;
    private RoundStatus m_curRound;

    private Action<RoundStatus, RoundStatus> m_roundAction;

    private RoundStatus CurRound { get => m_curRound;
        set
        {
            if (!m_isInited && value != RoundStatus.RoundOver)
            {
                Debug.Log("回合还未初始化");
                return;
            }

            m_lastRound = m_curRound;
            m_curRound = value;
            m_roundAction.Invoke(m_lastRound, m_curRound);
        }
    }

    public void Init()
    {
        m_roundNum = 1;
        m_curRound = RoundStatus.RoundInit;

        m_isInited = true;
    }

    public void TriggerRoundStart()
    {
        CurRound = RoundStatus.RoundStart;
    }

    public void TriggerRoundEnd()
    {
        CurRound = RoundStatus.RoundEnd;
        m_roundNum++;
    }

    public void TriggerRoundOver()
    {
        CurRound = RoundStatus.RoundStart;
        m_isInited = false;
        m_roundNum = 0;
    }

    public void RegRoundChangeEvent(Action<RoundStatus, RoundStatus> action)
    {
        m_roundAction += action;
    }

}