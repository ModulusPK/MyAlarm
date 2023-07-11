//
//  TrackedTask+CoreDataProperties.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 11/07/2023.
//
//

import Foundation
import CoreData


extension TrackedTask {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackedTask> {
        return NSFetchRequest<TrackedTask>(entityName: "TrackedTask")
    }
    
    @NSManaged public var companyName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var projectName: String?
    @NSManaged public var taskName: String?
    @NSManaged public var startTimes: [Double]?
    @NSManaged public var endTimes: [Double]?
    
    var totalTime: Double {
        var time: Double = 0
        guard let start = startTimes, let end = endTimes else {return time}
        guard start.count == end.count else {return time}
        for i in start.indices {
            time += end[i] - start[i]
        }
        return time
    }
    
    var unwrappedTaskName: String {
        taskName ?? "Nil"
    }
    
    var unwrappedCompanyName: String {
        companyName ?? "Nil"
    }
    
    var unwrappedProjectName: String {
        projectName ?? "Nil"
    }
    
}

extension TrackedTask : Identifiable {
    
}
