//
//  HomeView.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI


struct HomeView : View
{
    @EnvironmentObject
    var viewModel: HomeViewModel
    
    @State
    private var _focused: Bool = false
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                LazyVGrid(columns: columns)
                {
                    ForEach(viewModel.organizations, id: \.self)
                    {
                        organization in
                        
                        let view = HomeViewItem(focused: $_focused, organization: organization)
                        
                        if _focused && organization.license != viewModel.selected.value.license
                        {
                            EmptyView()
                        }
                        else
                        {
                            view
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
            }
            .navigationTitle("Wild Siren")
            .navigationBarHidden(_focused ? true : false)
        }
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

struct HomeViewItem : View
{
    @EnvironmentObject
    var viewModel: HomeViewModel
    
    @Binding
    internal var focused: Bool
    
    let organization: Organization
    
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
