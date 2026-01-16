//
//  ContentView.swift
//  YouareAwesome
//
//  Created by Nia Mitchell on 1/13/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
  
    var body: some View {
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(Font.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)

            
            Spacer()
            
            Button("Press me!") {
                let message1 = "You are Awesome!"
                let message2 = " You are Great!"
                
                message = ( message == message1 ? message2 : message1 )
                imageName = ( imageName == "image0" ? "image1" : "image0" )

            }
            .buttonStyle(.borderedProminent)
            .font(Font.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
