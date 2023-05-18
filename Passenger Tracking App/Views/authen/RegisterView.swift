//
//  RegisterView.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 16/2/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct RegisterView: View {
    
    @Binding var currentShowingView: String
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("role") var role: String = ""
    
    @State private var Firstname: String = ""
    @State private var Lastname: String = ""
    @State private var PhoneNumber: String = ""
    @State private var Email: String = ""
    @State private var Password: String = ""
    @State private var ConfirmPassword: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimun 6 character
        // 1 special character
        // 1 uppercase character
        // 1 lowercase character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$_@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    func storeUserData() {
        let db = Firestore.firestore()
        let ref = db.collection("users")
        ref.addDocument(data: [
            "role": "user",
            "id": userID,
            "firstname": Firstname,
            "lastname": Lastname,
            "contact": PhoneNumber,
            "email": Email,
            "password": Password
        ]) { err in
            if let err = err {
                print("error adding document: \(err)")
            } else {
                print("document added with ID: \(ref.collectionID)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Create an account")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                // textfield firstname...
                HStack{
                    Image(systemName: "person.fill")
                    TextField("Firstname", text: $Firstname)
                    
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
                
                // textfield lastname...
                HStack{
                    Image(systemName: "person.fill")
                    TextField("Lastname", text: $Lastname)
                    
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
                
                // textfield phone number...
                HStack{
                    Image(systemName: "phone")
                    TextField("Phone number", text: $PhoneNumber)
                    
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
                
                // textfield email...
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $Email)
                    
                    Spacer()
                    
                    if Email.count > 0 {
                        Image(systemName: Email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(Email.isValidEmail() ? .green : .red)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                // textfield password...
                HStack{
                    Image(systemName: "key")
                    TextField("Password", text: $Password)
                    
                    Spacer()
                    
                    if Password.count > 0 {
                        Image(systemName: isValidPassword(Password) ? "checkmark" : "xmark" )
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(Password) ? .green : .red)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                // textfield confirm password...
                HStack{
                    Image(systemName: "key")
                    TextField("Confirm Password", text: $ConfirmPassword)
                    
                    Spacer()
                    
                    if ConfirmPassword.count > 0 {
                        if (Password == ConfirmPassword) {
                            Image(systemName: "checkmark")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                // Sign up button
                Button {
                    
                    Auth.auth().createUser(withEmail: Email, password: Password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult)
                            role = "user"
                                
                            withAnimation {
                                userID = authResult.user.uid
                            }
                            
                            storeUserData()
                                                        
                        }
                    }
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding()
                }
                
                Spacer()
                Spacer()
                
            }
            .overlay(
                 // switch to Sign up
                 HStack {
                     
                     Text("Already have an account?")
                         .foregroundColor(.gray)
                     
                     Button {
                         withAnimation {
                             self.currentShowingView = "SignIn"
                         }
                     } label: {
                         Text("Sign In")
                     }
                     
                 }
                 ,alignment: .bottom
            )
        }
    }
}
