//
//  TrackedTask+CoreDataProperties.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 06/07/2023.
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
    @NSManaged public var arrayOfTaskTimes: NSSet?
    
    var totalTime: Double {
        let taskTimes = arrayOfTaskTimes as? Set<TaskTime> ?? []
        var time: Double = 0
        for x in taskTimes {
            time += x.endTime - x.startTime
        }
        return time
    }
    
    var unwrappedTaskName: String {
        taskName ?? "Nil task name"
    }
    
    var unwrappedCompanyName: String {
        companyName ?? "Nil company name"
    }
    
    var unwrappedProjectName: String {
        projectName ?? "Nil project name"
    }

}

// MARK: Generated accessors for arrayOfTaskTimes
extension TrackedTask {

    @objc(addArrayOfTaskTimesObject:)
    @NSManaged public func addToArrayOfTaskTimes(_ value: TaskTime)

    @objc(removeArrayOfTaskTimesObject:)
    @NSManaged public func removeFromArrayOfTaskTimes(_ value: TaskTime)

    @objc(addArrayOfTaskTimes:)
    @NSManaged public func addToArrayOfTaskTimes(_ values: NSSet)

    @objc(removeArrayOfTaskTimes:)
    @NSManaged public func removeFromArrayOfTaskTimes(_ values: NSSet)

}

extension TrackedTask : Identifiable {

}
