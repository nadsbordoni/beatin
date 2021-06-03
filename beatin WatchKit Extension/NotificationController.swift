//
//  NotificationController.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    
    override var body: NotificationView {
        return NotificationView()
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    override func didReceive(_ notification: UNNotification) {
        //var dateComponents = DateComponents()
        //dateComponents.hour = 16
        //dateComponents.minute = 20
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //eu acho que a condiçao tem que existir aqui
        let okButton = NSLocalizedString("OK", comment: "Done button title in notification.")
        notificationActions = [UNNotificationAction(identifier: "okButton", title: okButton, options: [.foreground])]
        
    }
    
}
