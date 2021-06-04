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
import HealthKit


struct PlayerView: View {
    
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State private var value = 0
    
    @State var pauseMode: Bool = false
    @State var playButton: String = "pause"
    
    let songList: Array = ["strawberrySwing", "weightless", "Audio1"]
    let songName: Array = ["Strawberry Swing", "Weighless", "Gostoso Demais"]
    let artist: Array = ["Coldplay", "Marconi Union", "Maria Bethania"]
    @State var songPosition: Int = 0
    
    var body: some View {

        VStack(alignment: .leading) {
            Spacer(minLength: 10)
            Text("\(artist[songPosition])")
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .foregroundColor(.lightPurple)
            Text("\(songName[songPosition])")
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
                Text("\(value) BPM")
                    .font(.subheadline)
                    .foregroundColor(.lightPurple)
            }
            .padding(.bottom)
            
        }
        .padding(.top, 15)
        .onAppear(perform: {
            start()
            MusicPlayer.shared.playSound(sound: "\(songList[songPosition])", type: "mp3")
            
            
            print("Música está tocando")
        })
        
    }
    
    func start() {
        authorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }
    
    func authorizeHealthKit() {
          
          // Used to define the identifiers that create quantity type objects.
            let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]
         // Requests permission to save and read the specified data types.
            healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
        
          
        }

    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
            
            // We want data points from our current device
            let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
            
            // A query that returns changes to the HealthKit store, including a snapshot of new changes and continuous monitoring as a long-running query.
            let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
                query, samples, deletedObjects, queryAnchor, error in
                
             // A sample that represents a quantity, including the value and the units.
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
                
            self.process(samples, type: quantityTypeIdentifier)

            }
            
            // It provides us with both the ability to receive a snapshot of data, and then on subsequent calls, a snapshot of what has changed.
            let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
            
            query.updateHandler = updateHandler
            
            // query execution
            
            healthStore.execute(query)
        }

    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
            // variable initialization
            var lastHeartRate = 0.0
            
            // cycle and value assignment
            for sample in samples {
                if type == .heartRate {
                    lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
                }
                
                self.value = Int(lastHeartRate)
            }
        }
    
}
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
