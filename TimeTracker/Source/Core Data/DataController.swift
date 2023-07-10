//
//  DataController.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 06/07/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "CoreDataModel")
    
    init() {
        container.loadPersistentStores(completionHandler: {_ , error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
        })
    }
}
