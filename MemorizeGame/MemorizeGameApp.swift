//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by Balázs Képli on 11/9/24.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
