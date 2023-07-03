//
//  AlarmRingingView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct TimerParent: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var timerVM = TimerViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//we need to pause the timer after 30 seconds and show a popup to the user
    // the popup will tell the user to get up and walk for a while
    // it will have two buttons, one for resuming the timer again and one for extending the break.
    
    var body: some View {
        NavigationStack{
            ZStack{
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
                        Text(timerVM.formatTime())
                            .font(.custom("Georgia", size: 70, relativeTo: .largeTitle))
                            .foregroundColor(.white)
                        
                        Text("Current Streak")
                            .font(.body.weight(.heavy))
                            .foregroundColor(.white)
                    }
                    .padding(70)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 10)
                            .overlay(
                                Circle()
                                    .trim(from: 0, to: timerVM.count/timerVM.progressMax)
                                    .stroke(Gradient(colors: [.red, .orange]), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                    .rotationEffect(.degrees(-90))
                                    .animation(.easeOut(duration: 1.5), value: timerVM.count)
                            )
                    )
                    .onReceive(timer) {_ in
                        if timerVM.countActive {
                            timerVM.count += 1
                            if timerVM.count.truncatingRemainder(dividingBy: timerVM.checkPoint) == 0 {
                                timerVM.countActive = false
                                timerVM.breakTime = true
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        if timerVM.countActive {
                            timerVM.pauseCount()
                        } else {
                            timerVM.startCount()
                        }
                    } label: {
                        Text(timerVM.countActive ? "Pause" : timerVM.count > 0 && timerVM.count < timerVM.checkPoint ? "Resume" : "Start")
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
                    
                    if timerVM.countActive || (timerVM.count > 0 && timerVM.count < timerVM.checkPoint) {
                        Button{
                            timerVM.stopCount()
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
                
                if timerVM.breakTime {
                    ZStack {
                        Color.black.opacity(0.8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        VStack {
                            Text("🎉")
                                .font(.largeTitle)
                                .padding()
                            
                            Text("Hey it's time to take a break!")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                            
                            HStack {
                                Button {
                                    timerVM.takeBreak()
                                } label: {
                                    NavigationLink(value: ""){
                                        Text("Okay")
                                            .padding()
                                            .frame(width: 120)
                                            .background(.gray)
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                    }
                                }
                                
                                Button {
                                    timerVM.extendWork()
                                } label: {
                                    Text("Extend")
                                        .padding()
                                        .frame(width: 120)
                                        .background(.gray)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        
                                }
                            }
                            .padding(.vertical)
                        }
                        .padding()
                        .background(.gray.opacity(0.7))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity)
            .background(const.appBg)
            .navigationDestination(for: String.self) {_ in
                BreakTimeView(timerVM: timerVM)
            }
        }
    }
    
    
}

struct TimerParent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TimerParent()
        }
    }
}
