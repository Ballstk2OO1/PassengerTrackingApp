//
//  objectDemo.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 18/5/23.
//

import Foundation

class ObjectDemo: Encodable, Decodable {
    var datetime: String
    //var gps: [String]
    var status: Bool
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
