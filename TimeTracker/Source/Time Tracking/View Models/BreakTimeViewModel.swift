//
//  BreakTimeViewModel.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation

class BreakTimeViewModel: ObservableObject {
    
    @Published var breakActive: Bool = false
    @Published var breakTimeCount: TimeInterval = 5
    @Published var timerCountActive: Bool = false
    @Published var toggleChoice: Bool = false
    
    func extendBreak() {
        timerCountActive = true
        breakActive = false
        breakTimeCount += 5
    }
    
    func endBreak() {
        breakActive = false
    }
    
    func formatTime() -> String {
        let minutes = Int(breakTimeCount/60)
        let seconds = Int(breakTimeCount.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
