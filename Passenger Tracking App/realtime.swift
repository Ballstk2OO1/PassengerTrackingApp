import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

struct realtime: View {
    @State var data: [String: Any] = [:]
    
    var body: some View {
        VStack {
            Text("Device ID: \(data["deviceID"] as? String ?? "")")
                .font(.headline)
            Text("Datetime: \(nestedValue(forKey: ["datetime"], in: data) as? String ?? "")")
            Text("Status: \(nestedValue(forKey: ["status"], in: data) as? Bool ?? false ? "Active" : "Inactive")")
            Text("Latitude: \(nestedValue(forKey: ["gps", "latitude"], in: data) as? String ?? "")")
            Text("Longitude: \(nestedValue(forKey: ["gps", "longitude"], in: data) as? String ?? "")")
        }
        .padding()
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        let databaseURL = URL(string: "https://passenger-tracking-app-default-rtdb.asia-southeast1.firebasedatabase.app/")!
        let ref = Database.database(url: databaseURL.absoluteString).reference()
        let childPath = "7A:33:6A:5F" // Replace with the actual child node key

        ref.child(childPath).observeSingleEvent(of: .value) { snapshot in
            guard let data = snapshot.value as? [String: Any] else {
                print("Invalid data format")
                return
            }
            
            self.data = data
            
            // Send data to Firestore
            sendToFirestore(data)
        }
    }
    
    func sendToFirestore(_ data: [String: Any]) {
        let db = Firestore.firestore()
        let collection = db.collection("realtime") // Replace with your collection name
        
        collection.addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
    
    func nestedValue(forKey keyPath: [String], in dictionary: [String: Any]) -> Any? {
        var value: Any? = dictionary
        
        for key in keyPath {
            value = (value as? [String: Any])?[key]
        }
        
        return value
    }
}

struct realtime_Previews: PreviewProvider {
    static var previews: some View {
        realtime()
    }
}
