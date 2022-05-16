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
    @Published var didEncounterError: Bool = false

    typealias AreaTappedHandler = (Area) -> ()
    let areaTapped: AreaTappedHandler
    lazy var handledError: () -> () = { [weak self] in
        self?.didEncounterError = false
    }

    init(areaTapped: @escaping AreaTappedHandler) {
        self.areaTapped = areaTapped

        Task {
            guard let areas = await getAreas() else { return }

            DispatchQueue.main.async { [weak self] in
                self?.areas = areas
            }
        }
    }
}

extension AreasGridViewModel {
//    var navigationTitle: String { "Climbing Areas" }

    var headerText: String { "Where are you climbing?" }

    func getAreas() async -> Areas? {
        guard let message = try? await APIClient.getHealth().message, message == "The rocks can play :)" else {
            didEncounterError = true
            return nil
        }

        sleep(3)
        return try? await APIClient.getAreas().areas
    }
}
