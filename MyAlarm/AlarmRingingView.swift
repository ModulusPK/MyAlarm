//
//  AlarmRingingView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 08/06/2023.
//

import SwiftUI

struct AlarmRingingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Image(systemName: "bell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 30)
                
                Text("06:00")
                    .font(.custom("Georgia", size: 70, relativeTo: .largeTitle))
                    .foregroundColor(.white)
                
                Text("Wake up for Work!")
                    .font(.body.weight(.heavy))
                    .foregroundColor(.white)
            }
            .padding(70)
            .overlay(Circle().stroke(Gradient(colors: [.red, .orange]), lineWidth: 5))
            Spacer()
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.accentColor)
                .opacity(0.5)
                .onTapGesture{ dismiss() }
        }
        .frame(maxWidth: .infinity)
        .background(Color("AppBg"))
        
        
    }
}

struct AlarmRingingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRingingView()
    }
}
