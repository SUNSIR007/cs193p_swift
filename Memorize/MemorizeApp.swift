//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

