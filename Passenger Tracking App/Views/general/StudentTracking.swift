//
//  StudentTracking.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import MapKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

struct MapView: UIViewRepresentable {
    var latitude: Double
    var longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Configure the map view
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 350, longitudinalMeters: 350)
        uiView.setRegion(region, animated: true)
        
        // Add annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Last seen here"
        uiView.addAnnotation(annotation)
    }
}

struct StudentTracking: View {
    
    @State private var data: [String: Any] = [:]
    @State private var datetime: String = ""
    @State private var latitude: Double = 0.0
    @State private var longitude: Double = 0.0
    @State var username = "นักเรียน1"
        
    @AppStorage("rfid") var RFID: String = ""
    
    let db = Firestore.firestore()

    func getUserRoleByID(id: String) {
        let collectionRef = db.collection("students")
        collectionRef.whereField("RFID", isEqualTo: id).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error searching for documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            for document in documents {
                let data = document.data()
                // Do something with the data
                print(data["firstName"] as! String)
                username = data["firstName"] as! String
            }            
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            MapView(latitude: latitude, longitude: longitude)
                .frame(height: 350)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("ชื่อ : " + username)
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Text("วันที่ : " + datetime)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    if let status = data["status"] as? Bool {
                        Text(status ? "Active" : "Inactive")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text("Status Unavailable")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(50)
            
            Spacer()
        }
        .background(Color.white)
        .navigationBarTitle("การติดตามนักเรียน")
        .onAppear {
            getUserRoleByID(id: RFID)
            fetchData()
        }
    }

    func fetchData() {
        let databaseURL = URL(string: "https://passenger-tracking-app-default-rtdb.asia-southeast1.firebasedatabase.app/")!
        let ref = Database.database(url: databaseURL.absoluteString).reference()
        let childPath = "/7A:33:6A:5F"
        
        ref.child(childPath).observeSingleEvent(of: .value, with: { snapshot in
            guard let data = snapshot.value as? [String: Any] else {
                print("Invalid data format")
                return
            }
            
            self.data = data
            self.datetime = data["datetime"] as? String ?? ""
            
            if let gps = data["gps"] as? [String: Any],
               let latitudeString = gps["latitude"] as? String,
               let longitudeString = gps["longitude"] as? String,
               let latitude = Double(latitudeString),
               let longitude = Double(longitudeString) {
                self.latitude = latitude
                self.longitude = longitude
            }
        }) { error in
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}

struct StudentTracking_Previews: PreviewProvider {
    static var previews: some View {
        StudentTracking()
    }
}

