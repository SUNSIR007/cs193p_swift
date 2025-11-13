//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            cards
                .animation(.default, value: viewModel.cards)
        }
        Button("Shuffle") {
            viewModel.shuffle()
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                VStack(spacing: 0) {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(10)
                        .border(.red)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(Color.pink, lineWidth: 2)
                VStack{
                    Text(card.content)
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    Text("Swift!")
                        .foregroundColor(.black)
                }
                .padding(20)
                .background(.pink)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .foregroundColor(.yellow)
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isMatched ? 0 : 1)
    }
}
  
#Preview("Dark Mode") {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
