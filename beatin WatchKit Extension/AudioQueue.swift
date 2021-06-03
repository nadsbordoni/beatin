//
//  AudioQueue.swift
//  beatin WatchKit Extension
//
//  Created by Vítor Bárrios Luís de Albuquerque on 03/06/21.
//

import Foundation
import AVFoundation

class AudioQueue: AVAudioPlayer, AVAudioPlayerDelegate {
    
    static let shared = AudioQueue()
    
    var counter = 0
    let songList: Array = ["Audio2", "Audio1"] //Song names array
    var audioPlayer = AVAudioPlayer()
    
    func playSound() {
        music()
    }
    
    func pauseSound() {
        
        audioPlayer.pause()
    }
    
    func resumeSound() {
        
        audioPlayer.play()
    }
    
    func music(){
        
        let audioPath = Bundle.main.path(forResource: "\(songList[counter])", ofType: "mp3")!
        var error : NSError? = nil
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: NSURL(string: audioPath)! as URL)
        } catch let error1 as NSError {
            error = error1
        }
        audioPlayer.delegate = self
        if error == nil {
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
    // Delegate method for AVAudioPlayerDelegate which is called every time when song finished.
    private func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool){
        
        if flag {
            counter += 1
        }
        
        if (counter == songList.count - 1) {
            counter = 0
        }
        
        music()
    }
    
}
