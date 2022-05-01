//
//  MockAPIClient.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import Foundation
import CTRPCommon

enum MockAPIClientError: Error {
    case failure
}

struct MockAPIClient: APIClienting {
    static func getHealth() async throws -> V1HealthResponse {
        guard let data = getJsonData(resource: "v1HealthResponse"),
              let response = try? JSONDecoder().decode(V1HealthResponse.self, from: data)
        else {
            throw MockAPIClientError.failure
        }

        return response
    }

    static func getAreas() async throws -> AreasResponse {
        guard let data = getJsonData(resource: "v1AreasResponse"),
              let response = try? JSONDecoder().decode(AreasResponse.self, from: data)
        else {
            throw MockAPIClientError.failure
        }

        return response
    }

    static func getArea(id: String) async throws -> AreasByIdResponse {
        guard let data = getJsonData(resource: "v1AreasByIdResponse"),
              let response = try? JSONDecoder().decode(AreasByIdResponse.self, from: data)
        else {
            throw MockAPIClientError.failure
        }

        return response
    }
}

extension MockAPIClient {
    private static func getJsonData(resource: String) -> Data? {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json"),
              let json = try? String(contentsOfFile: path),
              let data = json.data(using: .utf8)
        else {
            return nil
        }

        return data
    }
}
