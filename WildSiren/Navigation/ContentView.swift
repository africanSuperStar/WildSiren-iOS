//
//  ContentView.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI
import CoreData


struct ContentView : View
{
    @EnvironmentObject
    var app: AppViewModel
    
    @State
    private var selected = Organization.empty()
    
    var body: some View
    {
        OnboardingView()
    }
    
    private func _onAppear()
    {

    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
            .environment(\.managedObjectContext, Persistence.shared.container.viewContext)
    }
}
