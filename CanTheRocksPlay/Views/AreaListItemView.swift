//
//  AreaListItemView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import CTRPCommon
import MapKit
import SwiftUI

struct AreaListItemView: View {
    var viewModel: AreaListItemViewModel
    var body: some View {
        HStack() {
            Map(coordinateRegion: .constant(viewModel.coordinateRegion))
                .allowsHitTesting(false)
                .frame(
                    width: viewModel.dimension * 2,
                    height: viewModel.dimension
                )
                .cornerRadius(10.0)
            Spacer()
            Text(viewModel.displayName)
                .background(Color.red)
        }
        .frame(height: viewModel.dimension)
        .padding()
        .background(Color.green)
        .onTapGesture {
            viewModel.onTap(viewModel.area)
        }
    }

    init(area: Area,
         onTap: @escaping AreaListItemViewModel.OnTapHandler) {
        self.viewModel = AreaListItemViewModel(
            area: area,
            onTap: onTap
        )
    }
}

struct AreaListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AreaListItemView(
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
    }
}
