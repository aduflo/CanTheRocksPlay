//
//  DataRequest+Async.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 2/27/22.
//

import Alamofire
import Foundation

extension DataRequest {
    
    @discardableResult
    func asyncResponseDecodable<T: Decodable>(of type: T.Type = T.self,
                                              queue: DispatchQueue = .main,
                                              dataPreprocessor: DataPreprocessor = DecodableResponseSerializer<T>.defaultDataPreprocessor,
                                              decoder: DataDecoder = JSONDecoder(),
                                              emptyResponseCodes: Set<Int> = DecodableResponseSerializer<T>.defaultEmptyResponseCodes,
                                              emptyRequestMethods: Set<HTTPMethod> = DecodableResponseSerializer<T>.defaultEmptyRequestMethods) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            responseDecodable(of: type,
                              queue: queue,
                              dataPreprocessor: dataPreprocessor,
                              decoder: decoder,
                              emptyResponseCodes: emptyResponseCodes,
                              emptyRequestMethods: emptyRequestMethods) { response in
                switch response.result {
                case .success(let decodable):
                    continuation.resume(returning: decodable)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
