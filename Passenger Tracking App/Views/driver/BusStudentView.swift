//
//  BusStudentView.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI


struct Student: Identifiable {
    let id = UUID()
    let name: String
    var status: Bool
}

struct BusStudentView: View {
    
    @State private var studentList: [Student] = [
        Student(name: "J", status: true),
        Student(name: "Ball", status: true),
        Student(name: "Kittisak", status: true),
        Student(name: "Thiti", status: true)
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    Section(
                        header: HStack {
                            Text("On the bus")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                                .font(.headline)

                            }
                        
                        ){
                        ForEach(studentList.filter { $0.status }) { student in
                            HStack(spacing: 5) {
                                Text(student.name)
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Spacer()
                                Button(action: {
                                    toggleStatus(for: student)
                                }) {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                    
                    Section(
                        header: Text("Arrived")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .font(.headline)
                            
                    ) {
                        ForEach(studentList.filter { !$0.status }) { student in
                            HStack(spacing: 5) {
                                Text(student.name)
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Spacer()
                                Button(action: {
                                    toggleStatus(for: student)
                                }) {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                .background(Color.white)
                .padding()
                .listStyle(GroupedListStyle())

                
                VStack {
                    NavigationLink(destination: EmptyView()) {
                        Text("Update")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .frame(alignment: .center)
                            .background(Color.black)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                            .padding()
                    }
                }
                .background(Color.white)
            }
            .background(Color.white)
        }
        .background(Color.white)
        .navigationTitle("Student Checking")
        
    }
    
    private func toggleStatus(for student: Student) {
        if let index = studentList.firstIndex(where: { $0.id == student.id }) {
            studentList[index].status.toggle()
        }
    }
}

struct SectionHeaderView: View {
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(color)
                .fontWeight(.bold)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(color)
    }
}

struct BusStudentView_Previews: PreviewProvider {
    static var previews: some View {
        BusStudentView()
    }
}

