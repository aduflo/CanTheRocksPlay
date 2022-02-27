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
    static var clientAccessKey: String { get }
    ///
    static var headers: HTTPHeaders { get }
    
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
    static var clientAccessKey: String { ProcessInfo.processInfo.environment["CA_KEY"] ?? "" }
    static var headers: HTTPHeaders { HTTPHeaders(["Access-Key": clientAccessKey]) }
}

struct APIClient: APIClienting {
    static func getHealth() async throws -> HealthResponse {
        let url = v1Base + "/health"
        return try await AF.request(url).asyncResponseDecodable(of: HealthResponse.self)
    }
    
    static func getAreas() async throws -> AreasResponse {
        let url = v1Base + "/areas"
        return try await AF.request(url, headers: headers).asyncResponseDecodable(of: AreasResponse.self)
    }
    
    static func getArea(id: String) async throws -> AreasByIdResponse {
        let url = v1Base + "areas/\(id)"
        return try await AF.request(url, headers: headers).asyncResponseDecodable(of: AreasByIdResponse.self)
    }
}
