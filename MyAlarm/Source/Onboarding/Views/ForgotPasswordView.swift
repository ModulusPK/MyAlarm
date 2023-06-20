//
//  ForgotPasswordView.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button {
                    //dismiss screen
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 20)
                        .foregroundColor(.black)
                }
                Image("forgotPasswordImg")
                    .resizable()
                    .scaledToFit()
                
                Text("Forgot \n Password")
                    .font(.largeTitle.bold())
                    .padding(.bottom)
                
                Text("Don't worry! It happens. Please enter the address associated with your account.")
                    .padding(.bottom)
                
                HStack {
                    Text("＠")
                        .font(.largeTitle)
                    TextField("Email ID / Mobile number", text: $viewModel.email)
                }
                .padding(.bottom)
                
                Button {
                    
                } label: {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.vertical)
                
            }
            .padding(25)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    
    @StateObject static var vm = OnboardingViewModel()
    
    static var previews: some View {
        ForgotPasswordView()
            .environmentObject(vm)
    }
}
