//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 13/9/24.
//

import SwiftUI

/*
func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻","🎃","🦇","💀", "🕸️", "🕷️", "👹", "🧙🏽", "😱", "🙀", "🍭", "⚰️"][index]
}
 */

class EmojiMemoryGame: ObservableObject {
    
   // private var model = MemoryGame<String>(numberOfPairsOfCards: 6, cardContentFactory: createCardContent)
    
    private static let emojis = ["👻","🎃","🦇","💀", "🕸️", "🕷️", "👹", "🧙🏽", "😱", "🙀", "🍭", "⚰️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
 
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
 
}
