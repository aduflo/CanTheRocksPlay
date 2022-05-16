//
//  LoadingView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 5/7/22.
//

import SwiftUI

struct LoadingView: View {
    var viewModel: LoadingViewModel

    var body: some View {
        VStack(alignment: .center,
               spacing: 10.0) {
            Image(viewModel.loadingImagePath)
            Text(viewModel.text)
                .fontWeight(.regular)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.purple)
        .foregroundColor(.white)
    }
}

extension LoadingView {
    init(text: String = "Loading...") {
        viewModel = LoadingViewModel(
            text: text
        )
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
