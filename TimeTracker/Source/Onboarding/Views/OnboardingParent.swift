//
//  OnboardingParent.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct OnboardingParent: View {
    var body: some View {
        NavigationStack {
            VStack{
                TabView {
                    OnboardingTimerView()
                    OnboardingInvoiceView()
                    OnboardingThirdView()
                }
                .tabViewStyle(.page)
            }
            .padding(.vertical, 50)
            .foregroundColor(.white)
            .background(.black.opacity(0.8))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OnboardingParent_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingParent()
    }
}
