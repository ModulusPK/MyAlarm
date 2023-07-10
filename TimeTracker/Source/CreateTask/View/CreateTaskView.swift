//
//  CreateTaskView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct CreateTaskView: View {
    
    @State private var taskName = ""
    @State private var projectName = ""
    @State private var companyName = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What are you working on?")
                .padding(.vertical, 100)
                .font(.title)
            TextField("Task Name", text: $taskName)
                .padding(30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 4))
                .padding(.bottom)
            TextField("Project Name", text: $projectName)
                .padding(30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 4))
                .padding(.bottom)
            TextField("Company Name", text: $companyName)
                .padding(30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 4))
                .padding(.bottom)
            
            Spacer()
            
            HStack {
                Spacer()
                NavigationLink(destination: TimerParent(taskName: taskName, projectName: projectName, CompanyName: companyName)) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.white)
                        .padding(30)
                        .background(.green)
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.bottom, 100)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(.black.opacity(0.8))
        .edgesIgnoringSafeArea(.all)
        //.navigationBarBackButtonHidden(true)
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateTaskView()
        }
    }
}
