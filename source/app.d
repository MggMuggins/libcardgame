import std.stdio : writeln;
import std.random : randomShuffle;
import std.traits : EnumMembers;
import std.algorithm.searching : countUntil;
import std.algorithm.mutation : remove;

enum CardSuit {
    hearts,
    diamonds,
    clubs,
    spades
}

enum CardValue {
    ace,
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
    king
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

struct Card {
    CardSuit suit;
    CardValue value;
    
    string toString() {
        return this.value.toString() ~ " of " ~ this.suit.toString();
    }
}

class Deck {
    private Card[] cards;
    
    //Populate the deck with 32 cards
    this() {
        foreach(suit; EnumMembers!CardSuit) {
            foreach(value; EnumMembers!CardValue) {
                this.cards ~= Card(suit, value);
            }
        }
        assert(this.cards.length == 52);
        //Don't assume your cards are shuffled when they come out of the box...
    }
    
    public void shuffle() {
        this.cards.randomShuffle();
    }
    
    private void printCards() {
        foreach(card; this.cards) {
            card.toString().writeln();
        }
    }
}
void main() {
    auto test = new Deck();
    test.printCards();
    writeln();
    test.shuffle();
    writeln();
    test.printCards();
}
