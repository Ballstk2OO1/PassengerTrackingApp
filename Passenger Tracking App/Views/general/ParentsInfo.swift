//
//  ParentsInfo.swift
//  Passenger Tracking App
//
//  Created by YZR-M1 on 18/5/2566 BE.
//

import SwiftUI

struct ParentsInfo: View {
    
    //ชื่อ
    //นามสกุล
    //โทรศัพท์
    //ที่อยู่

    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var phone: String = ""
    @State private var ParentAddress: String = ""
        
        var body: some View {
            VStack (alignment: .leading,spacing: 0) {
                Spacer()
                Image("parents")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
                    
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        Label("ชื่อ : ", systemImage: "")
                        Text(firstname)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        Label("นามสกุล : ", systemImage: "")
                        Text(lastname)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        Label("เบอร์โทรศัทพ์ : ", systemImage: "")
                        Text(phone)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                        Label("ที่อยู่ : ", systemImage: "")
                        Text(ParentAddress)
                    }
                    .padding()
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: ParentsEdit(), label: {
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
    }

struct ParentsInfo_Previews: PreviewProvider {
    static var previews: some View {
        ParentsInfo()
    }
}
