//
//  ContentView.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 16/2/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @AppStorage("uid") var userID: String = ""
    var role: String = "user"
    
    var body: some View {
        
        if userID == "" {
            
            AuthView()
            
        } else {
            
            // Text("Logged In! \nYour user ID is \(userID)")            
            
            if role == "user" {
                ParentsView()
            }
            else if role == "driver" {
                BusDriverView()
            }
            else if role == "admin" {
                SchoolView()
            }
            
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
