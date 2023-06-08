//
//  MyAlarmApp.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

@main
struct MyAlarmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("notification Authorization successful!")
            }
            else {
                print("Notification authorization denied.")
            }
        }
    }
}
