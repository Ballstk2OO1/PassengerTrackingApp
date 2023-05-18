//
//  SchoolInfo.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct SchoolInfo: View {
    @State private var schoolname: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
            VStack(alignment: .leading,spacing: 20) {
                Spacer()
                
                Image("school")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    Label("ชื่อ : ", systemImage: "")
                    Text(schoolname)
                }
                .padding()
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    Label("เบอร์โทรศัทพ์ : ", systemImage: "")
                    Text(phoneNumber)
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: SchoolInfoEdit(), label: {
                    Text("แก้ไขโปรไฟล์")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding()
                })
            }
            .padding()
            .navigationBarTitle("โปรไฟล์")
        }
}

struct SchoolInfo_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfo()
    }
}
