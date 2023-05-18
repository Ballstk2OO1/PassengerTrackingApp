//
//  StudentSchoolInfo.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct StudentSchoolInfo: View {
    
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
                Text("ชื่อ: " + schoolname)
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                Text("เบอร์โทรศัพท์: " + phoneNumber)
            }
            .padding()
            
            Spacer()
            

        }
        .padding()
        .navigationBarTitle("ข้อมูลโรงเรียน")
    }


    
    struct StudentSchoolInfo_Previews: PreviewProvider {
        static var previews: some View {
            StudentSchoolInfo()
        }
    }
}
