//
//  Passenger_Tracking_AppApp.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 16/2/23.
//

import SwiftUI
import FirebaseCore

@main
struct Passenger_Tracking_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
