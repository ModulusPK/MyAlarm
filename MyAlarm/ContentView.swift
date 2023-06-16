//
//  ContentView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var alarms : AlarmViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack (alignment: .leading){
                    ScrollView {
                        ForEach(alarms.alarms) { alarm in
                            HStack {
                                VStack(alignment: .leading){
                                    Text(alarm.title)
                                    Text(alarm.alarmTime.formatted(date: .omitted, time: .shortened))
                                        .font(.largeTitle)
                                    HStack {
                                        ForEach(alarm.daysInWords, id: \.self){ day in
                                            Text(day)
                                        }
                                    }
                                }
                                Spacer()
                                if(alarm.active) {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.accentColor)
                                        .onTapGesture {
                                            alarms.toggleAlarm(alarm: alarm)
                                        }
                                } else {
                                    Image(systemName: "bell.slash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.accentColor)
                                        .onTapGesture {
                                            alarms.toggleAlarm( alarm: alarm)
                                        }
                                }
                            }
                            .padding()
                            .background(alarm.active ? .white : .gray)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .onTapGesture{
                                path.append(alarm)
                            }
                        }
                        
                    }
                    Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: AddAlarmView()) {
                        AddAlarmIcon()
                            .foregroundColor(.accentColor)
                            .frame(width: 50, height: 60)
                            .shadow(color: .gray, radius: 5, x: 0, y: 4)
                            .overlay(
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                    }
                    Spacer()
                }
                .padding(.vertical)
                }
                .padding()
                .background(const.appBg)
                .edgesIgnoringSafeArea(.bottom)
                .navigationTitle("Your Alarms")
                .navigationDestination(for: Alarm.self) { alarm in
                    AlarmRingingScreen()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var alarm = AlarmViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(alarm)
    }
}


