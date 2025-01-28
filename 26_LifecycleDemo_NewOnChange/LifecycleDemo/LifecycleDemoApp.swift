//
//  LifecycleDemoApp.swift
//  LifecycleDemo
//
//  Created by Clark Song on 1/18/25.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .onChange(of: scenePhase) { oldPhase, newPhase in // Updated syntax
//                    switch newPhase {
//                        case .active:
//                            print("Active")
//                        case .inactive:
//                            print("Inactive")
//                        case .background:
//                            print("Background")
//                        default:
//                            print("Unknown scenephase")
//                    }
//                }
        }
        // 26.5 윈도우 그룹 대신 ContentView()에 ScenePhase 적용
        .onChange(of: scenePhase) { oldPhase, newPhase in // Updated syntax
            switch newPhase {
                case .active:
                    print("Active")
                case .inactive:
                    print("Inactive")
                case .background:
                    print("Background")
                default:
                    print("Unknown scenephase")
            }
        }
    }
}
