//
//  PlayerView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 31/05/21.
//

import SwiftUI


struct PlayerView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Spacer(minLength: 10)
            Text("Nome do artista")
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .foregroundColor(.lightPurple)
            Text("Nome da musica")
                .font(.system(size: 24))
                .foregroundColor(.lightPurple)
            HStack(){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("backward")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        
                }).buttonStyle(BorderedButtonStyle(tint: .black))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("play")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        
                        
                }).padding().buttonStyle(BorderedButtonStyle(tint: .black))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("forward")
                        .resizable()
                        .padding(0.0)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        
                }).buttonStyle(BorderedButtonStyle(tint: .black))
            }
            .padding(.top, 15)
           Spacer(minLength: 20)
            HStack() {
                Image("heart")
                    .resizable()
                    .frame(width: 31, height: 29, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("83 BPM")
                    .font(.subheadline)
                    .foregroundColor(.lightPurple)
            }
            
        }
        
        
           
    }
}
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
