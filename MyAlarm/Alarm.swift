//
//  Alarm.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation

struct Alarm : Identifiable, Codable, Hashable {
    let id : String
    var title : String
    var alarmTime : Date
    var active : Bool
    var repeatDays : [DateComponents]
    var toRepeat : Bool{
        !repeatDays.isEmpty
    }
}
