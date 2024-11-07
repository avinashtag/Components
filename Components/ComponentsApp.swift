//
//  ComponentsApp.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import SwiftUI
import SwiftData

@main
struct ComponentsApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([ Product.self, ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .modelContainer(sharedModelContainer)
    }
}
