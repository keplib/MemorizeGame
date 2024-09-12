//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
    }
}


struct CardView: View {
    
    @State var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
               base.foregroundColor(.white)
               base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👻")
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
