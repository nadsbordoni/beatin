//
//  NotificationView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

struct NotificationView: View {
    
    var body: some View {
       
        VStack(alignment: .leading) {
            Text("Seu dia foi muito cheio hoje?")
                .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .padding(1.0)
            Text("Que tal ouvir uma musiquinha para desestressar?")
            
        }
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            
    }
}
