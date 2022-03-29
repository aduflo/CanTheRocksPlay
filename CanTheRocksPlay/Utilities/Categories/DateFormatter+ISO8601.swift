//
//  DateFormatter+ISO8601.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 2/25/22.
//

import Foundation

extension DateFormatter {
    static func iso08601() -> DateFormatter {
        let dateFormatter = DateFormatter()
//        ISO8601DateFormatter use this?
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return dateFormatter
    }
}
