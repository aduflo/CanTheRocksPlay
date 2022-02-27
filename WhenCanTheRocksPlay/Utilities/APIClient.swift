//
//  APIClient.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Alamofire
import Foundation

protocol APIClienting {
    ///
    static var host: String { get }
    ///
    static var apiBase: String { get }
    ///
    static var v1Base: String { get }
    ///
    static var accessKey: String { get }
    
    ///
    static func getHealth() async throws -> HealthResponse
    ///
    static func getAreas() async throws -> AreasResponse
    ///
    static func getArea(id: String) async throws -> AreasByIdResponse
}

extension APIClienting {
    static var host: String { "https://whencantherocksplay.herokuapp.com" }
    static var apiBase: String { host + "/api" }
    static var v1Base: String { apiBase + "/v1" }
    static var accessKey: String { ProcessInfo.processInfo.environment["CA_KEY"] ?? "" }
}

struct APIClient: APIClienting {
    static func getHealth() async throws -> HealthResponse {
        let url = v1Base + "/health"
        return try await AF.request(url).asyncResponseDecodable(of: HealthResponse.self)
    }
    
    static func getAreas() async throws -> AreasResponse {
        let url = v1Base + "/areas"
        let headers = HTTPHeaders(["Access-Key": accessKey])
        return try await AF.request(url, headers: headers).asyncResponseDecodable(of: AreasResponse.self)
    }
    
    static func getArea(id: String) async throws -> AreasByIdResponse {
        let url = v1Base + "areas/\(id)"
        return try await AF.request(url).asyncResponseDecodable(of: AreasByIdResponse.self)
    }
}
