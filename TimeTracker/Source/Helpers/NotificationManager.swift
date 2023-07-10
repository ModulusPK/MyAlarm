//
//  NotificationManager.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation
import UserNotifications
class NotificationManager {
    func setAlarm<T: NotificationProtocol> (item : T, repeatAlarm: Bool) {
        if repeatAlarm {
            var triggers: [UNNotificationTrigger] = []

            for dateComponents in item.repeatDays {
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                triggers.append(trigger)
            }
            
            for (index, trigger) in triggers.enumerated() {
                let content = UNMutableNotificationContent()
                content.title = item.title
                content.body = item.notificationTime.formatted(date: .omitted, time: .shortened)
                content.sound = UNNotificationSound.default

                let request = UNNotificationRequest(identifier: "\(item.id)-\(index)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Alarm notification \(item.id)-\(index) scheduled successfully!")
                    }
                }
            }
        } else {
            var dateComp = DateComponents()
            dateComp.hour = Calendar.current.component(.hour, from: item.notificationTime)
            dateComp.minute = Calendar.current.component(.minute, from: item.notificationTime)
            dateComp.day = Calendar.current.component(.day, from: item.notificationTime) + 1
            
            let content = UNMutableNotificationContent()
            content.title = item.title
            content.body = item.notificationTime.formatted(date: .omitted, time: .shortened)
            content.sound = UNNotificationSound.default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(item.id)", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                        if let error = error {
                            print("Error scheduling notification: \(error.localizedDescription)")
                        } else {
                            print("Alarm notification scheduled successfully!")
                        }
                    }
        }
    }
    
    func removeAlarm<T: NotificationProtocol>(item: T, repeatNotification: Bool) {
            if repeatNotification{
                let ids = item.repeatDays.indices.map{index in
                    "\(item.id)-\(index)"
                }
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
                print("Alarms disabled successfully")
            }else{
                let identifier = item.id
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
                print("Alarm disabled successfully")
            }
    }
}
