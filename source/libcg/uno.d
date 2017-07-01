module libcg.uno;

import std.traits : EnumMembers;

import libcg.card;

enum UnoColor {
    blue,
    green,
    red,
    yellow,
    //Yes, wild is a color
    wild
}

enum UnoType {
    one,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine,
    draw_two,
    reverse,
    skip,
    wild,
    wild_draw_four
}

string toString(UnoColor color) {
    string[UnoColor] strings = [
        UnoColor.blue: "Blue",
        UnoColor.green: "Green",
        UnoColor.red: "Red",
        UnoColor.yellow: "Yellow",
        UnoColor.wild: "Wild"
    ];
    return strings[color];
}

string toString(UnoType type) {
    string[UnoType] strings = [
        UnoType.one: "One",
        UnoType.two: "Two",
        UnoType.three: "Three",
        UnoType.four: "Four",
        UnoType.five: "Five",
        UnoType.six: "Six",
        UnoType.seven: "Seven",
        UnoType.eight: "Eight",
        UnoType.nine: "Nine",
        UnoType.draw_two: "Draw-Two",
        UnoType.reverse: "Reverse",
        UnoType.skip: "Skip",
        UnoType.wild: "",
        UnoType.wild_draw_four: "Draw Four"
    ];
    return strings[type];
}

class UnoCard : Card {
    UnoColor color;
    UnoType type;
    
    this(UnoColor color, UnoType type) {
        this.color = color;
        this.type = type;
    }
    
    override public string toString() {
        return this.color.toString() ~ " " ~ this.type.toString();
    }
}

class UnoDeck : Deck {
    //Populate!
    this() {
        foreach(color; EnumMembers!UnoColor) {
            foreach(type; EnumMembers!UnoType) {
                //Wilds are special
                if(color != UnoColor.wild && (type != UnoType.wild && type != UnoType.wild_draw_four)) {
                    this.cards ~= new UnoCard(color, type);
                }
            }
        }
        //Now for wilds
        foreach(i; 0..4) {
            this.cards ~= new UnoCard(UnoColor.wild, UnoType.wild);
        }
        foreach(i; 0..4) {
            this.cards ~= new UnoCard(UnoColor.wild, UnoType.wild_draw_four);
        }
    }
}
