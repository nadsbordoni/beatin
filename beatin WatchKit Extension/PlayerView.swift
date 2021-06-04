//
//  PlayerView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 31/05/21.
//

import SwiftUI
import StoreKit
import WatchKit
import AVFoundation

struct PlayerView: View {
    
    @State var pauseMode: Bool = false
    @State var playButton: String = "pause"
    
    let songList: Array = ["Audio2", "Audio1"]
    @State var songPosition: Int = 0
    
    var body: some View {
        
        
        
        
        VStack(alignment: .leading) {
            Spacer(minLength: 10)
            Text("Nome do artista")
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .foregroundColor(.lightPurple)
            Text("\(songList[songPosition])")
                .font(.system(size: 22))
                .foregroundColor(.lightPurple)
            HStack() {
                Button(action: {
                    
                    if pauseMode == true && songPosition != 0 {
                        
                        playButton = "pause"
                        songPosition -= 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                        pauseMode = false
                        
                    }
                    
                    else if pauseMode == true && songPosition == 0 {
                        
                        pauseMode = false
                        playButton = "pause"
                        songPosition = songList.count - 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                    else if songPosition == 0  {
                        
                        songPosition = songList.count - 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                    else {
                        
                        songPosition -= 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                }, label: {
                    Image("backward")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                    
                }).buttonStyle(BorderedButtonStyle(tint: .black))
                
                Button(action: {
                    
                    if pauseMode == true {
                        
                        MusicPlayer.shared.resumeSound()
                        self.pauseMode.toggle()
                        playButton = "pause"
                    }
                    
                    else {
                        
                        MusicPlayer.shared.pauseSound()
                        self.pauseMode.toggle()
                        playButton = "play"
                    }
                    
                    
                }, label: {
                    Image("\(playButton)")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                    
                    
                }).padding().buttonStyle(BorderedButtonStyle(tint: .black))
                
                Button(action: {
                    
                    if pauseMode == true && songPosition != songList.count - 1 {
                        
                        playButton = "pause"
                        songPosition += 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                        pauseMode = false
                        
                    }
                    
                    else if pauseMode == true && songPosition == songList.count - 1 {
                        
                        pauseMode = false
                        playButton = "pause"
                        songPosition = 0
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                    else if songPosition == songList.count - 1  {
                        
                        songPosition = 0
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                    else {
                        
                        songPosition += 1
                        MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
                    }
                    
                }, label: {
                    Image("forward")
                        .resizable()
                        .padding(0.0)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                    
                }).buttonStyle(BorderedButtonStyle(tint: .black))
            }
            .padding(.top)
            Spacer(minLength: 20)
            HStack() {
                Image("heart")
                    .resizable()
                    .frame(width: 31, height: 29, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("83 BPM")
                    .font(.subheadline)
                    .foregroundColor(.lightPurple)
            }
            .padding(.bottom)
            
        }
        .padding(.top, 15)
        .onAppear(perform: {
            MusicPlayer.shared.playSound(sound: "Audio2", type: "mp3")
            
            
            print("Música está tocando")
        })
        
    }
}
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
