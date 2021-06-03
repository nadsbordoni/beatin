//
//  ContentView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    var body: some View {
        VStack() {
            Spacer(minLength: 5)
            Image("heart")
            .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
            
        }.alert(isPresented: $showAlert) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


}
