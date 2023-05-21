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
        
        Image("school")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        
        VStack(alignment: .leading,spacing: 20) {
            
            Spacer()
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.black)
                Label("School: ", systemImage: "")
                Text(schoolname)
            }
            .padding()
            
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.black)
                Label("Contact: ", systemImage: "")
                Text(phoneNumber)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: SchoolInfoEdit(), label: {
                Text("Edit Profile")
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
        .navigationBarTitle("Profile")
    }
}

struct SchoolInfo_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfo()
    }
}
