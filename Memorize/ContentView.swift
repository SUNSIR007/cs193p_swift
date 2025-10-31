//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "👺", "🤡", "💩"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
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
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                VStack{
                    Text(content)
                    Text("Swift!")
                        .foregroundColor(.black)
                }
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview("Dark Mode") {
    ContentView()
}
