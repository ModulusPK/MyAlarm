//
//  BreakTimeInsight.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation

struct BreakTimeInsight: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var image: String
    var size: String
}

extension BreakTimeInsight {
    static let example: [BreakTimeInsight] = [
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x"),
        BreakTimeInsight(title: "Burger and french fries", image: "sitManImg", size: "1x")
    ]
}
