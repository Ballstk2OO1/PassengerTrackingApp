//
//  AuthView.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 16/2/23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var currentViewShowing: String = "SignIn"
    
    var body: some View {
        if currentViewShowing == "SignIn" {
            LoginView(currentShowingView: $currentViewShowing)
        } else if currentViewShowing == "SignUp" {
            RegisterView(currentShowingView: $currentViewShowing)
                .transition(.move(edge: .bottom))
        }
    }
}
