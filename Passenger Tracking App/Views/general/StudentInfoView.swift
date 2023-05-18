//
//  StudentInfoView.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct StudentInfoView: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var uid: String = ""
    @State private var studentAddress: String = ""
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            Spacer()
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                Label("ชื่อ : ", systemImage: "")
                Text(name)
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                Label("เบอร์โทรศัทพ์ : ", systemImage: "")
                Text(phoneNumber)
            }
            .padding()
            
            HStack {
                Image(systemName: "qrcode.viewfinder")
                    .foregroundColor(.black)
                Label("UID : ", systemImage: "")
                Text(uid)
            }
            .padding()
            
            HStack {
                Image(systemName: "house")
                    .foregroundColor(.black)
                Label("ที่อยู่ : ", systemImage: "")
                Text(studentAddress)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: StudentEdit(), label: {
                Text("แก้ไขโปรไฟล์")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)                    
            })
        }
        .padding()
        .navigationBarTitle("โปรไฟล์")
    }

}


struct StudentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StudentInfoView()
    }
}


