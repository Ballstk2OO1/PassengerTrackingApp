//
//  ParentsView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI

struct ParentsStudentView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                                
                Image("parents")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                
                ScrollView {
                    
                    VStack {
                        
                        NavigationLink(destination : StudentTracking(), label: {
                            Text("การติดตามนักเรียน")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                                                
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : StudentInfoView(), label: {
                            Text("โปรไฟล์")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : StudentHistory(), label: {
                            Text("ประวัติการเดินทาง")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : SchoolBusDriverInfoView(), label: {
                            Text("ติดต่อผู้ดูแลรถ")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                }
                
            }
            .frame(alignment: .center)
        }
    }
}

struct ParentsStudentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentsStudentView()
    }
}
