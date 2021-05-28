//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Image("heart")
            .resizable()
            .scaledToFit()
            Text("83 BPM")
                .font(.system(size: 24))
            .foregroundColor(.darkGrey)
        }.background(Color.lightGreen)
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static var darkGrey = Color(UIColor(red: 71/255, green: 73/255, blue: 84/255, alpha: 1.0))
    
    static var lightGreen = Color(UIColor(red: 225/255, green: 241/255, blue: 241/255, alpha: 1.0))
    
}
