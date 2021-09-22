//
//  HomeView.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI
import RealmSwift


struct HomeView : View
{
    @EnvironmentObject
    var app: AppViewModel

    @EnvironmentObject
    var viewModel: HomeViewModel
    
    @State
    private var _focused: Bool = false
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            NavigationView
            {
                ScrollViewReader
                {
                    scrollProxy in
                    
                    ScrollView
                    {
                        VStack
                        {
                            ForEach(items, id: \.self)
                            {
                                organization in
                                
                                let index = Double(items.firstIndex(of: organization) ?? 0)
                                let delay = (index * 0.05) + 0.05
             
                                if _focused && (organization.license != viewModel.selected.value.license)
                                {
                                    EmptyView()
                                        .id(organization.license)
                                        .transition(.move(edge: .trailing))
                                        .animation(.default.delay(delay))
                                }
                                else
                                {
                                    HomeViewItem(focused: $_focused, organization: organization)
                                        .id(organization.license)
                                        .transition(.move(edge: .leading))
                                        .animation(.default.delay(delay))
                                }
                            }
                        }
                    }
                    .onChange(of: _focused)
                    {
                        _ in
                        
                        if !_focused
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8)
                            {
                                withAnimation
                                {
                                    scrollProxy.scrollTo(viewModel.selected.value.license, anchor: .bottom)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Wild Siren")
                .navigationBarHidden(_focused ? true : false)
            }
            
            HStack
            {
                Spacer()
                
                Button(action:
                {
                    viewModel.organizations.items.append(OrganizationItem.empty())
                    
                    if let realm = app.realm
                    {
                        try? realm.write
                        {
                            realm.add(OrganizationItem.empty())
                        }
                        
                        app.realm = realm
                    }
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                        .padding(Swatch.smallMargin)
                        .background(
                            Circle()
                                .foregroundColor(Color.blue)
                        )
                        .padding()
                }
            }
        }
    }
    
    var items: Array <OrganizationItem>
    {
        if let realm = app.realm
        {
            let results = realm.objects(OrganizationItem.self)
            
            viewModel.organizations.items.append(objectsIn: results)
            
            return Array(results)
        }
        
        return []
    }
}

struct HomeViewItem : View
{
    @EnvironmentObject
    var viewModel: HomeViewModel
    
    @Binding
    internal var focused: Bool
    
    let organization: OrganizationItem
    
    var body: some View
    {
        _HomeViewItem(
            focused: $focused,
            model:   organization
        ) {
            
        }
        .padding(.horizontal, Swatch.margin)
        .opacity((!focused || viewModel.selected.value.license == organization.license) ? 1.0 : 0.0)
    }
}
