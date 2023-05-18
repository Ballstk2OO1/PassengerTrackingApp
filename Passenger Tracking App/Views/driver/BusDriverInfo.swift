//
//  BusDriverInfo.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI

struct BusDriverInfo: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
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
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    Label("ทะเบียนรถ : ", systemImage: "")
                    Text(carRegistration)
                }
                .padding()
            }
            .padding()
            
            Spacer()
            
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
}

struct BusDriverInfo_Previews: PreviewProvider {
    static var previews: some View {
        BusDriverInfo()
    }
}

