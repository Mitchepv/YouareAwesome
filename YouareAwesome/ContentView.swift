//
//  ContentView.swift
//  YouareAwesome
//
//  Created by Nia Mitchell on 1/13/26.
// commit after lesson 1.8

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    //    @State private var imageNumber = 0
    //    @State private var messageNumber = 0
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    @State var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    
    
    let numberOfImages = 9 // image 0 - 9
    let numberOfSounds = 7 // 6 soungs
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(message)
                .font(Font.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeIn(duration: 0.15 ), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            
            
            Spacer()
            
            Button("Show Message!") {
                
                let messages = [ "You are Awesome!", "You are Great!", "Wow, you are awesome. Continue to do great things. I'm am so proud of you", "Fabulous, girls!", "Let's do great things", " Be wonderful and lovely", " The smartest in the room" ]
                
                // randomization
                // if  messageNumber == lastmessage number keep generating number
                // set messageString  to message[messageNumber]
                // lastmessageNumber update with message number
                
                var messageNumber : Int
                repeat{
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                
                
                 /// random image
                
                
                var imageNumber : Int
               repeat {
                    imageNumber = Int.random(in: 0...numberOfImages-1)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                
                ///audio
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds-1)
                }
                while soundNumber == lastSoundNumber
                
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
               
                
                guard let soundFile = NSDataAsset(name: soundName) else { print ("😡 Could not read file named \(soundName) ")
                    return
                }
                do { audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play() }
                catch {
                    print ("ERROR! 😡 \(error.localizedDescription) ")
                }
                
            }
            
            
            .buttonStyle(.borderedProminent)
            .font(Font.title2)
            .tint(.orange)
        
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
