//
//  StudentAdd.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI

import SwiftUI

struct StudentAdd: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var wristbandUID: String = ""
    @State private var profileImage: UIImage? = nil
    
    @State private var isShowingImagePicker = false
    
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
                    TextField("Wristband UID", text: $wristbandUID)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                .padding()
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("เพิ่ม")
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
        .navigationBarTitle("เพิ่มนักเรียน")
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


