//
//  readObjectViewModel.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 18/5/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class readObjectViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var object: ObjectDemo? = nil
    
    func readObject() {
        ref.child("7A:33:6A:5F")
            .observe(.value) { snapshot in
                print("observe")
                do {
                    print("before create object")
                    var object = try snapshot.data(as: ObjectDemo.self)
                    print("after create")
                } catch {
                    print("can not convert to ObjectDemo")
                }
            }
    }
}
