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
    
    func readObject() {
        ref.child("A:5F:5F:17")
            .observe(.value) { snapshot in
                do {
                    self.object = try snapshot.data(as: ObjectDemo.self)
                } catch {
                    print("can not covert to ObjectDemo")
                }
            }
    }
    
}
