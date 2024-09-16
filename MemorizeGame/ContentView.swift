//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0, content: {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        })
    }
}


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        
    }
}
















#Preview {
    ContentView(viewModel: EmojiMemoryGame())
}
