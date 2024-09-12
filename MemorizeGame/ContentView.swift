//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: Array<String> = ["👻","🎃","🦇","💀"]
    
    var body: some View {
        HStack {
            ForEach(emojis, id: \.self) { emoji in
                CardView(isFaceUp: false, content: emoji)
            }
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
