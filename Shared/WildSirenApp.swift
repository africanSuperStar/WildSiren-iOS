//
//  WildSirenApp.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI

@main
struct WildSirenApp: App
{
    let persistence = Persistence.shared

    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(HomeViewModel())
        }
    }
}
