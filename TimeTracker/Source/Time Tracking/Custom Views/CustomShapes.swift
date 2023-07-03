//
//  CustomShapes.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import Foundation
import SwiftUI

struct AddAlarmIcon : Shape {
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 3/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 3/4))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
