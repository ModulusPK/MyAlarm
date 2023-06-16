//
//  SwiftUIView.swift
//  MyAlarm
//
//  Created by Saif Ullah Sajid on 16/06/2023.
//

import SwiftUI

struct Onboarding {
     var heading: String
    var image: String
    var title: String
    var subtitle: String
}

struct ParentScreen: View {
    var body: some View {
        VStack {
            TabView {
                ChildView(data: Onboarding(heading: "kljnk", image: "person", title: "dkjfn", subtitle: "sldjfnglksndflkjansldfjknsakjdf"))
                ChildView(data: Onboarding(heading: "kljnk", image: "person.fill", title: "dkjfn", subtitle: "sldjfnglksndflkjansldfjknsakjdf"))
//                ChildView()
//                ChildView()
            }
            .tabViewStyle(.page)
        }
    }
}

struct ChildView: View {
    
    let data: Onboarding
    
    var body: some View {
        VStack {
            Text(data.heading)
                .font(.largeTitle)
                .bold()
            
            Image(systemName: data.image)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Text(data.title)
                .font(.title)
                .bold()
            
            Text(data.subtitle)
            
            
            Button{

            } label: {
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
        }
    }
}

struct ParentScreen_Previews: PreviewProvider {
    static var previews: some View {
        ParentScreen()
    }
}
