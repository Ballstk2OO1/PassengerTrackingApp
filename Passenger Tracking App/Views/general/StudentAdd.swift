//
//  StudentAdd.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct StudentAdd: View {
    
    @AppStorage("uid") var userID: String = ""
    
    @State private var RFID: String = ""
    @State private var busID: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var contact: String = ""
    @State private var address: String = ""
    @State private var createByID: String = ""
    @State private var parentName: String = ""
    @State private var parentContact: String = ""
//    @State private var school: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(.black)
                    TextField("RFID", text: $RFID)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "bus")
                        .foregroundColor(.black)
                    TextField("BusID", text: $busID)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    TextField("Firstname", text: $firstName)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    TextField("Lastname", text: $lastName)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    TextField("Contact", text: $contact)
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .keyboardType(.phonePad)
                }
                .padding()
                
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                    TextField("Address", text: $address)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
//                HStack {
//                    Image(systemName: "briefcase")
//                        .foregroundColor(.black)
//                    TextField("School", text: $school)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//                .padding()
                
                Spacer()
                
                Button(action: {
                    searchDocumentByID(id: userID)
                }) {
                    Text("Add")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding()
                }
            }
            .padding()
        }
        .navigationBarTitle("Add Student")
    }
    
    func saveStudentData() {
        let db = Firestore.firestore()
        let studentsCollection = db.collection("students")
        
        let newStudent = [
            "RFID": RFID,
            "busID": busID,
            "firstName": firstName,
            "lastName": lastName,
            "contact": contact,
            "address": address,
            "createByID": createByID,
            "parentName": parentName,
            "parentContact": parentContact,
//            "school": school
        ]
        
        studentsCollection.addDocument(data: newStudent) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
                // Optionally, you can reset the text fields after saving the data
                RFID = ""
                busID = ""
                firstName = ""
                lastName = ""
                contact = ""
                address = ""
                createByID = ""
                parentName = ""
                parentContact = ""
//                school = ""
            }
        }
    }
    
    let db = Firestore.firestore()

    func searchDocumentByID(id: String) {
        let collectionRef = db.collection("users")
        collectionRef.whereField("id", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                
                createByID = data["id"] as! String
                parentName = data["firstname"] as! String
                parentContact = data["contact"] as! String
                
                saveStudentData()
            }
        }
    }

}

struct BottomLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading) {
            configuration
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .background(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                        .offset(y: 25)
                )
        }
    }
}

struct StudentAdd_Previews: PreviewProvider {
    static var previews: some View {
        StudentAdd()
    }
}



