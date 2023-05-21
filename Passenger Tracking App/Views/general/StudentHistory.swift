//
//  StudentHistory.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI

struct StudentHistory: View {
    
    @AppStorage("rfid") var RFID: String = ""
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("Name: Ball")
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("Timestamp: 7:44:15 19-5-2023")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("Status: Arrived")
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("Name: Ball")
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("Timestamp: 6:24:54 19-5-2023")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.green)
                        Text("Status: On the way")
                    }
        
                }
            }
        }
        .navigationTitle("History")
    }
}

struct StudentHistory_Previews: PreviewProvider {
    static var previews: some View {
        StudentHistory()
    }
}
