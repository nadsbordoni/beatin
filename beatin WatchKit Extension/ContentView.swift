//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI
import StoreKit
import HealthKit

struct ContentView: View {
    
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State private var value = 0
    
    var body: some View {
        VStack() {
            Spacer(minLength: 5)
            Image("heart")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 32)
                
            Text("\(value) BPM")
                .font(.system(size: 24))
                .foregroundColor(.lightPurple)
                .padding(.top)

            
            HStack(){
                Text("nome da musica q")
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.lightPurple)
                    .multilineTextAlignment(.leading)
                Image("musicalNote")
                    .resizable()
                    .frame(width: 13, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
        }
        .padding(.bottom, 25)
        .onAppear() {
            
            start()
        }
        
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


