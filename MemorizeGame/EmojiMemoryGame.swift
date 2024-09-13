//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 13/9/24.
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻","🎃","🦇","💀", "🕸️", "🕷️", "👹", "🧙🏽", "😱", "🙀", "🍭", "⚰️"][index]
}

class EmojiMemoryGame {
    
    private var model = MemoryGame<String>(numberOfPairsOfCards: 6, cardContentFactory: createCardContent)
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        
    }

}
