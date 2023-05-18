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
            

            .navigationBarTitle("ข้อมูลผู้ขับรถโดยสาร")
        }
    }
}

struct SchoolBusDriverInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolBusDriverInfoView()
    }
}
