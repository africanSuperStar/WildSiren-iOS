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
                        
                        _HomeViewItem(
                            focused: $_focused,
                            model:   organization
                        ) {
                            HStack
                            {
                                Text("Flamingo Dam")
                                    .font(.title3)
                                    .bold()
                                
                                Spacer()
                                
                                Text("$250")
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        .padding(.horizontal, Swatch.margin)
                        .opacity((!_focused || viewModel.selected.value.license == organization.license) ? 1.0 : 0.0)
                    }
                }
            }
            .animation(.easeInOut)
            .navigationBarHidden(_focused)
            .navigationTitle("Wild Siren")
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
