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
//        Task {
//            print("starting task")
//            print("\n")
//            let health = try? await MockAPIClient.getHealth()
//            print("health: \(health)")
//            print("\n")
//            let areas = try? await MockAPIClient.getAreas()
//            print("areas: \(areas)")
//            print("\n")
//            let areasById = try? await MockAPIClient.getArea(id: "")
//            print("areasById: \(areasById)")
//            print("\n")
//        }
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
