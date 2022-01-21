using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/// <summary>
/// 继承自局内 实体事件接口 用来处理 各种关卡相关的事件 和 对局外表现用的事件
/// </summary>
class LevelLogicVisual : IEntityVisual
{
    private BattleLevelLogic m_owner;

    private bool m_isVisitMode = false;

    public void Init(bool isVisitMode)
    {
        m_isVisitMode = isVisitMode;
    }

    public void OnEntityEvent(int eventId)
    {
        if (eventId == (int)EntityVisualEvent.LEVEL_ALL_KILLED)
        {
            BattleSys.Instance.OnLevelEnd();
        }
        else if (eventId == (int)EntityVisualEvent.LEVEL_SHOW_MONSTER_WAVE)
        {
            var param = m_owner.EventParam.GetCurrentParam(eventId) as LevelMonsterWaveParam;
            if (param != null)
            {
                // GameEvent.Get<IBattleLogic>().ShowMonsterWaveInfo(param.waveCount, param.curWave, (float)param.refreshTime, param.isBoss);
            }
        }
    }
}