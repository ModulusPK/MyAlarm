//
//  AlarmRingingView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct AlarmRingingScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var countActive: Bool = false
    @State private var currentTime: TimeInterval = 0
    let totalTime: Double = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
//we need to pause the timer after 30 seconds and show a popup to the user
    // the popup will tell the user to get up and walk for a while
    // it will have two buttons, one for resuming the timer again and one for extending the break.
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Image(systemName: "figure.strengthtraining.functional")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                
                Image(systemName: "figure.cooldown")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            VStack {
                Text(formatTime(currentTime))
                    .font(.custom("Georgia", size: 70, relativeTo: .largeTitle))
                    .foregroundColor(.white)
                
                Text(countActive ? "Resting 🤸" : "Take a break")
                    .font(.body.weight(.heavy))
                    .foregroundColor(.white)
            }
            .padding(70)
            .overlay(
                Circle()
                    .stroke(.white, lineWidth: 10)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: currentTime/totalTime)
                            .stroke(Gradient(colors: [.red, .orange]), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut(duration: 1.5), value: currentTime)
                    )
            )
            .onReceive(timer) {_ in
                if countActive{
                    currentTime += 1
                    if currentTime == totalTime{
                        countActive = false
                        
                    }
                }
            }
            
            Spacer()
            
            Button {
                if countActive {
                    pauseCount()
                } else {
                    startCount()
                }
            } label: {
                Text(countActive ? "Pause" : currentTime > 0 && currentTime < totalTime ? "Resume" : "Start")
                    .padding()
                    .padding(.horizontal, 80)
                    .bold()
                    .font(.title3)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Gradient(colors: [.red, .orange]))
                    )
                    .padding(.bottom)
            }
            
            if countActive || (currentTime > 0 && currentTime < totalTime) {
                Button{
                    stopCount()
                }label: {
                    Text("Stop")
                        .padding()
                        .padding(.horizontal, 80)
                        .bold()
                        .font(.title3)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Gradient(colors: [.red, .orange]))
                        )
                        .padding(.bottom)
                }
            } else {
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(const.appBg)
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time/60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startCount() {
        countActive = true
        if currentTime == totalTime {
            currentTime = 0
        }
    }
    
    private func pauseCount() {
        countActive = false
    }
    
    private func stopCount() {
        countActive = false
        currentTime = 0
    }
}

struct AlarmRingingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRingingScreen()
    }
}
