//
//  TaskViewModel.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = [TaskModel]()
}
