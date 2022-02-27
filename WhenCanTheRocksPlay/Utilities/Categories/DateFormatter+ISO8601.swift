//
//  DateFormatter+ISO8601.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/25/22.
//

import Foundation

extension DateFormatter {
    static func iso08601() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return dateFormatter
    }
}
