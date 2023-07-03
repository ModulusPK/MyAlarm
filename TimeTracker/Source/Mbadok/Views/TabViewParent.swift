//
//  TabViewParent.swift
//  TimeTracker
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import SwiftUI

struct TabViewParent: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(Mbadok.example, id: \.title){mbadok in
                    MbadokView(data: mbadok)
                }
            }
            .tabViewStyle(.page)
        }
    }
}

struct TabViewParent_Previews: PreviewProvider {
    static var previews: some View {
        TabViewParent()
    }
}
