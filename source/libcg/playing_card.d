module libcg.playing_card;

import std.stdio : writeln;
import std.traits : EnumMembers;

import libcg.card;

enum PlayingCardSuit {
    hearts,
    diamonds,
    clubs,
    spades
}

enum PlayingCardValue {
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine,
    ten,
    jack,
    queen,
    king,
    ace
}

string toString(PlayingCardSuit suit) {
    string[PlayingCardSuit] strings = [
        PlayingCardSuit.hearts: "Hearts",
        PlayingCardSuit.diamonds: "Diamonds",
        PlayingCardSuit.clubs: "Clubs",
        PlayingCardSuit.spades: "Spades"
    ];
    return strings[suit];
}

string toString(PlayingCardValue value) {
    string[PlayingCardValue] strings = [
        PlayingCardValue.ace: "Ace",
        PlayingCardValue.two: "Two",
        PlayingCardValue.three: "Three",
        PlayingCardValue.four: "Four",
        PlayingCardValue.five: "Five",
        PlayingCardValue.six: "Six",
        PlayingCardValue.seven: "Seven",
        PlayingCardValue.eight: "Eight",
        PlayingCardValue.nine: "Nine",
        PlayingCardValue.ten: "Ten",
        PlayingCardValue.jack: "Jack",
        PlayingCardValue.queen: "Queen",
        PlayingCardValue.king: "King"
    ];
    return strings[value];
}

class PlayingCard : Card {
    public PlayingCardSuit suit;
    public PlayingCardValue value;
    
    this(PlayingCardSuit suit, PlayingCardValue value) {
        this.suit = suit;
        this.value = value;
    }
    
    override public string toString() {
        return this.value.toString() ~ " of " ~ this.suit.toString();
    }
}

class PlayingCardDeck : Deck {
    //Populate the deck with 52 cards
    this() {
        foreach(suit; EnumMembers!PlayingCardSuit) {
            foreach(value; EnumMembers!PlayingCardValue) {
                this.cards ~= new PlayingCard(suit, value);
            }
        }
        assert(this.cards.length == 52);
        //Don't assume your cards are shuffled when they come out of the box...
    }
    
    ~this() {
        assert(this.cards.length == 52);
    }
}
