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
                Text("Fill out personal information")
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
        Studentsearch(name: "Ball", uid: "71:33:6A:5f", phoneNumber: "0xx-123-4567"),
        Studentsearch(name: "Khing", uid: "A:5F:5F:17", phoneNumber: "0xx-456-7890"),
        Studentsearch(name: "Jr", uid: "AA:F8:70:6B", phoneNumber: "0xx-789-0123")
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
                    Text("Not found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Section {
                        List(filteredStudents) { student in
                            VStack(alignment: .leading) {
                                Text("Name: \(student.name)")
                                Text("Contact: \(student.phoneNumber)")
                                Text("RFID: \(student.uid)")
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
                    Text("Add")
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
        .navigationTitle("Add student")
    }
}

struct BusStudentAdd_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentAdd()
    }
}



