//
//  AreasHeaderView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/7/22.
//

import SwiftUI

struct AreasHeaderView: View {
    var viewModel: AreasHeaderViewModel
    
    var body: some View {
        ZStack {
            Text(viewModel.text)
                .fontWeight(.semibold)
        }
        .frame(
            maxWidth: .infinity,
            idealHeight: 125.0
        )
    }
}

extension AreasHeaderView {
    init(text: String) {
        viewModel = AreasHeaderViewModel(
            text: text
        )
    }
}

struct AreasHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AreasHeaderView(text: "Where are you climbing?")
    }
}
