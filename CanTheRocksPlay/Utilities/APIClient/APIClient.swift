//
//  APIClient.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Alamofire
import Foundation
import CTRPCommon

struct APIClient: APIClienting {
    static func getHealth() async throws -> V1HealthResponse {
        return try await AF.request(v1Path.pathed("health")).asyncResponseDecodable(of: V1HealthResponse.self)
    }
    
    static func getAreas() async throws -> AreasResponse {
        return try await AF.request(v1Path.pathed("areas"), headers: defaultHeaders).asyncResponseDecodable(of: AreasResponse.self)
    }
    
    static func getArea(id: String) async throws -> AreasByIdResponse {
        return try await AF.request(v1Path.pathed("areas", id), headers: defaultHeaders).asyncResponseDecodable(of: AreasByIdResponse.self)
    }
}
