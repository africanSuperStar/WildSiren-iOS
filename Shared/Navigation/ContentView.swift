//
//  ContentView.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI
import CoreData

import RealmSwift


struct ContentView: View
{
    @EnvironmentObject
    var viewModel: AppViewModel
    
    @EnvironmentObject
    var homeViewModel: HomeViewModel
    
    var body: some View
    {
        HomeView()
            .onAppear
            {
                _onAppear()
            }
    }
    
    private func _onAppear()
    {
        if let realm = viewModel.realm
        {
            homeViewModel.organizations = realm.objects(Organization.self).first ?? Organization()
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView().environment(\.managedObjectContext, Persistence.shared.container.viewContext)
    }
}
