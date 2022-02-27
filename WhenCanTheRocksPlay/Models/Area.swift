//
//  Area.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Foundation

struct Area: Decodable {
    let id: String
    let name: String
    let coordinate: Coordinate
    let zone: Zone
    
    enum Zone: String, CaseIterable, Decodable {
        case eastern
        case central
        case mountain
        case pacific
    }
    
    init(id: String,
         name: String,
         coordinate: Coordinate,
         zone: Zone) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
        self.zone = zone
    }
    
    struct Coordinate: Decodable {
        let latitude: String
        let longitude: String
    }
}
