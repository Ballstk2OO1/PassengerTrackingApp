//
//  StudentHistory.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI

struct StudentHistory: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("ชื่อนักเรียน")
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("วันที่")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.green)
                        Text("เวลาขึ้นรถ")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("เวลาลงรถ")
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("ชื่อนักเรียน")
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("วันที่")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.green)
                        Text("เวลาขึ้นรถ")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("เวลาลงรถ")
                    }
        
                }
            }
        }
        .navigationTitle("ประวัติการขึ้น - ลงรถโดยสาร")
    }
}

struct StudentHistory_Previews: PreviewProvider {
    static var previews: some View {
        StudentHistory()
    }
}
