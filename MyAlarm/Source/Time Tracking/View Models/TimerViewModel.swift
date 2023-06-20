//
//  TimerViewModel.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {

    @Published var countActive: Bool = false
    @Published var breakTime: Bool = false
    @Published var currentTime: TimeInterval = 0
    @Published var progressMax: Double = 7
    @Published var path: NavigationPath = NavigationPath()
    let checkPoint: Double = 7
    
    func formatTime() -> String {
        let minutes = Int(currentTime/60)
        let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startCount() {
        countActive = true
        if currentTime == checkPoint {
            currentTime = 0
        }
    }
    
    func pauseCount() {
        countActive = false
    }
    
    func stopCount() {
        countActive = false
        currentTime = 0
    }
    
    func extendWork() {
        countActive = true
        breakTime = false
        progressMax += checkPoint
    }
    
    func takeBreak() {
        breakTime = false
        path.append("")
    }
}
