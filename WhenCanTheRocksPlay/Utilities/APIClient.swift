//
//  APIClient.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Alamofire
import Foundation

protocol APIClienting {
    /// Returns url for host. Default implementation provided.
    static var host: String { get }
    /// Returns  path url terminating with `/api`. Default implementation provided.
    static var apiBase: String { get }
    /// Returns  path url terminating with `/v1`.  Default implementation provided.
    static var v1Base: String { get }
    /// Returns client access key. Default implementation provided.
    static var clientAccessKey: String { get }
    /// Returns default headers. Default implementation provided.
    static var defaultHeaders: HTTPHeaders { get }
    
    /// Returns path url terminating with `endpoint`. Default implementation provided.
    static func url(endpoint: String) -> String
    /// Executes get request for `/health` endpoint.
    static func getHealth() async throws -> HealthResponse
    /// Executes get request for `/areas` endpoint.
    static func getAreas() async throws -> AreasResponse
    /// Executes get request for `/areas/{id}` endpoint.
    static func getArea(id: String) async throws -> AreasByIdResponse
}

extension APIClienting {
    static var host: String { "https://whencantherocksplay.herokuapp.com" }
    static var apiBase: String { host + "/api/" }
    static var v1Base: String { apiBase + "/v1/" }
    static var clientAccessKey: String { ProcessInfo.processInfo.environment["CA_KEY"] ?? "" }
    static var defaultHeaders: HTTPHeaders { .init(["Access-Key": clientAccessKey]) }
    
    static func url(endpoint: String) -> String { v1Base + "/\(endpoint)" }
}

struct APIClient: APIClienting {
    static func getHealth() async throws -> HealthResponse {
        return try await AF.request(url(endpoint: "health")).asyncResponseDecodable(of: HealthResponse.self)
    }
    
    static func getAreas() async throws -> AreasResponse {
        return try await AF.request(url(endpoint: "areas"), headers: defaultHeaders).asyncResponseDecodable(of: AreasResponse.self)
    }
    
    static func getArea(id: String) async throws -> AreasByIdResponse {
        return try await AF.request(url(endpoint: "areas/\(id)"), headers: defaultHeaders).asyncResponseDecodable(of: AreasByIdResponse.self)
    }
}
