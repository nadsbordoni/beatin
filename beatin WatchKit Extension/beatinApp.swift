//
//  beatinApp.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

@main
struct beatinApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                PlayerView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
