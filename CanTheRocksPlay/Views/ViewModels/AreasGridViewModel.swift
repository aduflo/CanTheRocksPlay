//
//  AreasGridViewModel.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import Combine
import CTRPCommon
import Foundation

class AreasGridViewModel: ObservableObject {
    @Published var areas: Areas = []

    init() {
        Task {
            guard let areas = await getAreas() else { return }

            DispatchQueue.main.async { [weak self] in
                self?.areas = areas
            }
        }
    }
}

extension AreasGridViewModel {
    func getAreas() async -> Areas? {
        return try? await MockAPIClient.getAreas().areas
    }
}
