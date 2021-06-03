//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var scale:CGFloat = 0.8
    @State private var go = false

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
            
            Text("83 BPM")
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
        
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


