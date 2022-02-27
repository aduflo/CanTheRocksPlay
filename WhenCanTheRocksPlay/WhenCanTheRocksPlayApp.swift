//
//  WhenCanTheRocksPlayApp.swift
//  WhenCanTheRocksPlay
//
//  Created by Adam Duflo on 1/15/22.
//

import SwiftUI

@main
struct WhenCanTheRocksPlayApp: App {
    
    init() {
        Task {
            print("starting task")
            let health = try? await APIClient.getHealth()
            print(health)
            let areas = try? await APIClient.getAreas()
            print(areas)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
