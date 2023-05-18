//
//  ParentEdit.swift
//  Passenger Tracking App
//
//  Created by YZR-M1 on 18/5/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Combine

struct ParentsEdit: View {
    
    @AppStorage("uid") var userID: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var contact: String = ""
    
    var body: some View {
        VStack (spacing: 0){
            Spacer()
            Image("parents")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350)
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                TextField("ชื่อ", text: $firstname)
                    .textFieldStyle(BottomLineTextFieldStyle())
            }
            .padding()
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                TextField("นามสกุล", text: $lastname)
                    .textFieldStyle(BottomLineTextFieldStyle())
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                TextField("เบอร์โทรศัพท์", text: $contact)
                    .textFieldStyle(BottomLineTextFieldStyle())
                    .keyboardType(.phonePad)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
//                updateParentData()
            }) {
                Text("แก้ไข")
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
        .navigationBarTitle("แก้ไขโปรไฟล์")
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

                firstname = data["firstName"] as! String
                lastname = data["lastName"] as! String
                contact = data["contact"] as! String
                
                print(data)
            }
        }
    }
    
//    func updateParentData() {
//
//        let db = Firestore.firestore()
//        let studentsCollection = db.collection("users")
//
//
//        let documentID = "4rYYGqhYi0PmCYUsFwGV"
//
//        studentsCollection.document(documentID).getDocument { (document, error) in
//            if let error = error {
//                print("Error getting document: \(error)")
//                return
//            }
//
//            if let document = document, document.exists {
//                var parentData: [String: Any] = [:]
//
//                let data = document.data() ?? [:]
//
//                if !firstname.isEmpty {
//                    parentData["firstname"] = firstname
//                } else {
//                    parentData["firstname"] = data["firstname"] ?? ""
//                }
//
//                if !lastname.isEmpty {
//                    parentData["lastname"] = lastname
//                } else {
//                    parentData["lastname"] = data["lastname"] ?? ""
//                }
//
//                if !contact.isEmpty {
//                    parentData["contact"] = contact
//                } else {
//                    parentData["contact"] = data["contact"] ?? ""
//                }
//
//                studentsCollection.document(documentID).setData(parentData, merge: true) { error in
//                    if let error = error {
//                        print("Error setting document: \(error)")
//                    } else {
//                        print("Document set successfully")
//                        print(parentData)
//                        firstname = ""
//                        lastname = ""
//                        contact = ""
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                }
//            }
//        }
//    }
    


    
  
}

struct ParentsEdit_Previews: PreviewProvider {
    static var previews: some View {
        ParentsEdit()
    }
}
