//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "👺", "🤡", "💩", "🥶", "🐸"]

    var body: some View {
        ScrollView {
            cards
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
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
