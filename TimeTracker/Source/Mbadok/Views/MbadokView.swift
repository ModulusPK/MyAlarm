//
//  MbadokView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct MbadokView: View {
    let data: Mbadok
    var body: some View {
        VStack {
            Group{
                Text("Mba") + Text("dok").foregroundColor(.green)
            }
            .font(.largeTitle.bold())
            .padding()
            
            
            Text(data.subTitle)
                .padding()
                .multilineTextAlignment(.center)
            
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300, alignment: .center)
            
            Text(data.title)
                .font(.title)
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            
            Text(data.description)
                .padding()
                .multilineTextAlignment(.center)
            
            Button {

            } label: {
                Text("Stop")
                    .padding(20)
                    .padding(.horizontal, 100)
                    .bold()
                    .font(.title3)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.vertical)
            }
        }
        .padding()
    }
}

struct MbadokView_Previews: PreviewProvider {
    static var previews: some View {
        MbadokView(data: Mbadok.example[0])
    }
}
