//
//  HomeView.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI
import Amplify


struct AdaptiveScrollView <M: AdaptiveScrollItem> : View
{
    @Binding
    internal var selected: M
    
    @State
    private var _models = [M]()
 
    @State
    private var _focused: Bool = false
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            ScrollViewReader
            {
                scrollProxy in
                
                ScrollView
                {
                    VStack
                    {
                        ForEach(_models, id: \.id)
                        {
                            model in
                            
                            let index = Double(_models.firstIndex(of: model) ?? 0)
                            let delay = (index * 0.05) + 0.05
         
                            AdaptiveScrollViewItem <M> (
                                selected:     $selected,
                                focused:      $_focused,
                                model:        model
                            )
                            .id(model.id)
                            .transition(.move(edge: .leading))
                            .animation(.default.delay(delay))
                        }
                    }
                }
                .onChange(of: _focused)
                {
                    _ in
                    
                    if _focused
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                        {
                            withAnimation
                            {
                                scrollProxy.scrollTo($selected.wrappedValue.id, anchor: .top)
                            }
                        }
                    }
                }
                .onAppear
                {
                    queryItems()
                }
            }
            
            HStack
            {
                Spacer()
                
                Button(action:
                {
                    Amplify.DataStore.save(Organization.empty())
                    {
                        result in
                        
                        switch(result)
                        {
                        case .success(let savedItem):

                            guard let _m = savedItem as? M else { return }
                            
                            _models.append(_m)
                            debugPrint("Saved item: \(savedItem.name)")

                        case .failure(let error):

                            debugPrint("Could not save item to DataStore: \(error)")
                        }
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
    
    private func queryItems()
    {
        Amplify.DataStore.query(M.self)
        {
            result in
            
            switch(result)
            {
            case .success(let items):
            
                _models = items
                
            case .failure(let error):
                
                debugPrint("Could not query DataStore: \(error)")
            }
        }
    }
}

struct AdaptiveScrollViewItem <M: AdaptiveScrollItem> : View, Equatable
{
    @Binding
    internal var selected: M
    
    @Binding
    internal var focused: Bool

    internal let model: M
    
    var body: some View
    {
        _AdaptiveScrollViewItem(
            selected: $selected,
            focused:  $focused,
            model:    model
        )
    }
    
    static func == (lhs: AdaptiveScrollViewItem <M>, rhs: AdaptiveScrollViewItem <M>) -> Bool
    {
        return lhs.model.id == rhs.model.id
    }
    
}

struct AdaptiveScrollView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AdaptiveScrollView <Organization> (selected: .constant(Organization.empty()))
    }
}
