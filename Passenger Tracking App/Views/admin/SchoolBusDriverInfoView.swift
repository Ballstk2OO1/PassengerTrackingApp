//
//  SchoolBusDriverInfoView.swift
//  passenger
//
//  Created by YZR-M1 on 9/2/2566 BE.
//

import SwiftUI

struct SchoolBusDriverInfoView: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var carRegistration: String = ""
    
    var body: some View {
        VStack {
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
                    TextField("ชื่อ - นามสกุล", text: $name)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    TextField("เบอร์โทรศัพท์", text: $phoneNumber)
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .keyboardType(.phonePad)
                }
            
                
                HStack {
                    Image(systemName: "car")
                        .foregroundColor(.black)
                    TextField("หมายเลขทะเบียนรถโดยสาร", text: $carRegistration)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
            }
            .padding(30)
            Spacer()
            .navigationBarTitle("ข้อมูลรถโดยสาร")
        }
    }
}

struct SchoolBusDriverInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolBusDriverInfoView()
    }
}
