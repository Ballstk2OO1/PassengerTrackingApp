//
//  BusStudentAdd.swift
//  passenger
//
//  Created by YZR-M1 on 17/5/2566 BE.
//

import SwiftUI

struct Studentsearch: Identifiable {
    let id = UUID()
    let name: String
    let uid: String
    let phoneNumber: String
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal)

            if searchText.isEmpty {
                Text("กรอกข้อมูล (ชื่อ, เบอร์โทรศัพท์, UID)")
                    .foregroundColor(.gray)
                    .padding()
            }

        }
    }
}

struct BusStudentAdd: View {
    @State private var searchText = ""
    @State private var selectedStudent: Studentsearch? = nil

    let students = [
        Studentsearch(name: "A", uid: "123", phoneNumber: "555-1234"),
        Studentsearch(name: "B", uid: "456", phoneNumber: "555-5678"),
        Studentsearch(name: "C", uid: "789", phoneNumber: "555-9012")
    ]

    var filteredStudents: [Studentsearch] {
        if searchText.isEmpty {
            return students
        } else {
            return students.filter { student in
                student.name.localizedCaseInsensitiveContains(searchText) ||
                    student.uid.localizedCaseInsensitiveContains(searchText) ||
                    student.phoneNumber.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)

                if !searchText.isEmpty && filteredStudents.isEmpty {
                    Text("ไม่พบข้อมูล")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Section {
                        List(filteredStudents) { student in
                            VStack(alignment: .leading) {
                                Text("ชื่อ : \(student.name)")
                                Text("เบอร์โทรศัพท์ : \(student.phoneNumber)")
                                Text("UID : \(student.uid)")
                            }
                            .onTapGesture {
                                selectedStudent = student
                                searchText = student.uid
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                        .ignoresSafeArea()
                    }
                }
                Spacer()
                Button(action: {
                    // Perform action when the "Add" button is tapped
                    // You can add your desired functionality here
                }) {
                    Text("เพิ่ม")
                        .foregroundColor(.white)
                        .frame(height: 20)
                        .frame(maxWidth: 300)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                }
            }
            .padding(10)
        }
        .navigationTitle("เพิ่มนักเรียน")
    }
}

struct BusStudentAdd_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentAdd()
    }
}



