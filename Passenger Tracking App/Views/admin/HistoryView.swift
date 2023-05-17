//
//  History.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 15) {
                    
                    NavigationLink(destination : HistoryDetailView(), label: {
                        Text("Bus1")
                            .font(.title3)
                            .bold()
            
                        HStack {
                            Image(systemName: "calendar")
                            Text("10 / 02 / 66")
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.green)
                            Text("เสร็จสิ้น")
                        }
                        
                    })
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    NavigationLink(destination : HistoryDetailView(), label: {
                        Text("Bus1")
                            .font(.title3)
                            .bold()
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text("13 / 02 / 66")
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.red)
                            Text("ระหว่างดำเนินการ")
                        }
                    })
                    
                }
            }
        }
        .navigationTitle("ประวัติการขึ้นลง - รถโดยสาร")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
