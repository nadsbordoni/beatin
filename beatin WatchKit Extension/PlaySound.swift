//
//  PlaySound.swift
//  beatin WatchKit Extension
//
//  Created by Vítor Bárrios Luís de Albuquerque on 03/06/21.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file.")
            }
        }
    }

    func pauseSound() {
        
        guard let audioPlayer = audioPlayer else { return }
            audioPlayer.pause()
    }

    func resumeSound() {
        guard let audioPlayer = audioPlayer else { return }
            audioPlayer.play()
    }

}




