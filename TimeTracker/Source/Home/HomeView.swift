//
//  HomeView.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 04/07/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Today so far!")
                        .bold()
                    Spacer()
                    Text("+")
                        .padding(15)
                        .font(.title)
                        .background(.green)
                        .clipShape(Circle())
                }
                
                List{
                    ForEach(1..<10) {_ in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("1hr 20min")
                                    .foregroundColor(.green)
                                Text("Database Schema")
                                    .foregroundColor(.white)
                                Text("Dev fitness")
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
