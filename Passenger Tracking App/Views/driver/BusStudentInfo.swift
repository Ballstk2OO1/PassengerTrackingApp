//
//  BusStudentInfo.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct BusStudentInfo: View {
    @State private var students: [StudentInfo] = []
    @State private var newStudent: StudentInfo = StudentInfo()
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(students) { student in
                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(label: "Name", value: student.name)
                    InfoRow(label: "Grade", value: student.grade)
                    InfoRow(label: "Phone Number", value: student.phoneNumber)
                    InfoRow(label: "Student ID", value: student.studentID)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                TextField("Name", text: $newStudent.name)
                TextField("Grade", text: $newStudent.grade)
                TextField("Phone Number", text: $newStudent.phoneNumber)
                TextField("Student ID", text: $newStudent.studentID)
            }
            .padding()
            
            Button(action: {
                students.append(newStudent)
                newStudent = StudentInfo()
            }) {
                Text("Add Student")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding()
            }
        }
        .padding()
        .navigationBarTitle("Student Information")
    }
}

struct InfoRow: View {
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
                .foregroundColor(.gray)
        }
    }
}

struct StudentInfo: Identifiable {
    let id = UUID()
    var name: String = ""
    var grade: String = ""
    var phoneNumber: String = ""
    var studentID: String = ""
}

struct BusStudentInfo_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentInfo()
    }
}
