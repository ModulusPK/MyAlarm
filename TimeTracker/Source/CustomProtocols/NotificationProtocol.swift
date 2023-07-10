//
//  NotificationProtocol.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation

protocol NotificationProtocol : Identifiable, Codable, Hashable {
    var id: String { get set }
    var title: String { get set }
    var notificationTime: Date { get set }
    var active: Bool { get set }
    var repeatDays: [DateComponents] { get set }
}
