//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ryuichi on 2025/11/3.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card)
    {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
