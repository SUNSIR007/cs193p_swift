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
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                VStack{
                    Text("👻")
                    Text("Swift!")
                        .foregroundColor(.black)
                }
                .background(.pink)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
            
        }
    }
}

#Preview("Dark Mode") {
    ContentView()
}
