//
//  HomeView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "taskName", ascending: true)]) var tasks: FetchedResults<TrackedTask>
    @State private var navPath = [String]()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Today so far!")
                        .bold()
                    Spacer()
                    NavigationLink(destination: CreateTaskView()) {
                        Text("+")
                            .padding(15)
                            .font(.title)
                            .background(.green)
                            .clipShape(Circle())
                    }
                    
                }
                
                List{
                    ForEach(tasks) {task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(formatTime(taskTime: task.totalTime))")
                                    .foregroundColor(.green)
                                Text(task.unwrappedTaskName)
                                    .foregroundColor(.white)
                                Text(task.unwrappedProjectName)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .foregroundColor(.white)
                                .padding()
                                .background(.green)
                                .clipShape(Circle())
                        }
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
            }
            .padding()
            .background(.black.opacity(0.8))
            .foregroundColor(.white)
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    func formatTime(taskTime: Double) -> String {
        let hours = Int(taskTime/3600)
        let minutes = Int(taskTime/60)
        let seconds = Int(taskTime.truncatingRemainder(dividingBy: 60))
        return String(format: "%02dhr %02dmin %02dsecs", hours, minutes, seconds)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
