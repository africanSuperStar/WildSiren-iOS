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
    private var _cellHeight: CGFloat = 180
    
    @State
    private var _opacity: CGFloat = 0.0
    
    var body: some View
    {
        VStack(
            alignment: .center,
            spacing: Swatch.tinyMargin
        ) {
            image
            
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
                    withAnimation(.easeInOut(duration: 0.45).delay(0.5))
                    {
                        _cellHeight = 180
                        focused.toggle()
                    }
                }
                else
                {
                    withAnimation(.easeInOut(duration: 0.45))
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
