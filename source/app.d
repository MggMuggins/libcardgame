import std.stdio : writeln;
import std.random : randomShuffle;
import std.traits : EnumMembers;

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

class CardRegistry {
    private bool[Card] index;
    
    invariant() {
        assert(this.index.length == 52);
    }
    
    //Sets all possible keys to true
    this() {
        foreach(suit; EnumMembers!CardSuit) {
            foreach(value; EnumMembers!CardValue) {
                this.checkIn(Card(suit, value));
            }
        }
    }
    
    public void checkIn(Card card) {
        this.index[card] = true;
    }
    
    public void checkOut(Card card) {
        this.index[card] = false;
    }
}

class Deck {
    private CardRegistry cards;
    
    //Populate the deck with 52 cards
    this() {
        this.cards = new CardRegistry();
    }
    
    private void printCards() {
        
    }
}

void main() {
    auto test = new Deck();
    test.printCards();
    writeln();
    test.printCards();
}
