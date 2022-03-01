//
//  APIClient.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Alamofire
import Foundation

protocol APIClienting {
    /// Returns path for host. Default implementation provided.
    static var hostPath: String { get }
    /// Returns  path terminating with `/api`. Default implementation provided.
    static var apiPath: String { get }
    /// Returns  path terminating with `/v1`.  Default implementation provided.
    static var v1Path: String { get }
    /// Returns client access key. Default implementation provided.
    static var clientAccessKey: String { get }
    /// Returns default headers. Default implementation provided.
    static var defaultHeaders: HTTPHeaders { get }
    
    /// Executes get request for `/health` endpoint.
    static func getHealth() async throws -> HealthResponse
    /// Executes get request for `/areas` endpoint.
    static func getAreas() async throws -> AreasResponse
    /// Executes get request for `/areas/{id}` endpoint.
    static func getArea(id: String) async throws -> AreasByIdResponse
}

extension APIClienting {
    static var hostPath: String { "https://whencantherocksplay.herokuapp.com" }
    static var apiPath: String { hostPath.pathed("api") }
    static var v1Path: String { apiPath.pathed("v1") }
    static var clientAccessKey: String { ProcessInfo.processInfo.environment["CA_KEY"] ?? "" }
    static var defaultHeaders: HTTPHeaders { .init(["Access-Key": clientAccessKey]) }
}

struct APIClient: APIClienting {
    static func getHealth() async throws -> HealthResponse {
        return try await AF.request(v1Path.pathed("health")).asyncResponseDecodable(of: HealthResponse.self)
    }
    
    static func getAreas() async throws -> AreasResponse {
        return try await AF.request(v1Path.pathed("areas"), headers: defaultHeaders).asyncResponseDecodable(of: AreasResponse.self)
    }
    
    static func getArea(id: String) async throws -> AreasByIdResponse {
        return try await AF.request(v1Path.pathed("areas", id), headers: defaultHeaders).asyncResponseDecodable(of: AreasByIdResponse.self)
    }
}
