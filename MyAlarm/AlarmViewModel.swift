//
//  AlarmViewModel.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation
import UserNotifications

@MainActor
class AlarmViewModel : ObservableObject{
    @Published var alarms = [Alarm]()
    let directory = "Alarm"
    
    init(){
        let dir = getDocumentsDirectory().appendingPathComponent(directory)
        do {
            let data = try Data(contentsOf: dir)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([Alarm].self, from: data)
            alarms = decodedData
        } catch  {
            alarms = []
            print("load data failed")
        }
    }
    
    func setAlarm (alarm : Alarm) {
        if alarm.toRepeat{
            var triggers: [UNNotificationTrigger] = []

            for dateComponents in alarm.repeatDays {
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                triggers.append(trigger)
            }
            
            for (index, trigger) in triggers.enumerated() {
                let content = UNMutableNotificationContent()
                content.title = alarm.title
                content.body = alarm.alarmTime.formatted(date: .omitted, time: .shortened)
                content.sound = UNNotificationSound.default

                let request = UNNotificationRequest(identifier: "\(alarm.id)-\(index)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Alarm notification \(alarm.id)-\(index) scheduled successfully!")
                    }
                }
            }
        }else{
            var dateComp = DateComponents()
            dateComp.hour = Calendar.current.component(.hour, from: alarm.alarmTime)
            dateComp.minute = Calendar.current.component(.minute, from: alarm.alarmTime)
            dateComp.day = Calendar.current.component(.day, from: alarm.alarmTime) + 1
            
            let content = UNMutableNotificationContent()
            content.title = alarm.title
            content.body = alarm.alarmTime.formatted(date: .omitted, time: .shortened)
            content.sound = UNNotificationSound.default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(alarm.id)", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                        if let error = error {
                            print("Error scheduling notification: \(error.localizedDescription)")
                        } else {
                            print("Alarm notification scheduled successfully!")
                        }
                    }
        }
    }
    
    func removeAlarm(alarmIdentifier: String){
        
    }
    
    func saveToFileManager(){
        let dir = getDocumentsDirectory().appendingPathComponent(directory)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(alarms)
            try data.write(to: dir, options: [.atomic, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dir = path[0]
        return dir
    }
}
