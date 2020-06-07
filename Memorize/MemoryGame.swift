//
//  MemoryGame.swift
//  Memorize
//
//  Created by Daniel Kilders Díaz on 07/06/2020.
//  Copyright © 2020 dankil. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card:  Card) {
        print("Card chosen: \(card)")
        if let chosenIndex = self.index(of: card) {
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<self.cards.count where self.cards[index].id == card.id {
            return index
        }
        return nil
    }
}
