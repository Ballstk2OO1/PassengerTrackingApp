//
//  BusStudentList.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct BusStudentList: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("busid") var busID: String = ""
    
    @State var listName: [String] = []
    @State var listContact: [String] = []
    @State var listRFID: [String] = []
    
    @State private var studentList: [Studentlist] = []
    
    let db = Firestore.firestore()
    
    func searchDocumentByID(id: String) {
        let collectionRef = db.collection("buses")
        collectionRef.whereField("driverID", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
                busID = data["busID"] as! String
                print(busID)
            }
            getAllStudentList(busID: busID)
        }
    }

    func getAllStudentList(busID: String) {
        let collectionRef = db.collection("students")
        collectionRef.whereField("busID", isEqualTo: busID).getDocuments { (querySnapshot, error) in
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
                studentList.append(Studentlist(firstname: data["firstName"] as? String ?? "", contact: data["contact"] as? String ?? "", rfid: data["RFID"] as? String ?? ""))
//                // Do something with the data
//                listName.append(data["firstName"] as! String)
//                listContact.append(data["contact"] as! String)
//                listRFID.append(data["RFID"] as! String)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(studentList, id: \.self.id) { student in
                        VStack(alignment: .leading, spacing: 10) {
                        Row1(label: "ชื่อ", value: student.firstname)
                            Row1(label: "เบอร์โทรศัพท์", value: student.contact)
                            Row1(label: "UID", value: student.rfid)
                        }
                        .background(Color.white)
                        .padding(.horizontal)
                    }
                    .onDelete(perform: deleteStudent)
                }
                .padding(.vertical)
                .background(Color.white)
                
                Spacer()
                
                NavigationLink(destination: BusStudentAdd(), label: {
                    Text("เพิ่มนักเรียน")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding()
                })
            }
        }
        .navigationBarTitle("รายชื่อนักเรียน")
        .onAppear {
            studentList.removeAll()
            searchDocumentByID(id: userID)
        }
    }

    func deleteStudent(at offsets: IndexSet) {
        studentList.remove(atOffsets: offsets)
    }
}




struct Row1: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct Studentlist: Identifiable {
    let id = UUID()
    var firstname: String
    var contact: String
    var rfid: String
//    var studentID: String
//    var studentClass: String
}

struct BusStudentList_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentList()
    }
}
