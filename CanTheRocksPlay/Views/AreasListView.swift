//
//  AreasListView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import SwiftUI

struct AreasListView: View {
    @ObservedObject var viewModel = AreasListViewModel()

    var body: some View {
        ScrollView {
            ForEach(viewModel.areas) { area in
                AreaListItemView(area: area) { area in
                    print("area: \(area.name)")
                }
            }
            .background(Color.cyan)
        }
    }
}

struct AreasListView_Previews: PreviewProvider {
    static var previews: some View {
        AreasListView()
    }
}
