//
//  BreakTimeView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import SwiftUI

struct BreakTimeView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var timerVM: TimerViewModel
    let timer = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text("This break ends in \(timerVM.formatTime(timerVM.breakTimeCount))")
                        .padding()
                        .padding(.top, 50)
                        .onReceive(timer) {_ in
                            if timerVM.timerCountActive {
                                timerVM.breakTimeCount -= 1
                                if timerVM.breakTimeCount == 0{
                                    timerVM.timerCountActive = false
                                    timerVM.isBreakTime = true
                                }
                            }
                        }
                    
                    VStack {
                        Text("Here are some great things you can do!")
                            .padding()
                        
                        ForEach(BreakTimeInsight.example, id: \.self) {item in
                            HStack {
                                Toggle(isOn: $timerVM.toggleChoice) {
                                    Text("on")
                                }
                                .labelsHidden()
                                
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                    Text(item.size)
                                }
                            }
                            .padding()
                            .background(.gray)
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            if timerVM.isBreakTime {
                ZStack {
                    Color.black.opacity(0.8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VStack {
                        Text("🎉")
                            .font(.largeTitle)
                            .padding()
                        
                        Text("Your break has ended. Let's get back to work!")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                        
                        HStack {
                            Button {
                                timerVM.endBreak()
                                timerVM.extendWork()
                                dismiss()
                            } label: {
                                Text("Okay")
                                    .padding()
                                    .frame(width: 120)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                
                            }
                            
                            Button {
                                timerVM.extendBreak()
                                
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
            }
        }
        .foregroundColor(.white)
        .background(.red)
        .ignoresSafeArea()
        .onAppear {
            timerVM.timerCountActive = true
            timerVM.breakTimeCount = 5
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
}

struct BreakTimeView_Previews: PreviewProvider {
    @StateObject static var timerVM = TimerViewModel()
    static var previews: some View {
        BreakTimeView(timerVM: timerVM)
    }
}
