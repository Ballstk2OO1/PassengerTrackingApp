//
//  SchoolInfoEdit.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct SchoolInfoEdit: View {
    @State private var SchoolName: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack (spacing: 10){
            Spacer()
            Image("school")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity)
                .foregroundColor(.blue)
                .padding(20)
            
            HStack {
                Image(systemName: "building")
                    .foregroundColor(.black)
                TextField("ชื่อ", text: $SchoolName)
                    .textFieldStyle(BottomLineTextFieldStyle())
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                TextField("เบอร์ติดต่อ", text: $phoneNumber)
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



struct SchoolInfoEdit_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoEdit()
    }
}
