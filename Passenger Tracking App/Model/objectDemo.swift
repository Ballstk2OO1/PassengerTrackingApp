//
//  objectDemo.swift
//  Passenger Tracking App
//
//  Created by Thiti Watcharasottikul on 18/5/23.
//

import Foundation

class ObjectDemo: Encodable, Decodable {
    var datetime: String
    var gps: objectGPS
    var status: Bool
}

struct objectGPS: Codable {
    var latitude: String
    var longitude: String
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
