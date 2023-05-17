//
//  SchoolStudentlist.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct SchoolStudentlist: View {
    @State private var studentList: [studentinfo] = [
        studentinfo(name: "A", phoneNumber: "0222222222", uid: "123"),
        studentinfo(name: "B", phoneNumber: "0111111111", uid: "456")
    ]

    var body: some View {
        List(studentList) { students in
            VStack(alignment: .leading, spacing: 10) {
                Row(label: "ชื่อ", value: students.name)
                Row(label: "เบอร์โทรศัพท์", value: students.phoneNumber)
                Row(label: "UID", value: students.uid)
//                Row(label: "Student ID", value: students.studentID)
//                Row(label: "Class", value: students.studentClass)
            }
            .background(Color.white)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.white)
        .navigationBarTitle("ข้อมูลนักเรียน")
    }
}


struct Row: View {
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

struct studentinfo: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var uid: String
//    var studentID: String
//    var studentClass: String
}

struct SchoolStudentlist_Previews: PreviewProvider {
    static var previews: some View {
        SchoolStudentlist()
    }
}
