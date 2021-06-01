//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    var body: some View {
        VStack() {
            Spacer(minLength: 5)
            Image("heart")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 32)
            Text("83 BPM")
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
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


