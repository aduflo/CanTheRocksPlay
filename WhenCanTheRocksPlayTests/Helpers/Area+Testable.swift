//
//  Area+Testable.swift
//  WhenCanTheRocksPlayTests
//
//  Created by Adam Duflo on 3/5/22.
//

@testable import WhenCanTheRocksPlay

extension Area.Coordinate: Equatable {
    public static func == (lhs: Area.Coordinate, rhs: Area.Coordinate) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
