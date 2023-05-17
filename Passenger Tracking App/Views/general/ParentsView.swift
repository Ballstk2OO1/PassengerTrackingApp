//
//  StudentView.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI

struct ParentsView: View {
    
    let Studentmember : [String] = ["1"]
    @State var changePage : Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Image("parents")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity)
                
                VStack{
                    
                    ForEach(0..<Studentmember.count){ i in
                        
                        NavigationLink(destination : ParentsStudentView(), label: {
                            Text("นักเรียนคนที่ \(Studentmember[i])")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    
                    VStack {
                        
                        NavigationLink(destination : StudentSchoolInfo() , label: {
                            Text("ติดต่อโรงเรียน")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                        
                    VStack {
                        
                        NavigationLink(destination : StudentAdd() , label: {
                            Text("เพิ่มจำนวนนักเรียน")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.black)
                                .cornerRadius(15)
                                .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                    
                    VStack {
                        
                        Button(action:
                                {
                            
                        }, label: {
                            Text("ออกจากระบบ")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .frame(alignment: .center)
                                .background(.red)
                                .cornerRadius(15)
                                .shadow(color: Color.red.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                .padding()
                        })
                        
                    }
                }
                .padding()
            }
            .frame(alignment: .center)
        }
    }
}

struct ParentsView_Previews: PreviewProvider {
    static var previews: some View {
        ParentsView()
    }
}
