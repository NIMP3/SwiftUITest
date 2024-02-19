//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Edwin Yovany on 9/12/23.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkComands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
