//
//  DateFormatter+ISO8601Tests.swift
//  WhenCanTheRocksPlayTests
//
//  Created by Adam Duflo on 3/5/22.
//

@testable import WhenCanTheRocksPlay
import XCTest

class DateFormatter_ISO8601Tests: XCTestCase {
    
    // MARK: iso08601()
    
    func test_iso08601() {
        // Setup
        let dateFormatter = DateFormatter.iso08601()
        
        // Verification
        XCTAssertEqual(dateFormatter.dateFormat, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZZZZZ")
    }
}
