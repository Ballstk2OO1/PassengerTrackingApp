//
//  StudentView.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct ParentsView: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("role") var role: String = ""
    
    @State var Studentmember : [String] = ["1"]
    @State var changePage : Bool = false
    
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
                        
                        ForEach(0..<Studentmember.count) { i in
                            
                            NavigationLink(destination : ParentsStudentView(), label: {
                                Text("นักเรียนคนที่ \(Studentmember[i])")
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
                    
                    VStack {
                        
                        NavigationLink(destination : StudentAdd() , label: {
                            Text("เพิ่มจำนวนนักเรียน")
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

struct ParentsView_Previews: PreviewProvider {
    static var previews: some View {
        ParentsView()
    }
}
