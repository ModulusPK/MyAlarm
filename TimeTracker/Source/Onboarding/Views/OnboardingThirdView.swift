//
//  OnboardingThirdView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct OnboardingThirdView: View {
    
    @State private var navPath: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                HStack {
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    Spacer()
                }
                .padding(.horizontal, -60)
                .padding(.bottom, 70)
                
                Text("Fitness")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 200)
                
                Text("Maintain your fitness alongside your work")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
//                NavigationLink(destination: HomeView(navPath: $navPath))
//                {
//                    Text("Get Started")
//                        .padding()
//                        .background(.green)
//                        .cornerRadius(20)
//                }
                
                NavigationLink(value: "home", label: {
                    Text("Get Started")
                        .padding()
                        .background(.green)
                        .cornerRadius(20)
                })
                .padding(.bottom, 60)
                
            }
            .padding(.horizontal, 80)
            .frame(maxWidth: .infinity)
            .navigationDestination(for: String.self, destination: {value in
                if value == "home" {
                    HomeView(navPath: $navPath)
                } else if value == "create task" {
                    CreateTaskView(navPath: $navPath)
                }
            })
        }
    }
}

struct OnboardingThirdView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingThirdView()
    }
}
