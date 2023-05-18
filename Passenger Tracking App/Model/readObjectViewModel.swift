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
        ref.child("7A:33:6A:5F").getData(completion:  { error, snapshot in
            guard error == nil else {
              print(error!.localizedDescription)
              return;
            }
            let data = snapshot?.value as! ObjectDemo;
            print(data)
          });
//            .observe(.value) { snapshot in
//                do {
//                    var object = try snapshot.data(as: ObjectDemo.self)
//                } catch {
//                    print("can not convert to ObjectDemo")
//                }
//            }
        
    }
}
