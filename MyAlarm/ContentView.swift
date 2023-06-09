//
//  ContentView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var alarms : AlarmViewModel
    @State private var x = ""
    let days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(alarms.alarms){alarm in
                    HStack{
                        VStack(alignment: .leading){
                            Text(alarm.title)
                            Text(alarm.alarmTime.formatted(date: .omitted, time: .shortened))
                                .font(.largeTitle)
                            HStack{
                                ForEach(days, id: \.self){
                                    Text($0)
                                        .font(.caption2.weight(.ultraLight))
                                }
                            }
                        }
                        Spacer()
                        
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                    .background(alarm.active ? .white : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .onTapGesture{
                        path.append(alarm)
                    }
                }
                Spacer()
                NavigationLink(destination: AddAlarmView(alarmsVM: alarms)){
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
            }
            .padding()
            .background(Color("AppBg"))
            .navigationTitle("Your Alarms")
            .navigationDestination(for: Alarm.self) {alarm in
                AlarmRingingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


