//
//  AlarmRingingView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct AlarmRingingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var countActive: Bool = false
    @State private var currentTime: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            
            Spacer()
            
            HStack{
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
                            .trim(from: 0, to: currentTime/120)
                            .stroke(Gradient(colors: [.red, .orange]), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut(duration: 1.5), value: currentTime)
                    )
            )
            .onReceive(timer, perform: {_ in
                if countActive{
                    currentTime += 1
                    if currentTime == 120{
                        countActive = false
                        
                    }
                }
            })
            
            Spacer()
            
            Button{
                if countActive{
                    pauseCount()
                }else{
                    startCount()
                }
            }label: {
                Text(countActive ? "Pause" : currentTime > 0 && currentTime < 120 ? "Resume" : "Start")
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
            
            if countActive || (currentTime > 0 && currentTime < 120){
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
        if currentTime == 120{
            currentTime = 0
        }
    }
    
    private func pauseCount(){
        countActive = false
    }
    
    private func stopCount(){
        countActive = false
        currentTime = 0
    }
}

struct AlarmRingingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRingingView()
    }
}
