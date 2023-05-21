//
//  ParentsInfo.swift
//  Passenger Tracking App
//
//  Created by YZR-M1 on 18/5/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct ParentsInfo: View {
    
    @AppStorage("uid") var userID: String = ""
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var contact: String = ""
        
        var body: some View {
            
            Image("parents")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            VStack (alignment: .leading,spacing: 0) {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        Label("Firstname: ", systemImage: "")
                        Text(firstname)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        Label("Lastname: ", systemImage: "")
                        Text(lastname)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        Label("Contact: ", systemImage: "")
                        Text(contact)
                    }
                    .padding()
                    
                }
                .padding()
                
                Spacer()
                
                .onAppear {
                    getStudentData(id: userID)
                }
                
                NavigationLink(destination: ParentsEdit(), label: {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                })
                .padding()
                .navigationBarTitle("Profile")
            }
        }
    
    let db = Firestore.firestore()
    
    func getStudentData(id: String) {
        
        let studentsCollection = db.collection("users")
        
        studentsCollection.whereField("id", isEqualTo: id).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            for document in documents {
                let data = document.data()
    
                firstname = data["firstname"] as! String
                lastname = data["lastname"] as! String
                contact = data["contact"] as! String
                
                print("get get get")
                print(data)
            }
        }
    }

}
    
    

struct ParentsInfo_Previews: PreviewProvider {
    static var previews: some View {
        ParentsInfo()
    }
}
