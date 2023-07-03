//
//  LoginView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("loginImg")
                    .resizable()
                    .scaledToFit()
                
                Text("Login")
                    .font(.largeTitle.bold())
                
                HStack {
                    Text("＠")
                        .font(.largeTitle)
                    TextField("Email ID", text: $viewModel.email)
                }
                
                HStack {
                    Text("📞")
                        .font(.largeTitle)
                    TextField("Password", text: $viewModel.password)
                }
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(.blue)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding(.vertical)
                
                HStack {
                    VStack {
                        Divider()
                    }
                    Text("OR")
                        .padding(.horizontal)
                    VStack {
                        Divider()
                    }
                }
                
                Button {
                    
                } label: {
                    HStack {
                        Image("googleIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Text("Continue with Google")
                            .padding(.horizontal)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    
                }
                .padding(.vertical)
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Text("New to Logistics?  ") + Text("Register")
                        .foregroundColor(.blue)
                    Spacer()
                }
                .padding(.bottom)
            }
            .padding(25)
        }.environmentObject(viewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
