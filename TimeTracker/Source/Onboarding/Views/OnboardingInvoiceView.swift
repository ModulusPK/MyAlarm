//
//  OnboardingInvoiceView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct OnboardingInvoiceView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrowshape.left.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Spacer()
                Image(systemName: "arrowshape.right.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            }
            .padding(.horizontal, -60)
            .padding(.bottom, 70)
            
            Text("Invoicing")
                .font(.largeTitle.bold())
                .padding(.bottom, 200)

//            Spacer()
            
            Text("Generate invoice of your desired time frames")
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 80)
        .frame(maxWidth: .infinity)
        
    }
}

struct OnboardingInvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInvoiceView()
    }
}
