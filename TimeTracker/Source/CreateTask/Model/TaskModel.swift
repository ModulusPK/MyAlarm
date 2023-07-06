//
//  TaskModel.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import Foundation

struct TaskModel : Identifiable {
    var id = UUID()
    var taskName: String
    var projectName: String
    var companyName: String
    var taskTimes: [TaskTime]
    
    var totalTime: Double {
        var time: Double = 0
        for x in taskTimes {
            time += x.endTime - x.startTime
        }
        return time
    }
}

struct TaskTime: Identifiable {
    let id = UUID()
    var startTime: Double
    var endTime: Double
}
