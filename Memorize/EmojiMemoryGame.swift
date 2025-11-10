//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryuichi on 2025/11/3.
//

//VM 部分

import SwiftUI
import Combine
import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "👺", "🤡", "💩", "🥶", "🐸"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❤️‍🔥"
            }
        }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK:  Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
