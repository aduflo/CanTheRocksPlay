//
//  AreaGridItemView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import CTRPCommon
import MapKit
import SwiftUI

struct AreaGridItemView: View {
    var viewModel: AreaGridItemViewModel
    var body: some View {
        VStack {
            Text(viewModel.displayName)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            Spacer()
            Map(coordinateRegion: .constant(viewModel.coordinateRegion))
                .allowsHitTesting(false)
                .frame(height: 90.0)
                .cornerRadius(10.0)
        }
        .frame(
            width: 140.0,
            height: 150.0
        )
        .padding()
        .background(Color.purple)
        .cornerRadius(10.0)
        .onTapGesture {
            viewModel.onTap(viewModel.area)
        }
    }

    init(area: Area,
         onTap: @escaping AreaGridItemViewModel.OnTapHandler) {
        self.viewModel = AreaGridItemViewModel(
            area: area,
            onTap: onTap
        )
    }
}

struct AreaGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            AreaGridItemView(
                area: Area(
                    id: .init(),
                    name: "Red Rock",
                    coordinate: Coordinate(
                        latitude: "36.19460910534966",
                        longitude: "-115.43825378678054"
                    ),
                    zone: .pacific
                ),
                onTap: { _ in }
            )
            AreaGridItemView(
                area: Area(
                    id: .init(),
                    name: "Stone Fort (Little Rock City)",
                    coordinate: Coordinate(
                        latitude: "35.248204395457876",
                        longitude: "-85.22003396961017"
                    ),
                    zone: .pacific
                ),
                onTap: { _ in }
            )
        }
    }
}
