using UnityEngine;

public enum CardType
{
    NONE,
    CLUB,   //草花
    DIAMOND,//方块
    HEART,  //红心
    SPADE,  //黑桃
    BLACK_JOKER,
    RED_JOKER
}

public enum CardValue
{
    NONE,
    J = 11, 
    Q = 12,
    K = 13,
    SmallJoker = 14,
    Joker = 15,
}

public struct CardData
{
    #region 属性
    public CardType cardType;
    public int CardInt { private set; get; }
    public int CardValue { private set; get; }
    public int CardPower { private set; get; }

    public Sprite sprite;

    public bool IsPet
    {
        get
        {
            return CardValue == 1;
        }
    }
    public bool IsBoss
    {
        get
        {
            return CardValue > 10;
        }
    }

    public bool IsJoker
    {
        get
        {
            return cardType == CardType.BLACK_JOKER || cardType == CardType.RED_JOKER;
        }
    }

    public uint CardSkillID { private set; get; }
    #endregion

    public CardData(int cardInt)
    {
        CardInt = cardInt;
        CardValue = (cardInt == 52 || cardInt == 53) ? 15 : (cardInt % 13) + 1;
        if (CardInt == 52)
        {
            cardType = CardType.BLACK_JOKER;
        }
        else if (CardInt == 53)
        {
            cardType = CardType.RED_JOKER;
        }
        else
        {
            cardType = (CardType)(((cardInt) / 13) + 1);
        }
        
        sprite = CardMgr.Instance.GetCardSprite(cardInt);
        CardPower = CardValue;
        if (CardValue > 13)
        {
            CardPower = 0;
        }
        else
        if (CardValue > 10)
        {
            CardPower += 4 * CardValue - 45;
        }

        CardSkillID = 1001;
    }
}