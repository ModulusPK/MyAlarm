//
//  ResetPasswordView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
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
                
                Image("resetPasswordImg")
                    .resizable()
                    .scaledToFit()
                
                Text("Forgot \n Password")
                    .font(.largeTitle.bold())
                    .padding(.bottom)
                
                
                HStack {
                    Text("＠")
                        .font(.largeTitle)
                    TextField("Confirm Pin", text: $viewModel.password)
                }
                .padding(.bottom)

                HStack {
                    Text("＠")
                        .font(.largeTitle)
                    TextField("Confirm new password ", text: $viewModel.confirmPassword)
                }
                .padding(.bottom)
                
                Button {
                    
                } label: {
                    Text("Submitting...")
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

struct ResetPasswordView_Previews: PreviewProvider {
    
    @StateObject static var vm = OnboardingViewModel()
    
    static var previews: some View {
        ResetPasswordView()
            .environmentObject(vm)
    }
}
