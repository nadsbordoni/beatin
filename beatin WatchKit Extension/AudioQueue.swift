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
    var audio1Player = AVAudioPlayer()
    var audio2Player = AVAudioPlayer()
    
    func playSound() {
        music(sound: "\(songList[counter])", type: "mp3")
        
    }
    
        func pauseSound() {
            
            audioPlayer.pause()
        }
        
        func resumeSound() {
            
            audioPlayer.play()
        }
    
    func music(sound: String, type: String) {
        
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                try audioPlayer =  AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer.play()
            } catch {
                print("Could not find and play the sound file.")
            }
        }
        
//        let audioPath = NSBundle.mainBundle().pathForResource("\(song[counter])", ofType: "mp3")!
//                var error : NSError? = nil
//                do {
//                    player = try AVAudioPlayer(contentsOfURL: NSURL(string: audioPath)!)
//                } catch let error1 as NSError {
//                    error = error1
//                }
//                musicSlider.maximumValue = Float(player.duration)
//                NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("updateMusicSlider"), userInfo: nil, repeats: true)
//                player.delegate = self
//                if error == nil {
//                    player.delegate = self
//                    player.prepareToPlay()
//                    player.play()
//                }
        
        
        //        let path1 = Bundle.main.path(forResource: "Audio2", ofType: "mp3")
        //        let soundFile = URL(fileURLWithPath: path1!)
        //
        //        let path2 = Bundle.main.path(forResource: "Audio1", ofType: "mp3")
        //        let soundFile2 = URL(fileURLWithPath: path2!)
        //
        //        do {
        //            try audio1Player = AVAudioPlayer(contentsOf: soundFile)
        //            try audio2Player = AVAudioPlayer(contentsOf: soundFile2)
        //        } catch {
        //            print("error")
        //        }
        //        audio1Player.delegate = self
        //        audio2Player.delegate = self
        
    }
    // Delegate method for AVAudioPlayerDelegate which is called every time when song finished.
    private func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
        if flag {
            counter += 1
        }
        
        if (counter == songList.count - 1) {
            counter = 0
        }
        
        music(sound: "\(songList[counter])", type: "mp3")
    }
    
}
