//
//  AddAlarmView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//
import AVFoundation
import SwiftUI
import MediaPlayer

struct AddAlarmView: View {
    @ObservedObject var alarmsVM : AlarmViewModel
    @Environment(\.dismiss) var dismiss
    @State private var alarmTitle = ""
    @State private var alarmTime = Date.now
    let days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    @State private var selectedDays = [Int]()
    var dateComponentsArray : [DateComponents] {
        var dateComponentsArray: [DateComponents] = []
        
        for day in selectedDays{
            var dateComp = DateComponents()
            dateComp.hour = Calendar.current.component(.hour, from: alarmTime)
            dateComp.minute = Calendar.current.component(.minute, from: alarmTime)
            dateComp.weekday = day + 1
            dateComponentsArray.append(dateComp)
        }
        return dateComponentsArray
    }
    @State private var bgColor = Color.white
    @State private var foreColor = Color.black
    @State private var systemVolume: Float = 0.5
    var body: some View {
        VStack{
            Spacer()
            
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
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
                
                HStack{
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
                    ForEach(days.indices, id: \.self){index in
                        Text(days[index])
                            .font(.caption2)
                            .padding(5)
                            .frame(width: 40)
                            .background(.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                let _ = dayBackgroundColor(index: index + 1)
                            }
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Alarm Tune")
                        .font(.caption)
                    Text("Alarm Ringtone")
                    
//                    MPVolumeViewWrapper(systemVolume: $systemVolume)
//                        .frame(height: 0)
                    
                    Slider(value: $systemVolume, in: 0...1)
                }.padding(.vertical)
                
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding()
        .background(Color("AppBg"))
        .navigationTitle("Alarm")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func dayBackgroundColor(index : Int){
        if selectedDays.contains(index){
            selectedDays.removeAll{ $0 == index }
        }
        else
        {
            selectedDays.append(index)
        }
    }
    
    func save(){
        let alarm = Alarm(id: "\(alarmTitle):\(alarmTime.formatted())", title: alarmTitle, alarmTime: alarmTime, active: true, repeatDays: dateComponentsArray)
        
        alarmsVM.alarms.append(alarm)
        
        alarmsVM.setAlarm(alarm: alarm)
        alarmsVM.saveToFileManager()
        dismiss()
    }
    

}

struct AddAlarmView_Previews: PreviewProvider {
    @StateObject static var x = AlarmViewModel()
    static var previews: some View {
        NavigationStack{
            AddAlarmView(alarmsVM: x)
        }
    }
}


//struct MPVolumeViewWrapper: UIViewRepresentable {
//    @Binding var systemVolume: Float
//
//    func makeUIView(context: Context) -> MPVolumeView {
//        let volumeView = MPVolumeView()
//        volumeView.showsVolumeSlider = false
//        volumeView.showsRouteButton = false
//        return volumeView
//    }
//
//    func updateUIView(_ uiView: MPVolumeView, context: Context) {
//        let volumeViewSlider = uiView.subviews.first { $0 is UISlider } as? UISlider
//        volumeViewSlider?.value = systemVolume
//    }
//}
