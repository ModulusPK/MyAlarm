//
//  SignUpView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct SignUpView: View {
    
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
                Image("signUpImg")
                    .resizable()
                    .scaledToFit()
                
                Text("Sign Up")
                    .font(.largeTitle.bold())
                
                HStack {
                    Text("＠")
                        .font(.largeTitle)
                    TextField("alex.pinto@gmail.com", text: $viewModel.email)
                }
                HStack {
                    Text("👨🏽")
                        .font(.largeTitle)
                    TextField("Full Name", text: $viewModel.fullName)
                }
                HStack {
                    Text("📞")
                        .font(.largeTitle)
                    TextField("Mobile", text: $viewModel.mobile)
                }
                .padding(.bottom)
                
                Text("By signing up, you agree to our ") + Text("Terms & Conditions ").foregroundColor(.blue) + Text("and ") + Text("Privacy Policy").foregroundColor(.blue)
                
                Button {
                    
                } label: {
                    Text("Continue")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.vertical)
                
                HStack {
                    Spacer()
                    Text("Joined us before?  ") + Text("Login").foregroundColor(.blue)
                    Spacer()
                }
            }
            .padding(25)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    @StateObject static var vm = OnboardingViewModel()
    static var previews: some View {
        SignUpView()
            .environmentObject(vm)
    }
}
