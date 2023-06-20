//
//  Mbadok.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import Foundation

struct Mbadok {
    var title: String
    var subTitle: String
    var description: String
    var image: String
}

extension Mbadok {
    static let example: [Mbadok] = [
        Mbadok(title: "Browse your menu", subTitle: "Choose the food menu at your favorite restaurant", description: "We'll deliver food to your home from your favourite restaurant", image: "deliveryImg"),
        Mbadok(title: "Food order delivery", subTitle: "Courier sends your food to your door", description: "We'll deliver food to your home from your favourite restaurant", image: "deliveryImg"),
        Mbadok(title: "Find a restaurant", subTitle: "Our app can send the food you ordered anywhere", description: "Order directly. our app can send your food anywhere", image: "deliveryImg"),
    ]
}
