//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 13/9/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        
        let chosenIndex = index(of: card)
        cards[chosenIndex!].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int? {
        return cards.firstIndex(of: card)
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
             "\(id): \(content) \(isFaceUp ? "up" : "down")"
        }
        
       
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}
