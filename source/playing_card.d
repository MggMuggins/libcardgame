module playing_card;

import std.stdio : writeln;
import std.traits : EnumMembers;

import card;

enum CardSuit {
    hearts,
    diamonds,
    clubs,
    spades
}

enum CardValue {
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

string toString(CardSuit suit) {
    string[CardSuit] strings = [
        CardSuit.hearts: "Hearts",
        CardSuit.diamonds: "Diamonds",
        CardSuit.clubs: "Clubs",
        CardSuit.spades: "Spades"
    ];
    return strings[suit];
}

string toString(CardValue value) {
    string[CardValue] strings = [
        CardValue.ace: "Ace",
        CardValue.two: "Two",
        CardValue.three: "Three",
        CardValue.four: "Four",
        CardValue.five: "Five",
        CardValue.six: "Six",
        CardValue.seven: "Seven",
        CardValue.eight: "Eight",
        CardValue.nine: "Nine",
        CardValue.ten: "Ten",
        CardValue.jack: "Jack",
        CardValue.queen: "Queen",
        CardValue.king: "King"
    ];
    return strings[value];
}

class PlayingCard : Card {
    public CardSuit suit;
    public CardValue value;
    
    this(CardSuit suit, CardValue value) {
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
        foreach(suit; EnumMembers!CardSuit) {
            foreach(value; EnumMembers!CardValue) {
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
