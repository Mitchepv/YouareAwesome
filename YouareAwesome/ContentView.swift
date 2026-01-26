//
//  ContentView.swift
//  YouareAwesome
//
//  Created by Nia Mitchell on 1/13/26.


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
    @State private var soundIsOn = true
    
    
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
            
            
        
            HStack {
                Text ("Sound On")
                Toggle("", isOn: $soundIsOn )
                    .labelsHidden().onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button ("Show Message!") {
                    
                    let messages = [ "You are Awesome!", "You are Great!", "Wow, you are awesome. Continue to do great things. I'm am so proud of you", "Fabulous, girls!", "Let's do great things", " Be wonderful and lovely", " The smartest in the room" ]
                    
                    
                    lastMessageNumber = nonRepeatingRandom (lastNumber: lastMessageNumber, upperBound: messages.count-1, lowerBound: 0)
                    message = messages[lastMessageNumber]
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1,lowerBound: 0)
                    imageName = "image\(lastImageNumber)"
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1, lowerBound: 0)
                    
                    if soundIsOn {
                      playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    
                }
            .tint(.accentColor)
            
            }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int , upperBound: Int, lowerBound: Int ) -> Int {
        var newNumber : Int
        repeat{
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    
    func playSound(soundName: String  ){
        if audioPlayer != nil && audioPlayer.isPlaying {
                audioPlayer.stop()
        } 
        guard let soundFile = NSDataAsset(name: soundName) else { print ("😡 Could not read file named \(soundName) ")
            return
        }
        do { audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play() }
        catch {
            print ("ERROR! 😡 \(error.localizedDescription) ")
        }
    }
    
    
}

#Preview ("Light mode"){
    ContentView()
        .preferredColorScheme(.light)
}

#Preview ("Dark mode"){
    ContentView()
        .preferredColorScheme(.dark)
}
