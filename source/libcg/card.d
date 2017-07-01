module libcg.card;

import std.stdio : writeln;
import std.random : randomShuffle, uniform;
import std.algorithm.mutation : remove;

interface Card {
    string toString();
}

class Deck {
    protected Card[] cards;
    
    public void shuffle() {
        this.cards.randomShuffle();
    }
    
    public void printCards() {
        foreach(card; this.cards) {
            card.toString().writeln();
        }
    }
    
    public Card getCard() {
        ulong rnd = uniform(0, this.cards.length);
        Card card =  this.cards[rnd];
        this.cards = this.cards.remove(rnd);
        return card;
    }
    
    public void replaceCard(Card card) {
        foreach(deckCard; this.cards) {
            if(deckCard == card) {
                throw new Exception("Error Replacing Card: Card already Exists");
            }
        }
        this.cards ~= card;
    }
}
