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
        
        Image("school")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        
        VStack (spacing: 10) {
            
            Spacer()
            
            HStack{
                Image(systemName: "building")
                TextField("School", text: $SchoolName)
                
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
                TextField("Contact", text: $phoneNumber)
                
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
        .navigationBarTitle("Edit Profile")
    }
}



struct SchoolInfoEdit_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoEdit()
    }
}
