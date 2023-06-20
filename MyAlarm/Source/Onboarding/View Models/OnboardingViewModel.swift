//
//  OnboardingViewModel.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 19/06/2023.
//

import Foundation
import SwiftUI

class OnboardingViewModel : ObservableObject{
    @Published var email = ""
    @Published var fullName = ""
    @Published var mobile = ""
    @Published var password = ""
    @Published var confirmPassword = ""
}
