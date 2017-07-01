module main;

import std.stdio : writeln;

import libcg.uno : UnoDeck;

void main() {
    auto deck = new UnoDeck();
    deck.printCards();
    writeln();
    deck.shuffle();
    deck.printCards();
}
