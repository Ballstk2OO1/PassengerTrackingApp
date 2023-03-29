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
    
    var body: some View {
        
        if userID == "" {
            AuthView()
        } else {
            Text("Logged In! \nYour user ID is \(userID)")
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    withAnimation {
                        userID = ""
                    }
                } catch let sighOutError as NSError {
                    print("Error signing out: %@", sighOutError)
                }
            }) {
                Text("Sign Out")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
