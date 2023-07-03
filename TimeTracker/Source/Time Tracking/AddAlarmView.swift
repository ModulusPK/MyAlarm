//
//  AddAlarmView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 08/06/2023.
//
import AVFoundation
import SwiftUI
import MediaPlayer

struct AddAlarmView: View {
    
    @EnvironmentObject var alarmsVM: AlarmViewModel
    @Environment(\.dismiss) var dismiss
    @State private var alarmTitle: String = ""
    @State private var alarmTime: Date = .now
    @State private var bgColor: Color = .white
    @State private var foreColor: Color = .black
    @State private var systemVolume: Float = 0.5
    @State private var selectedDays = [Int]()
    let days: [String] = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    var dateComponentsArray: [DateComponents] {
        var dateComponentsArray: [DateComponents] = []
        for day in selectedDays {
            var dateComp = DateComponents()
            dateComp.hour = Calendar.current.component(.hour, from: alarmTime)
            dateComp.minute = Calendar.current.component(.minute, from: alarmTime)
            dateComp.weekday = day + 1
            dateComponentsArray.append(dateComp)
        }
        return dateComponentsArray
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading){
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name")
                        TextField("Name of Alarm", text: $alarmTitle)
                    }
                    .padding(.vertical)
                    
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                }
                .padding(.vertical)
                
                HStack {
                    DatePicker("Choose Time", selection: $alarmTime, displayedComponents: .hourAndMinute)
                        .padding(.vertical)
                        .datePickerStyle(.automatic)
                        .labelsHidden()
                    Spacer()
                    Text("Save")
                        .onTapGesture {
                            save()
                        }
                }
                
                HStack{
                    ForEach(days.indices, id: \.self) { index in
                        Text(days[index])
                            .font(.caption2)
                            .padding(5)
                            .frame(width: 40)
                            .background(.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                let _ = daySelected(index: index + 1)
                            }
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Alarm Tune")
                        .font(.caption)
                    Text("Alarm Ringtone")
                    Slider(value: $systemVolume, in: 0...1)
                }
                .padding(.vertical)
                
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding()
        .background(const.appBg)
        .navigationTitle("Alarm")
    }
    
    func daySelected(index: Int) {
        if selectedDays.contains(index){
            selectedDays.removeAll { $0 == index }
        } else {
            selectedDays.append(index)
        }
    }
    
    func save() {
        let alarm = Alarm(id: "\(alarmTitle):\(alarmTime.formatted())", title: alarmTitle, notificationTime: alarmTime, active: true, repeatDays: dateComponentsArray)
        
        alarmsVM.alarms.append(alarm)
        
        alarmsVM.setAlarm(alarm: alarm)
        alarmsVM.saveToFileManager()
        dismiss()
    }
}

struct AddAlarmView_Previews: PreviewProvider {
    @StateObject static var x = AlarmViewModel(notificationManager: NotificationManager(), filesClient: FilesClient())
    static var previews: some View {
        NavigationStack{
            AddAlarmView()
                .environmentObject(x)
        }
    }
}
