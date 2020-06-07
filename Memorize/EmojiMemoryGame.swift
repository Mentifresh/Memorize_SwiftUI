//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Daniel Kilders Díaz on 07/06/2020.
//  Copyright © 2020 dankil. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = ["🚣‍♀️", "🏄", "🏊‍♀️", "🧗‍♀️"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
    
    init() {
        model.cards.shuffle()
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        return model.choose(card: card)
    }
}
