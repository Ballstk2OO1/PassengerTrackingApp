//
//  BusView1.swift
//  passenger
//
//  Created by YZR-M1 on 6/2/2566 BE.
//

import SwiftUI
import FirebaseAuth

struct BusDriverView: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("role") var role: String = ""
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Image("busdriver")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                
                ScrollView {
                    
                    VStack {
                        NavigationLink(destination : BusStudentView(), label: {
                            Text("เช็คนักเรียนขึ้น - ลง")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                .padding()
                        })
                    }
                    
                    VStack {
                        NavigationLink(destination : BusStudentList(), label: {
                            Text("รายชื่อนักเรียน")
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
                            Text("ประวัติการใช้รถโดยสาร")
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
                        NavigationLink(destination : BusDriverInfo(), label: {
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
                        Button(action: {
                            let firebaseAuth = Auth.auth()
                            do {
                                try firebaseAuth.signOut()
                                withAnimation {
                                    userID = ""
                                    role = ""
                                }
                            } catch let sighOutError as NSError {
                                print("Error signing out: %@", sighOutError)
                            }
                        }, label: {
                            Text("ออกจากระบบ")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.red)
                                .cornerRadius(15)
                                .shadow(color: Color.red.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                .padding()
                        })
                    }
                    
                }
                
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
