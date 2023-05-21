//
//  StudentEdit.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct StudentEdit: View {
    
//    @State private var firstName: String = ""
//    @State private var lastName: String = ""
//    @State private var phoneNumber: String = ""
//    @State private var wristbandUID: String = ""
//    @State private var studentAddress: String = ""
    
    @State private var RFID: String = ""
    @State private var busID: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var contact: String = ""
    @State private var address: String = ""
    @State private var createByID: String = ""
    @State private var parentName: String = ""
    @State private var parentContact: String = ""
    @State private var school: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Spacer()
                
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.black)
//                    TextField("Firstname", text: $firstName)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//                .padding()
//
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.black)
//                    TextField("Lastname", text: $lastName)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//                .padding()
//
//                HStack {
//                    Image(systemName: "phone")
//                        .foregroundColor(.black)
//                    TextField("Contact", text: $phoneNumber)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                        .keyboardType(.phonePad)
//                }
//                .padding()
//
//                HStack {
//                    Image(systemName: "qrcode.viewfinder")
//                        .foregroundColor(.black)
//                    TextField("RFID", text: $wristbandUID)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//                .padding()
//
//                HStack {
//                    Image(systemName: "house")
//                        .foregroundColor(.black)
//                    TextField("Address", text: $studentAddress)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//                .padding()
                
                HStack{
                    Image(systemName: "qrcode.viewfinder")
                    TextField("RFID", text: $RFID)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "bus")
                    TextField("BusID", text: $busID)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "person")
                    TextField("Firstname", text: $firstName)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "person")
                    TextField("Lastname", text: $lastName)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "phone")
                    TextField("Contact", text: $contact)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "map")
                    TextField("Address", text: $address)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "briefcase")
                    TextField("School", text: $school)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                Spacer()
                
                Button(action: {
                    RFID = ""
                    busID = ""
                    firstName = ""
                    lastName = ""
                    contact = ""
                    address = ""
                    createByID = ""
                    parentName = ""
                    parentContact = ""
                    school = ""
                }) {
                    Text("Update")
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
        .navigationBarTitle("Edit Profile")
    }
}

struct StudentEdit_Previews: PreviewProvider {
    static var previews: some View {
        StudentEdit()
    }
}
