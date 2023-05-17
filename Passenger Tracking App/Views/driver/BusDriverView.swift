//
//  BusView1.swift
//  passenger
//
//  Created by YZR-M1 on 6/2/2566 BE.
//

import SwiftUI

struct BusDriverView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                
                Image("busdriver")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity)
                
                
                VStack {
                    
                    NavigationLink(destination : BusStudentView(), label: {
                        Text("เช็คนักเรียนขึ้น - ลง")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 50)
                            .frame(maxWidth:.infinity)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0.0, y: 10)
                    })
                    .padding()
                    
                    VStack {
                        
                        NavigationLink(destination : BusStudentList(), label: {
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
                        
                        VStack {
                            
                            NavigationLink(destination : StudentHistory(), label: {
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
                            
                            VStack {
                                
                                NavigationLink(destination : BusDriverInfo(), label: {
                                    Text("โปรไฟล์")
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
                                
                                VStack {
                                    
                                    Button(action:
                                            {
                                        
                                    }, label: {
                                        Text("ออกจากระบบ")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .frame(height: 50)
                                            .frame(maxWidth:.infinity)
                                            .frame(alignment: .center)
                                            .background(.red)
                                            .cornerRadius(15)
                                            .shadow(color: Color.red.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                            .padding()
                                    })
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(alignment: .center)
        }
    }
}


struct BusDriverView_Previews: PreviewProvider {
    static var previews: some View {
        BusDriverView()
    }
}
