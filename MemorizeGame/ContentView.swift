//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: [String] =  ["👻","🎃","🦇","💀", "🕸️", "🕷️", "👹", "🧙🏽", "😱", "🙀", "🍭", "⚰️"]
        
    var body: some View {
        ScrollView {
            Cards
        }
        
        
    }
    
    var Cards: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(isFaceUp: true, content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        })
    }
}


struct CardView: View {
    
    @State var isFaceUp: Bool
    let content: String
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
