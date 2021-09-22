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

    let app: RealmSwift.App = RealmSwift.App(id: "wild-siren-krjle")
    
    let viewModel = AppViewModel()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(viewModel)
                .environmentObject(HomeViewModel())
                .onAppear
                {
                    DispatchQueue.main.async
                    {
                        anonymousLogin()
                    }
                }
        }
    }
    
    private func anonymousLogin()
    {
        let anonymousCredentials = Credentials.anonymous
        
        app.login(credentials: anonymousCredentials)
        {
            result in
            
            switch result
            {
            case .failure(let error):
            
                debugPrint("Login failed: \(error.localizedDescription)")
            
            case .success(let user):
            
                debugPrint("Successfully logged in as user \(user)")
                
                onLogin()
            }
        }
    }
    
    private func onLogin()
    {
        let user = app.currentUser
        
        guard let _userId = user?.id
            else
        {
            debugPrint("No Realm User Found.")
            return
        }
        
        guard let configuration = user?.configuration(partitionValue: _userId)
            else
        {
            debugPrint("Failed to configure Realm.")
            return
        }
        
        // Delete Files when Client Synchronization is stuck
        _ = try? Realm.deleteFiles(for: configuration)
        
        Realm.asyncOpen(configuration: configuration)
        {
            result in
            
            switch result
            {
            case .failure(let error):
            
                debugPrint("Failed to open realm: \(error.localizedDescription)")
                
            case .success(let realm):
                
                debugPrint("Successfully opened realm: \(realm)")
                
                viewModel.realm = realm
            }
        }
    }
}
