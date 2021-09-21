//
//  WildSirenApp.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI
import RealmSwift


@main
struct WildSirenApp: SwiftUI.App
{
    let persistence = Persistence.shared

    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(\.realmConfiguration, Realm.Configuration())
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(HomeViewModel())
        }
    }
}
