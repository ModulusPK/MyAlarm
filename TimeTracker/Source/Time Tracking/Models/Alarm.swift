//
//  Alarm.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation

struct Alarm : NotificationProtocol {
    var id : String
    var title : String
    var notificationTime: Date
    var active : Bool
    var repeatDays : [DateComponents]
    var toRepeat : Bool{
        !repeatDays.isEmpty
    }
    var daysInWords : [String]{
        if repeatDays.isEmpty {
            return []
        }else{
            let array = repeatDays.map{comp in
                switch comp.weekday{
                case 1:
                    return "Su"
                case 2:
                    return "Mu"
                case 3:
                    return "Tu"
                case 4:
                    return "We"
                case 5:
                    return "Th"
                case 6:
                    return "Fr"
                case 7:
                    return "Sa"
                default:
                    return "err"
                }
            }
            return array
        }
    }
}
