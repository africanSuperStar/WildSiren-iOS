//
//  WildSirenApp.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI

@main
struct WildSirenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
