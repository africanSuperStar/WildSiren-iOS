//
//  WildSirenApp.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI

import Amplify
import AWSDataStorePlugin


@main
struct WildSirenApp: SwiftUI.App
{
    let persistence = Persistence.shared

    let viewModel = AppViewModel()
    
    public init()
    {
        configureAmplify()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(viewModel)
        }
    }
    
    private func configureAmplify()
    {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        
        do
        {            
            Amplify.Logging.logLevel = .info

            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            
            debugPrint("Initialized Amplify...")
        }
        catch
        {
            debugPrint("Could not initialize Amplify: \(error)")
        }
    }
}
