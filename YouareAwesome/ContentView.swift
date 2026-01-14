//
//  ContentView.swift
//  YouareAwesome
//
//  Created by Nia Mitchell on 1/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.orange)
                Text("You are Awesome!")
                    .font(Font.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
            }
            .padding()
    }
}

#Preview {
    ContentView()
}
