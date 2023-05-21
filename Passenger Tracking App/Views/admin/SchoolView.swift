//
//  ContentView.swift
//  passenger
//
//  Created by YZR-M1 on 6/2/2566 BE.
//

import SwiftUI
import FirebaseAuth

struct SchoolView: View {
    
    @AppStorage("uid") var userID: String = ""
    @AppStorage("role") var role: String = ""
    
    let BusNumber:[String] = ["1","2"]
    
    var body: some View {
        NavigationStack {
                
                VStack {
                                        
                    Image("school")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                    
                    ScrollView {
                        
                        VStack {
                            
                            ForEach(0..<BusNumber.count){ i in
                                
                                NavigationLink(destination : SchoolBusView(), label: {
                                    Text("Bus \(BusNumber[i])")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .frame(height: 50)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 25)
                                        .background(.white)
                                        .cornerRadius(15)
                                        .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                        .padding()
                                })
                            }
                        }
                        
                        VStack {
                            
                            NavigationLink(destination : SchoolInfo(), label: {
                                Text("Profile")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 25)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                    .padding()
                            })
                            
                        }
                        
                        VStack {
                            
                            Button(action: {
                                let firebaseAuth = Auth.auth()
                                do {
                                    try firebaseAuth.signOut()
                                    withAnimation {
                                        userID = ""
                                        role = ""
                                    }
                                } catch let sighOutError as NSError {
                                    print("Error signing out: %@", sighOutError)
                                }
                            }, label: {
                                Text("Sign out")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 25)
                                    .background(.red)
                                    .cornerRadius(15)
                                    .shadow(color: Color.red.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                    .padding()
                            })
                            
                        }
                        
                    }
                    
                }
                .frame(alignment: .center)
            }
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView()
    }
}
