//
//  HistoryDetailView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI

struct HistoryDetailView: View {
    
    let Studentlist:[String] = ["J","Ball","Kittisak","Thiti"]
    let Studentlist2:[String] = ["Kittisak2","Kamsuwan"]
    
    var body: some View {
        
        NavigationView {
            List {
                Section(
                    header: Text("รายชื่อนักเรียนที่ขึ้นรถ")
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                        .font(.headline)) {
                        
                            ForEach(0..<Studentlist.count) { i in
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("\(Studentlist[i])")
                                        .fontWeight(.semibold)
                                        .lineLimit(3)
                                        .minimumScaleFactor(0.5)
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
                            
                Section(
                    header: Text("รายชื่อนักเรียนที่ไม่ได้ขึ้นรถ")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .font(.headline)) {
                                    
                    ForEach(0..<Studentlist2.count) { i in
                            VStack(alignment: .leading, spacing: 5) {
                                    Text("\(Studentlist2[i])")
                                        .fontWeight(.semibold)
                                        .lineLimit(3)
                                        .minimumScaleFactor(0.5)
                                            
                                }
                            }
                                
                }
            }
        }
        .navigationTitle("รายละเอียด")
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView()
    }
}
