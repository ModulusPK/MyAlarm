//
//  TaskTime+CoreDataProperties.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 06/07/2023.
//
//

import Foundation
import CoreData


extension TaskTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskTime> {
        return NSFetchRequest<TaskTime>(entityName: "TaskTime")
    }

    @NSManaged public var endTime: Double
    @NSManaged public var id: UUID?
    @NSManaged public var startTime: Double
    @NSManaged public var trackedTask: TrackedTask?

}

extension TaskTime : Identifiable {

}
