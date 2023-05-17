//
//  LoginView.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 16/2/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var currentShowingView: String
    
    @AppStorage("uid") var userID: String = ""
    
    @State private var Email: String = ""
    @State private var Password: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimun 6 character
        // 1 special character
        // 1 uppercase character
        // 1 lowercase character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$_@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                // textfield email...
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $Email)
                    
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
                
                // textfield password...
                HStack{
                    Image(systemName: "key")
                    SecureField("Password", text: $Password)
                    
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
                
                // Sign in button
                Button {
                    
                    Auth.auth().signIn(withEmail: Email, password: Password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            
                            withAnimation {
                                userID = authResult.user.uid
                            }
                        }
                    }
                    
                } label: {
                    Text("Sign In")
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
                     
                     Text("Don't have an account?")
                         .foregroundColor(.gray)
                     
                     Button {
                         withAnimation {
                             self.currentShowingView = "SignUp"
                         }                         
                     } label: {
                         Text("Sign Up")
                     }
                     
                 }
                 ,alignment: .bottom
            )
        }
    }
}
