//
//  OnboardingTimerView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct OnboardingTimerView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "arrowshape.right.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            }
            .padding(.horizontal, -60)
            .padding(.bottom, 70)
            
            
            Text("Timer")
                .font(.largeTitle.bold())
                .padding(.bottom, 200)
            
            Text("Keep track of your work progress on a daily basis. Take a hint from the below picture")
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 80)
        .frame(maxWidth: .infinity)
    }
}

struct OnboardingTimerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTimerView()
    }
}
