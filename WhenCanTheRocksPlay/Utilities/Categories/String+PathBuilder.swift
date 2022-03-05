//
//  String+PathBuilder.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 2/28/22.
//

import Foundation

extension String {
    func pathed(_ component: String...) -> String { self + (self.last == "/" ? "" : "/") + component.joined(separator: "/") }
}
