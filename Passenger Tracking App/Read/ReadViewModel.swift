//
//  ReadViewModel.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 18/5/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ReadViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var object: ObjectDemo? = nil
    
    @Published
    var listObject = [ObjectDemo]()
    
    func readValue() {
        ref.child("A").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
        }
    }
    
    func observeDataChange() {
        ref.child("A").observe(.value) { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
        }
    }
    
    func readObject() {
        ref.child("A:5F:5F:17").observe(.value) { snapshot in
            do {                
                self.object = try snapshot.data(as: ObjectDemo.self)
            } catch {
                print("can not covert to ObjectDemo")
            }
        }
    }
    
    func observeListObject() {
        ref.observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            self.listObject = children.compactMap({ snapshot in
                return try? snapshot.data(as: ObjectDemo.self)
            })
        }
    }
    
}
