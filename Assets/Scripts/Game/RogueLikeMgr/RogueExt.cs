using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public enum PlayerBuffType
{
    BUFF_ADD_DEMAGE,
    BUFF_KUXINGSENG=5,
    BUFF_DUGOU = 6,
    BUFF_TALUO_WORLD7 = 7,
}

partial class RogueLikeMgr
{
    public bool CheckCardInvild()
    {
        int value = 0;

        if (!playerData.NeedCheckCards)
        {
            var list = GameMgr.Instance.m_choiceList;

            foreach (var card in list)
            {
                value += card.CardPower;
                if (card.cardType == CardType.BLACK_JOKER|| card.cardType == CardType.RED_JOKER)
                {
                    return true;
                }
            }
        }

        if (value== 0 || value == 11 || value == 21)
        {
            return true;
        }

        return false;
    }
}
