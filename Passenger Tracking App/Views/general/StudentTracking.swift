//
//  StudentTracking.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @State private var Latitude: Double = 13.722744
    @State private var Longitude: Double = 100.560694
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Configure the map view
        let coordinate = CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude)
        // let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        // let region = MKCoordinateRegion(center: coordinate, span: span)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 350, longitudinalMeters: 350)
        uiView.setRegion(region, animated: true)
        
        // Add annotations
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Last seen here"
        uiView.addAnnotation(annotation)
    }
}

struct StudentTracking: View {
    
    var username = "นักเรียน1"
    var datetime = Date()
    var status = "on"
    
    var viewModel = ReadViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            MapView()
                .frame(height: 350)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("ชื่อ : " + username)
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    if viewModel.object != nil {
                        Text(viewModel.object!.datetime)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text("viewModel.object!.status")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                HStack {
                    if viewModel.object != nil {
                        Text(String(viewModel.object!.status))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text("viewModel.object!.status")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            
            .padding(50)
            
            Button {
                print("tapped")
                viewModel.readObject()
                print(viewModel.object?.datetime)
            } label: {
                Text("read")
            }
            
            Spacer()
            
            NavigationLink(destination : SchoolBusDriverInfoView() , label: {
                                Text("ข้อมูลรถโดยสาร")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .frame(maxWidth:.infinity)
                                    .frame(alignment: .center)
                                    .background(.black)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0.0, y: 10)
                                    .padding()
                            })
            
        }
        .background(Color.white)
        .navigationBarTitle("การติดตามนักเรียน")
    }
}
    
    func getFormattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
}


struct StudentTracking_Previews: PreviewProvider {
    static var previews: some View {
        StudentTracking()
    }
}
