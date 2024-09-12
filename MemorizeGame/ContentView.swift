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
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(isFaceUp: true, content: emojis[index])
                }
            }
            
            HStack {
                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus")
                })
                
                
                Spacer()
                
                Button(action: {
                    cardCount += 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus")
                })
               

            }
            .padding(.horizontal)
            .imageScale(.large)
            .font(.largeTitle)
            
            
        }
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
