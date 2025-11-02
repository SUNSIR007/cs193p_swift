//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "👺", "🤡", "💩", "🥶", "🐸"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            Spacer()
            cardAdder
            Spacer()
            cardRemover
            Spacer()
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus.circle")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle")
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let base = RoundedRectangle(cornerRadius: 12)
    var content: String
    
    var body: some View {
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                VStack{
                    Text(content)
                    Text("Swift!")
                        .foregroundColor(.black)
                }
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview("Dark Mode") {
    ContentView()
}
