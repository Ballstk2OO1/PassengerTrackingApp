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
    @AppStorage("rfid") var RFID: String = ""
        
    @State var changePage : Bool = false
    @State var firstname: String = ""
    @State var studentMember : [String] = []
        
    let db = Firestore.firestore()
    
    func searchFirstnameByID(id: String) {
        let collectionRef = db.collection("students")
        collectionRef.whereField("createByID", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                studentMember.append(data["firstname"] as! String)
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
                        
                        ForEach(studentMember, id: \.self) { i in
                            Button(action: {
                                //setState onClick
                                firstname = i
                                changePage.toggle()
                            }, label: {
                                Text(i)
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
                        NavigationLink(destination: ParentsStudentView(firstname: $firstname), isActive: $changePage) {
                            EmptyView()
                        }
                    }
                    
                    VStack {
                        
                        NavigationLink(destination : StudentAdd() , label: {
                            Text("Create new student")
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
                        
                        NavigationLink(destination : ParentsInfo(), label: {
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
                        
                        Button(action: {
                            let firebaseAuth = Auth.auth()
                            do {
                                try firebaseAuth.signOut()
                                withAnimation {
                                    userID = ""
                                    role = ""
                                    RFID = ""
                                }
                            } catch let sighOutError as NSError {
                                print("Error signing out: %@", sighOutError)
                            }
                        }, label: {
                            Text("Sign out")
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
        .onAppear {
            searchFirstnameByID(id: userID)
        }
    }
}
