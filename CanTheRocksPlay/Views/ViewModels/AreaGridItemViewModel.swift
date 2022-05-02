//
//  AreaGridItemViewModel.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import CTRPCommon
import Foundation
import MapKit

struct AreaGridItemViewModel {
    let area: Area
    typealias OnTapHandler = (Area) -> ()
    let onTap: OnTapHandler

    init(area: Area,
         onTap: @escaping OnTapHandler) {
        self.area = area
        self.onTap = onTap
    }
}

extension AreaGridItemViewModel {
    var displayName: String { area.name }

    var coordinateRegion: MKCoordinateRegion {
        let latitude = Double(area.coordinate.latitude) ?? .zero
        let longitude = Double(area.coordinate.longitude) ?? .zero
        let coordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        let span = MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
        )
        return MKCoordinateRegion(
            center: coordinate,
            span: span
        )
    }
}
