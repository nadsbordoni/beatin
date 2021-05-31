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
            .foregroundColor(.lightPurple)
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static var lightPurple = Color(UIColor(red: 213/255, green: 189/255, blue: 239/255, alpha: 1.0))
    
}
