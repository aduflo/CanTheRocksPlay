//
//  HTTPHeaders+Testable.swift
//  CanTheRocksPlayTests
//
//  Created by Adam Duflo on 3/5/22.
//

import Alamofire

extension HTTPHeaders: Equatable {
    public static func == (lhs: HTTPHeaders, rhs: HTTPHeaders) -> Bool { lhs.dictionary == rhs.dictionary }
}
