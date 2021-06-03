//
//  beatinApp.swift
//  beatin WatchKit Extension
//
//  Created by Nadia Bordoni on 28/05/21.
//

import SwiftUI

@main
struct beatinApp: App {
    var workoutManager = WorkoutManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(workoutManager)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
