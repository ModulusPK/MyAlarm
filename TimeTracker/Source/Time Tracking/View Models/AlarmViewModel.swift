//
//  AlarmViewModel.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation

@MainActor
class AlarmViewModel: ObservableObject {
    
    @Published var alarms = [Alarm]()
    let directory = "Alarm"
    var notificationManager: NotificationManager
    var filesClient: FilesClient
    
    init(notificationManager: NotificationManager, filesClient: FilesClient) {
        self.notificationManager = notificationManager
        self.filesClient = filesClient
        fetchingDataFromDir()
    }
    
    func fetchingDataFromDir() {
        do {
            alarms = try filesClient.fetchingDataFromDir(directory: directory)
        } catch  {
            alarms = []
            print("load data failed")
        }
    }
    
    func setAlarm (alarm : Alarm) {
        notificationManager.setAlarm(item: alarm, repeatAlarm: alarm.toRepeat)
    }
    
    func removeAlarm(alarm: Alarm) {
        if alarm.active {
            notificationManager.setAlarm(item: alarm, repeatAlarm: alarm.toRepeat)
        }
        else{
            notificationManager.removeAlarm(item: alarm, repeatNotification: alarm.toRepeat)
        }
    }
    
    func saveToFileManager(){
        do {
            try filesClient.saveToFileManager(directory: directory, item: alarms)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func toggleAlarm(alarm : Alarm) {
//        alarms[index] = alarm
        var al = Alarm(id: alarm.id, title: alarm.title, notificationTime: alarm.notificationTime, active: alarm.active, repeatDays: alarm.repeatDays)
        al.active.toggle()
        guard let index = alarms.firstIndex(where: {
            $0.id == al.id
        }) else {return}
        alarms[index] = al
        removeAlarm(alarm: al)
    }
}
