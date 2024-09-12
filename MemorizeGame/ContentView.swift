//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: [String] =  ["👻","🎃","🦇","💀", "🕸️", "🕷️", "👹", "🧙🏽", "😱", "🙀", "🍭", "⚰️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Cards
            CardCountAdjuster
        }
    }
    
    var Cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(isFaceUp: true, content: emojis[index])
            }
        }
        
    }
    
    var CardCountAdjuster: some View {
        HStack {
            
            CardRemover
            
            Spacer()
            
            CardAdder
        }
        .padding(.horizontal)
        .imageScale(.large)
        .font(.largeTitle)
    }

    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var CardAdder: some View {
       cardCountAdjuster(by: +1, symbol:"rectangle.stack.badge.plus")
    }
    
    var CardRemover: some View {
        cardCountAdjuster(by: -1, symbol:"rectangle.stack.badge.minus")
    }
}


struct CardView: View {
    
    @State var isFaceUp: Bool
    let content: String
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(content)
                    .font(.largeTitle)
            } else {
                base
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}
















#Preview {
    ContentView()
}
