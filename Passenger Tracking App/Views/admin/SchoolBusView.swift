//
//  SchoolBusView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI

struct SchoolBusView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                
                Image("school")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                
                
                VStack {
                    
                    NavigationLink(destination : SchoolStudentView(), label: {
                        Text("ข้อมูลนักเรียนขึ้น - ลงรถโดยสาร")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 50)
                            .frame(maxWidth:.infinity)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                    })
                    .padding()
                    
                    VStack {
                        
                        NavigationLink(destination : SchoolStudentlist(), label: {
                            Text("ข้อมูลนักเรียน")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : SchoolBusDriverInfoView(), label: {
                            Text("ข้อมูลรถโดยสาร")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : HistoryView(), label: {
                            Text("ประวัติการขึ้น - ลงรถโดยสาร")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                }
                .padding()
            }
            .frame(alignment: .center)
        }
    }
}

struct SchoolBusView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolBusView()
    }
}
