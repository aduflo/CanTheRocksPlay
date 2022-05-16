//
//  AreasGridView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/1/22.
//

import SwiftUI

struct AreasGridView: View {
    @ObservedObject var viewModel: AreasGridViewModel

    var gridItems: [GridItem] {
        return Array(repeating: GridItem(.fixed(175.0)), count: 2)
//        return Array(repeating: GridItem(.flexible()), count: 2)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                AreasHeaderView(text: viewModel.headerText)
                if viewModel.areas.count == 0 {
                    LoadingView()
                        .frame(height: 450.0)
                        .cornerRadius(10.0)
                        .padding()
                } else {
                    LazyVGrid(
                        columns: gridItems,
                        alignment: .center,
                        spacing: 10.0) {
                            ForEach(viewModel.areas) { area in
                                AreaGridItemView(area: area) { area in
                                    viewModel.areaTapped(area)
                                }
                            }
                        }
                    Spacer(minLength: 10.0)
                }
            }
        }
    }
}

extension AreasGridView {
    init(areaTapped: @escaping AreasGridViewModel.AreaTappedHandler) {
        viewModel = AreasGridViewModel(
            areaTapped: areaTapped
        )
    }
}

struct AreasGridView_Previews: PreviewProvider {
    static var previews: some View {
        AreasGridView(areaTapped: { _ in })
    }
}
