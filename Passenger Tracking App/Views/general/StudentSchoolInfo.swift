//
//  StudentSchoolInfo.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct StudentSchoolInfo: View {
        
    @AppStorage("rfid") var RFID: String = ""
    @AppStorage("busID") var busID: String = ""
    
    @State var school: String = ""
    @State var contact: String = ""
    
    let db = Firestore.firestore()

    func searchDocumentByID(id: String) {
        let collectionRef = db.collection("students")
        collectionRef.whereField("RFID", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                print(data["school"] as! String)
                school = data["school"] as! String
            }
            getBusDocumentByID(id: school)
        }
        
    }
    
    func getBusDocumentByID(id: String) {
        let collectionRef = db.collection("users")
        collectionRef.whereField("school", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                print(data)
                contact = data["contact"] as! String                
            }
        }
    }
    
    var body: some View {
        
        Image("school")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        
        VStack(alignment: .leading,spacing: 20) {
                        
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                Text("School: " + school)
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                Text("Contact: " + contact)
            }
            .padding()

        }
        .padding()
        .navigationBarTitle("Contact School")
        .onAppear {
            searchDocumentByID(id: RFID)
        }
    }
}
