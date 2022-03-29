//
//  CanTheRocksPlayApp.swift
//  CanTheRocksPlay
//
//  Created by Adam Duflo on 1/15/22.
//

import SwiftUI

@main
struct CanTheRocksPlayApp: App {
    
    init() {
        Task {
            print("starting task")
            let health = try? await APIClient.getHealth()
            print(health)
            let areas = try? await APIClient.getAreas()
            print(areas)
            let areasById = try? await APIClient.getArea(id: "1")
            print(areasById)
        }
    }
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("became active")
            case .inactive:
                print("became inactive")
            case .background:
                print("entered background")
            @unknown default:
                print("oh.. what's this?")
            }
        }
    }
}
