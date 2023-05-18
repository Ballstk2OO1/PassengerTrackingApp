//
//  ParentEdit.swift
//  Passenger Tracking App
//
//  Created by YZR-M1 on 18/5/2566 BE.
//

import SwiftUI

struct ParentsEdit: View {
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var phone: String = ""
    @State private var ParentAddress: String = ""
    
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
                TextField("เบอร์โทรศัพท์", text: $phone)
                    .textFieldStyle(BottomLineTextFieldStyle())
                    .keyboardType(.phonePad)
            }
            .padding()
            
            HStack {
                Image(systemName: "house")
                    .foregroundColor(.black)
                TextField("ที่อยู่", text: $ParentAddress)
                    .textFieldStyle(BottomLineTextFieldStyle())
                    .keyboardType(.phonePad)
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
        .navigationBarTitle("แก้ไขโปรไฟล์")
    }
}

struct ParentsEdit_Previews: PreviewProvider {
    static var previews: some View {
        ParentsEdit()
    }
}
