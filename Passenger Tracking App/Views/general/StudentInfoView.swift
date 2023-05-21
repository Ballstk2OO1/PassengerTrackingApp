//
//  StudentInfoView.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct StudentInfoView: View {
    
    @AppStorage("rfid") var RFID: String = ""
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var contact: String = ""
    @State private var uid: String = ""
    @State private var address: String = ""
    @State private var busID: String = ""
    @State private var school: String = ""
    
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
                firstname = data["firstname"] as! String
                lastname = data["lastname"] as! String
                contact = data["contact"] as! String
                uid = data["RFID"] as! String
                address = data["address"] as! String
                busID = data["busID"] as! String
                school = data["school"] as! String
            }
        }
    }

    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            Spacer()
            
            HStack {
                Image(systemName: "qrcode.viewfinder")
                    .foregroundColor(.black)
                Label("RFID: ", systemImage: "")
                Text(uid)
            }
            .padding()
            
            HStack {
                Image(systemName: "bus")
                    .foregroundColor(.black)
                Label("BusID: ", systemImage: "")
                Text(busID)
            }
            .padding()
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                Label("Firstame: ", systemImage: "")
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
            
            HStack {
                Image(systemName: "map")
                    .foregroundColor(.black)
                Label("Address: ", systemImage: "")
                Text(address)
            }
            .padding()
            
            HStack {
                Image(systemName: "briefcase")
                    .foregroundColor(.black)
                Label("School: ", systemImage: "")
                Text(school)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: StudentEdit(), label: {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)                    
            })
        }
        .padding()
        .navigationBarTitle("Profile")
        .onAppear {
            searchDocumentByID(id: RFID)
        }
    }
}
