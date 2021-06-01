//
//  NotificationView.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title ?? "hello")
                .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .padding(1.0)
            Text(message ?? "hi")
            
        }
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            
    }
}
