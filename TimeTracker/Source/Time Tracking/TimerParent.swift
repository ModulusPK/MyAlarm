//
//  AlarmRingingView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct TimerParent: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var timerVM = TimerViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var taskName: String
    var projectName: String
    var CompanyName: String
    @State private var startTime: Double = 0
    @State private var endTime: Double = 0
    @State private var tasktimes: Set<TaskTime> = []
    
    var body: some View {
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
                        .font(.largeTitle)
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
                        .frame(width: 300)
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
                    Button {
                        saveTimes()
                        createTask()
                        timerVM.stopCount()
                    } label: {
                        Text("Stop")
                            .padding()
                            .padding(.horizontal, 80)
                            .bold()
                            .font(.title3)
                            .frame(width: 300)
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
                    Color.gray
                        .blur(radius: 200)
                        .padding(-100)
                    
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
                                saveTimes()
                                timerVM.takeBreak()
                            } label: {
                                NavigationLink(destination: BreakTimeView(timerVM: timerVM)) {
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
                    .background(.black)
                    .cornerRadius(15)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity)
        .background(const.appBg)
        .onAppear {
            startTime = endTime
        }
        //.navigationBarBackButtonHidden(true)
    }
    
    func saveTimes() {
        endTime = timerVM.count
        let taskTime = TaskTime(context: moc)
        taskTime.id = UUID()
        taskTime.startTime = startTime
        taskTime.endTime = endTime
        
        tasktimes.insert(taskTime)
    }
    
    func createTask() {
        let task = TrackedTask(context: moc)
        task.id = UUID()
        task.taskName = taskName
        task.projectName = projectName
        task.companyName = CompanyName
        task.arrayOfTaskTimes = tasktimes as NSSet
        
        do {
            try moc.save()
        } catch {
            print("save to coredata failed, error: \(error.localizedDescription)")
        }
    }
}

struct TimerParent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TimerParent(taskName: "", projectName: "", CompanyName: "")
        }
    }
}
