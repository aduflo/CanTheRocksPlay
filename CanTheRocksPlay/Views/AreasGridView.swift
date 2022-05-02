//
//  AreasGridView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import SwiftUI

struct AreasGridView: View {
    @ObservedObject var viewModel = AreasGridViewModel()

    var gridItems: [GridItem] {
        return [GridItem(.fixed(175.0))]
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHGrid(rows: gridItems,
                      alignment: .center,
                      spacing: 10.0) {
                ForEach(viewModel.areas) { area in
                    AreaGridItemView(area: area) { area in
                        print("area: \(area.name)")
                    }
                }
            }
        }
    }
}

struct AreasGridView_Previews: PreviewProvider {
    static var previews: some View {
        AreasGridView()
    }
}
