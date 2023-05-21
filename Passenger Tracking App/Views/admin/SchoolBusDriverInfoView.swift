//
//  SchoolBusDriverInfoView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SchoolBusDriverInfoView: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("rfid") var RFID: String = ""
    @AppStorage("busID") var busID: String = ""

    @State private var driverID: String = ""
    @State private var driverName: String = ""
    @State private var driverContact: String = ""
    @State private var carRegistration: String = ""
    
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
                print(data["busID"] as! String)
                busID = data["busID"] as! String
            }
        }
        getBusDocumentByID(id: busID)
    }
    
    func getBusDocumentByID(id: String) {
        let collectionRef = db.collection("buses")
        collectionRef.whereField("busID", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                driverName = data["driverName"] as! String
                driverContact = data["driverContact"] as! String
                carRegistration = data["carRegistration"] as! String
            }
        }
    }

    var body: some View {
        
        Image("busdriver")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        
        VStack (alignment: .leading,spacing: 20) {
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    Label("Name: ", systemImage: "")
                    Text(driverName)
                }
                .padding()
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    Label("Contact: ", systemImage: "")
                    Text(driverContact)
                }
                .padding()
                
                HStack {
                    Image(systemName: "bus")
                        .foregroundColor(.black)
                    Label("Car Registration: ", systemImage: "")
                    Text(carRegistration)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("Contact Driver")
        }
        .onAppear {
            searchDocumentByID(id: RFID)
        }
    }
}
