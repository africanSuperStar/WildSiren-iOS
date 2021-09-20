//
//  HomeViewItem.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/20.
//

import SwiftUI

struct _HomeViewItem <Content: View> : View
{
    @EnvironmentObject
    var viewModel: HomeViewModel
    
    @Binding
    internal var focused: Bool
    
    let model: Organization
    
    @ViewBuilder
    let content: Content
    
    @State
    private var _cellHeight: CGFloat = 180
    
    var body: some View
    {
        VStack(
            alignment: .center,
            spacing: Swatch.tinyMargin
        ) {
            Image(model.profile ?? "", bundle: .main)
                .resizable()
                .scaledToFill()
                .frame(height: _cellHeight)
                .clipped()
                .cornerRadius(40.0)
                .onTapGesture
                {
                    viewModel.selected.send(model)
                    
                    moveToOrigin(model)
                    
                    if focused
                    {
                        withAnimation(.easeInOut(duration: 0.35))
                        {
                            _cellHeight = 180
                            focused.toggle()
                        }
                    }
                    else
                    {
                        withAnimation(.easeInOut(duration: 0.35))
                        {
                                _cellHeight = 400
                                focused.toggle()
                        }
                    }
                }
            
            if focused
            {
                self.content
            }
            else
            {
                self.content.hidden()
            }
        }
        .cornerRadius(Swatch.cornerRadius)
    }
    
    private func moveToOrigin(_ from: Organization)
    {
        if let index = viewModel.organizations.firstIndex(where: { $0.license == from.license })
        {
            viewModel.organizations.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
        }
    }
}

struct HomeViewItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        _HomeViewItem(
            focused: .constant(false),
            model: Organization.empty()
        ) {
            Text("Mount Chilkoloo")
        }
    }
}
