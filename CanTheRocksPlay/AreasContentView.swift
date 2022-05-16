//
//  ContentView.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 1/15/22.
//

import SwiftUI

struct AreasContentView: View {
    var body: some View {
        AreasGridView { area in
            Task {
                let areaInfo = try? await APIClient.getArea(id: area.id)
                print("areaInfo: \(String(describing: areaInfo))")
            }
        }
    }
}

struct AreasContentView_Previews: PreviewProvider {
    static var previews: some View {
        AreasContentView()
    }
}
