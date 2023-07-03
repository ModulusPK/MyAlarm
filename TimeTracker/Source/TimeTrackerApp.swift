//
//  TimeTrackerApp.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

@main
struct TimeTrackerApp: App {
    
    @StateObject var alarms = AlarmViewModel(notificationManager: notificationManager, filesClient: filesClient)
    
    var body: some Scene {
        WindowGroup {
            TimerParent()
                .environmentObject(alarms)
        }
    }
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("notification Authorization successful!")
            } else {
                print("Notification authorization denied.")
            }
        }
    }
}

let notificationManager = NotificationManager()
let filesClient = FilesClient()
