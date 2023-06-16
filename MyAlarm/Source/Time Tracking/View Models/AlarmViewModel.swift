//
//  AlarmViewModel.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation
import UserNotifications

@MainActor
class AlarmViewModel: ObservableObject {
    
    @Published var alarms = [Alarm]()
    let directory = "Alarm"
    
    init() {
        fetchingDataFromDir()
    }
    
    func fetchingDataFromDir() {
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
    
    func toggleAlarm(alarm : Alarm) {
//        alarms[index] = alarm
        var al = Alarm(id: alarm.id, title: alarm.title, alarmTime: alarm.alarmTime, active: alarm.active, repeatDays: alarm.repeatDays)
        al.active.toggle()
        guard let index = alarms.firstIndex(where: {
            $0.id == al.id
        }) else {return}
        alarms[index] = al
        removeAlarm(alarm: al)
    }
    
    func setAlarm (alarm : Alarm) {
        if alarm.toRepeat {
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
        } else {
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
    
    func removeAlarm(alarm: Alarm) {
        if alarm.active {
            setAlarm(alarm: alarm)
        }
        else{
            if alarm.toRepeat{
                let Ids = alarm.repeatDays.indices.map{index in
                    "\(alarm.id)-\(index)"
                }
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: Ids)
                print("Alarms disabled successfully")
            }else{
                let identifier = alarm.id
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
                print("Alarm disabled successfully")
            }
        }
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
