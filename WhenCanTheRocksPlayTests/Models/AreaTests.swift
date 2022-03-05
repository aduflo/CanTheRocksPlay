//
//  AreaTests.swift
//  WhenCanTheRocksPlayTests
//
//  Created by Adam Duflo on 3/5/22.
//

@testable import WhenCanTheRocksPlay
import XCTest

class AreaTests: XCTestCase {
    
    // MARK: init()
    
    func test_init() {
        // Setup
        let id = "id"
        let name = "name"
        let coordinate = Area.Coordinate(latitude: "12.34", longitude: "-12.34")
        let zone = Area.Zone.eastern
        let area = Area(id: id,
                        name: name,
                        coordinate: coordinate,
                        zone: zone)
        
        // Verification
        XCTAssertEqual(area.id, id)
        XCTAssertEqual(area.name, name)
        XCTAssertEqual(area.coordinate, coordinate)
        XCTAssertEqual(area.zone, zone)
    }
}
