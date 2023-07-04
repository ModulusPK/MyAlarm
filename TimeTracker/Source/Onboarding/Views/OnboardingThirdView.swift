//
//  OnboardingThirdView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct OnboardingThirdView: View {
    var body: some View {
        NavigationStack {
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
                
                NavigationLink(destination: HomeView())
                {
                    Text("Get Started")
                        .padding()
                        .background(.green)
                        .cornerRadius(20)
                }
                .padding(.bottom, 60)
                
            }
            .padding(.horizontal, 80)
            .frame(maxWidth: .infinity)
        }
    }
}

struct OnboardingThirdView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingThirdView()
    }
}
