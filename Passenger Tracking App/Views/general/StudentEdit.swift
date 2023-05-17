//
//  StudentEdit.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct StudentEdit: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var wristbandUID: String = ""
    @State private var studentAddress: String = ""
  
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Spacer()
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    TextField("ชื่อ", text: $firstName)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    TextField("นามสกุล", text: $lastName)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    TextField("เบอร์โทรศัพท์นักเรียน / ผู้ปกครอง", text: $phoneNumber)
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .keyboardType(.phonePad)
                }
                .padding()
                
                HStack {
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(.black)
                    TextField("UID", text: $wristbandUID)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Image(systemName: "house")
                        .foregroundColor(.black)
                    TextField("ที่อยู่", text: $studentAddress)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                
                
                Spacer()
                
                Button(action: {
                    
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
        }
        .navigationBarTitle("แก้ไขโปรไฟล์")
    }
}

struct StudentEdit_Previews: PreviewProvider {
    static var previews: some View {
        StudentEdit()
    }
}
