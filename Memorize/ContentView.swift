//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/10/27.
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
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let base = RoundedRectangle(cornerRadius: 12)

    
    var body: some View { 
        ZStack {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                VStack{
                    Text("👻")
                    Text("Swift!")
                        .foregroundColor(.black)
                }
                .background(.pink)
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
