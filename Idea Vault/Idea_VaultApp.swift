//
//  Idea_VaultApp.swift
//  Idea Vault
//
//  Created by John Walbran on 9/12/25.
//

import SwiftUI
import SwiftData

@main
struct Idea_VaultApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Project.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
