using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public struct AttackData
{
    public bool CouldTurnCard;
    public bool CouldDoubleAtk;
    public bool CouldDownBossAtk;
    public bool CouldAddHp;
    public int Damage;
    public bool HadPet;
    public bool HadJoker;

    public AttackData(bool gm)
    {
        CouldTurnCard = false;
        CouldDoubleAtk = false;
        CouldDownBossAtk = false;
        CouldAddHp = false;
        Damage = 0;
        HadPet = false;
        HadJoker = false;

        if (gm)
        {
            Damage = 999;
        }
    }

    public AttackData(List<CardData> list)
    {
        CouldTurnCard = false;
        CouldDoubleAtk = false;
        CouldDownBossAtk = false;
        CouldAddHp = false;
        Damage = 0;
        HadPet = false;
        HadJoker = false;

        foreach (var card in list)
        {
            if (card.IsPet)
            {
                HadPet = true;
            }
            else
            {
                var value = card.CardPower;
                
                Damage += value;
            }

            if (card.cardType == CardType.DIAMOND)
            {
                CouldTurnCard = true;
            }
            else if (card.cardType == CardType.CLUB)
            {
                CouldDoubleAtk = true;
            }
            else if (card.cardType == CardType.SPADE)
            {
                CouldDownBossAtk = true;
            }
            else if (card.cardType == CardType.HEART)
            {
                CouldAddHp = true;
            }
            else if(card.cardType == CardType.RED_JOKER || card.cardType == CardType.BLACK_JOKER)
            {
                HadJoker = true;
            }
        }

        if (HadPet)
        {
            Damage += 1;
        }
    }
}

public class BattleMgr : Singleton<BattleMgr>
{
    public AttackData GenAttackData(List<CardData> list)
    {
        var attackData = new AttackData(list);
#if UNITY_EDITOR
        Debug.LogFormat(string.Format("GenAttackData: 数值{0},抽卡{1},降低boss攻击{2},回复{3},双倍攻击{4}", attackData.Damage, attackData.CouldTurnCard, attackData.CouldDownBossAtk, attackData.CouldAddHp, attackData.CouldDoubleAtk));
#endif
        if (GameMgr.Instance.Roguelike)
        {
            RogueLikeMgr.Instance.buffMgr.HandleBuffAttack(ref attackData);
        }
        return attackData;
    }

    public void ImpactSkill(AttackData attackData,BossActor actor)
    {
        if (attackData.HadJoker)
        {
            GameMgr.Instance.TurnJokerCard();
            GameMgr.Instance.SetState(GameMgr.GameState.STATEONE);
            EventCenter.Instance.EventTrigger("RefreshGameUI");
            return;
        }

        CardType boss_type = actor.cardType;
        bool couldDouble = attackData.CouldDoubleAtk && (boss_type != CardType.CLUB && boss_type != CardType.BLACK_JOKER);

        int value = couldDouble ? attackData.Damage * 2 : attackData.Damage;

        actor.HandleBeAttackBuff(ref value);

        if (attackData.CouldDownBossAtk && (boss_type != CardType.SPADE && boss_type != CardType.BLACK_JOKER))
        {
            EventCenter.Instance.EventTrigger<int>("DownAtk", attackData.Damage);
        }
        if (attackData.CouldAddHp && (boss_type != CardType.HEART && boss_type != CardType.RED_JOKER))
        {
            EventCenter.Instance.EventTrigger<int>("AddHp", attackData.Damage);
        }
        if (attackData.CouldTurnCard && (boss_type != CardType.DIAMOND && boss_type != CardType.RED_JOKER))
        {
            GameMgr.Instance.TurnCard(attackData.Damage);
        }
        EventCenter.Instance.EventTrigger<int>("AttackBoss", value);
    }
}