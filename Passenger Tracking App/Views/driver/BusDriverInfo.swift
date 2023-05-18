//
//  BusDriverInfo.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

//busID
//"001"
//carRegistration
//""
//driverContact
//"033-333-3333"
//driverID
//"ENqijIbwKFRVk8V98aO5ObS8Qc23"
//driverName
//"driver-1 user_03"

struct BusDriverInfo: View {
    
    @AppStorage("uid") var userID: String = ""
    
    @State private var busID: String = ""
    @State private var driverID: String = ""
    @State private var driverName: String = ""
    @State private var driverContact: String = ""
    @State private var carRegistration: String = ""
    
    var body: some View {
        VStack (alignment: .leading,spacing: 20) {
            Spacer()
            Image("busdriver")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    Label("ชื่อ : ", systemImage: "")
                    Text(driverName)
                }
                .padding()
                
                HStack {
                    Image(systemName: "number")
                        .foregroundColor(.black)
                    Label("Bus ID : ", systemImage: "")
                    Text(busID)
                }
                .padding()
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    Label("เบอร์โทรศัทพ์ : ", systemImage: "")
                    Text(driverContact)
                }
                .padding()
                
                HStack {
                    Image(systemName: "bus")
                        .foregroundColor(.black)
                    Label("ทะเบียนรถ : ", systemImage: "")
                    Text(carRegistration)
                }
                .padding()
            }
            .padding()
            
            Spacer()
            
            .onAppear {
                    getBusesData(id: userID)
            }
            
            NavigationLink(destination: BusDriverEdit(), label: {
                Text("แก้ไขโปรไฟล์")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)                    
            })
            .padding()
            .navigationBarTitle("ข้อมูลผู้ขับรถโดยสาร")
        }
    }
    
    let db = Firestore.firestore()
    
    func getBusesData(id: String) {
        
        let studentsCollection = db.collection("buses")
        
        studentsCollection.whereField("driverID", isEqualTo: id).getDocuments { (querySnapshot, error) in
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
    
                busID = data["busID"] as! String
                driverName = data["driverName"] as! String
                driverContact = data["driverContact"] as! String
                carRegistration = data["carRegistration"] as! String
                driverID = data["driverID"] as! String
                
                print("get all buses data")
                print(data)
            }
        }
    }
}

struct BusDriverInfo_Previews: PreviewProvider {
    static var previews: some View {
        BusDriverInfo()
    }
}

