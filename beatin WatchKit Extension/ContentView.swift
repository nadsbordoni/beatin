//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @State var scale:CGFloat = 0.8
    @State private var go = false
    
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State private var value = 0
    @State var showAlert = false
    var body: some View {
        VStack() {
            Spacer(minLength: 5)
            Image("heart")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaleEffect(scale)
                .animation(
                    Animation
                        .easeIn(duration: 0.55)
                        .repeatForever()
                )
                .onAppear{
                    self.scale += 0.1
                }
            
            Text("\(value) BPM")
                .font(.system(size: 24))
                .foregroundColor(.lightPurple)
                .padding(.top)
            VStack{
                HStack(){
                    Text("nome da musica q aaa")
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.lightPurple)
                        .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
                    Image("musicalNote")
                        .resizable()
                        .frame(width: 13, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .fixedSize()
            .frame(width: 300, alignment: go ? .trailing : .leading)
            .clipped()
            .onAppear { self.go.toggle() }
            .animation(Animation.linear(duration: 5).delay(1).repeatForever())
            
            
        }
        .onAppear() {
            start()
            
        }
        .onChange(of: value, perform: { value in
            if value >= 70 {
                showAlert = true
            } else {
                showAlert = false
            }
        })
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Eita! Calma ai!"),
                        message: Text("Notei que seus batimentos estão bem acelerados... Que tal uma musiquinha?"),
                        primaryButton: .default(Text("Claro")) {
                                          //chamar outra pagina
                                        print("chama outra pagina")
                                       },
                        secondaryButton: .cancel(Text("Agora não"))
                    )

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


