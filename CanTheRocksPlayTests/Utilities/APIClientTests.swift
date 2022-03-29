//
//  APIClientTests.swift
//  CanTheRocksPlayTests
//
//  Created by Adam Duflo on 3/5/22.
//

import Alamofire
@testable import CanTheRocksPlay
import XCTest

class APIClientTests: XCTestCase {
    
    // MARK: Constants
    
    func test_hostPath() {
        // Verification
        XCTAssertEqual(APIClient.hostPath, "https://cantherocksplay.herokuapp.com")
    }
    
    func test_apiPath() {
        // Verification
        XCTAssertEqual(APIClient.apiPath, "https://cantherocksplay.herokuapp.com/api")
    }
    
    func test_v1Path() {
        // Verification
        XCTAssertEqual(APIClient.v1Path, "https://cantherocksplay.herokuapp.com/api/v1")
    }
    
    func test_clientAccessKey() {
        // Setup
        let clientAccessKey = APIClient.clientAccessKey
        
        // Verification
        XCTAssertNotNil(clientAccessKey)
        XCTAssertEqual(clientAccessKey?.count, 55)
    }
    
    func test_defaultHeaders() {
        // Setup
        let defaultHeaders = APIClient.defaultHeaders
        
        // Verification
        XCTAssertTrue(defaultHeaders.dictionary.keys.contains("Access-Key"))
        XCTAssertEqual(defaultHeaders.dictionary["Access-Key"], APIClient.clientAccessKey)
    }
}
