//
//  APIClienting.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import Alamofire
import Foundation
import CTRPCommon

protocol APIClienting {
    /// Returns path for host. Default implementation provided.
    static var hostPath: String { get }
    /// Returns  path terminating with `/api`. Default implementation provided.
    static var apiPath: String { get }
    /// Returns  path terminating with `/v1`.  Default implementation provided.
    static var v1Path: String { get }
    /// Returns client access key. Default implementation provided.
    static var clientAccessKey: String? { get }
    /// Returns default headers. Default implementation provided.
    static var defaultHeaders: HTTPHeaders { get }

    /// Executes get request for `/health` endpoint.
    static func getHealth() async throws -> V1HealthResponse
    /// Executes get request for `/areas` endpoint.
    static func getAreas() async throws -> AreasResponse
    /// Executes get request for `/areas/{id}` endpoint.
    static func getArea(id: String) async throws -> AreasByIdResponse
}

extension APIClienting {
//    static var hostPath: String { "http://localhost:8080" }
    static var hostPath: String { "https://cantherocksplay.herokuapp.com" }
    static var apiPath: String { hostPath.pathed("api") }
    static var v1Path: String { apiPath.pathed("v1") }
    static var clientAccessKey: String? { ProcessInfo.processInfo.environment["CA_KEY"] }
    static var defaultHeaders: HTTPHeaders {
        guard let clientAccessKey = clientAccessKey else {
            return .init()
        }

        return .init(["Access-Key": clientAccessKey])
    }
}
