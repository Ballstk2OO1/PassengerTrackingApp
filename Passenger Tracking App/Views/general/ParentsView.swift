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
    
    @State var Studentmember : [String] = []
    @State var changePage : Bool = false
    
    let db = Firestore.firestore()
    
    func searchDocumentByID(id: String) {
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
                // Do something with the data
                print(data["firstName"]!)
                Studentmember.append(data["firstName"] as! String)
            }
            print(Studentmember)
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
                        
                        ForEach(Studentmember, id: \.self) { i in
                            
                            NavigationLink(destination : ParentsStudentView(), label: {
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
            
            .onAppear {
                searchDocumentByID(id: userID)
            }
        }
    }
}

struct ParentsView_Previews: PreviewProvider {
    static var previews: some View {
        ParentsView()
    }
}
