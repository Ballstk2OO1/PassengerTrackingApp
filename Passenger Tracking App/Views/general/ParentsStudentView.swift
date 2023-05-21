//
//  ParentsView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ParentsStudentView: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("rfid") var RFID: String = ""
    
    @Binding var firstname: String
    
    let db = Firestore.firestore()
    
    func searchRFIDByDocument(createBy: String, firstname: String) {
        let collectionRef = db.collection("students")
        collectionRef
            .whereField("createByID", isEqualTo: createBy)
            .whereField("firstname", isEqualTo: firstname)
            .getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error searching for documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            for document in documents {
                let data = document.data()
                // Do something with the data                
                RFID = data["RFID"] as! String
            }
        }
    }

    
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
                            Text("Student tracking")
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
                            Text("History")
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
                            Text("Profile")
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
                            Text("Contact Driver")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.black)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : StudentSchoolInfo() , label: {
                            Text("Contact School")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 25)
                                .background(.black)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                }
                
            }
            .frame(alignment: .center)
        }
        .onAppear {            
            searchRFIDByDocument(createBy: userID, firstname: firstname)
        }
    }
}
