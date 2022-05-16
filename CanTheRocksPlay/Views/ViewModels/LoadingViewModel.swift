//
//  LoadingViewModel.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/7/22.
//

import Foundation

struct LoadingViewModel {
    let text: String

    init(text: String) {
        self.text = text
    }
}

extension LoadingViewModel {
    var loadingImagePath: String { "cloud.sun.fill" }
}
