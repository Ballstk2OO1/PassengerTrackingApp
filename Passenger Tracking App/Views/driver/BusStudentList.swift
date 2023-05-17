//
//  BusStudentList.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct BusStudentList: View {
    @State private var studentList: [studentlist] = [
        studentlist(name: "A", phoneNumber: "0222222222", uid: "123"),
        studentlist(name: "B", phoneNumber: "0111111111", uid: "456")
    ]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(studentList) { student in
                        VStack(alignment: .leading, spacing: 10) {
                            Row1(label: "ชื่อ", value: student.name)
                            Row1(label: "เบอร์โทรศัพท์", value: student.phoneNumber)
                            Row1(label: "UID", value: student.uid)
                        }
                        .background(Color.white)
                        .padding(.horizontal)
                    }
                    .onDelete(perform: deleteStudent)
                }
                .padding(.vertical)
                .background(Color.white)
                
                Spacer()
                
                NavigationLink(destination: BusStudentAdd(), label: {
                    Text("เพิ่มนักเรียน")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding()
                })
            }
        }
        .navigationBarTitle("รายชื่อนักเรียน")
    }

    func deleteStudent(at offsets: IndexSet) {
        studentList.remove(atOffsets: offsets)
    }
}




struct Row1: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct studentlist: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var uid: String
//    var studentID: String
//    var studentClass: String
}

struct BusStudentList_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentList()
    }
}
