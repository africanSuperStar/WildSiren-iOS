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
    
    let model: OrganizationItem
    
    @ViewBuilder
    let content: Content
    
    @State
    private var _cellHeight: CGFloat = 250
    
    var body: some View
    {
        VStack(
            alignment: .center,
            spacing: Swatch.tinyMargin
        ) {
            image.transition(.move(edge: .bottom))
            
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
    
    @ViewBuilder
    var image: some View
    {
        Image(model.profile ?? "", bundle: .main)
            .resizable()
            .scaledToFill()
            .frame(height: _cellHeight)
            .clipped()
            .cornerRadius(40.0)
            .onTapGesture
            {
                viewModel.selected.send(model)
                
                if focused
                {
                    withAnimation(.easeInOut(duration: 0.25))
                    {
                        _cellHeight = 250
                        focused.toggle()
                    }
                }
                else
                {
                    withAnimation(.easeInOut(duration: 0.25))
                    {
                        _cellHeight = 400
                        focused.toggle()
                    }
                    
                }
            }
    }
}

struct HomeViewItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        _HomeViewItem(
            focused: .constant(false),
            model: OrganizationItem.empty()
        ) {
            Text("Mount Chilkoloo")
        }
    }
}
