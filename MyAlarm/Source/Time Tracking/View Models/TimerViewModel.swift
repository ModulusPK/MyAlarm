//
//  TimerViewModel.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    //WorkingTime properties
    @Published var countActive: Bool = false
    @Published var breakTime: Bool = false
    @Published var currentTime: TimeInterval = 0
    @Published var progressMax: Double = 7
    @Published var path: NavigationPath = NavigationPath()
    
    //breaktime properties
    @Published var isBreakTime: Bool = false
    @Published var breakTimeCount: TimeInterval = 5
    @Published var timerCountActive: Bool = false
    @Published var toggleChoice: Bool = false
    
    let checkPoint: Double = 7
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time/60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
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
    
    func extendBreak() {
        timerCountActive = true
        isBreakTime = false
        breakTimeCount += 5
    }
    
    func endBreak() {
        isBreakTime = false
    }
}
