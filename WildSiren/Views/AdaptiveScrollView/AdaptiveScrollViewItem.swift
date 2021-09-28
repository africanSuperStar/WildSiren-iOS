//
//  HomeViewItem.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/20.
//

import SwiftUI

struct _AdaptiveScrollViewItem <M: AdaptiveScrollItem> : View
{
    @Binding
    internal var selected: M
    
    @Binding
    internal var focused: Bool
    
    internal let model: M
    
    @State
    private var _cellHeight: CGFloat = 140
    
    var body: some View
    {
        VStack(
            alignment: .leading,
            spacing: Swatch.tinyMargin
        ) {
            image
            
            if focused && selected.id == model.id
            {
                Group
                {
                    Text(model.name)
                        .font(.title3)
                        .padding(.top,    Swatch.margin)
                        .padding(.bottom, Swatch.tinyMargin)
                    
                    Text(model.shortDescription)
                        .font(.subheadline)
                    
                    Text(model.longDescription)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, Swatch.margin)
                }
                .padding(.horizontal, Swatch.largeMargin)
            }
        }
        .cornerRadius(Swatch.cornerRadius)
    }
    
    @ViewBuilder
    var image: some View
    {
        Image(model.image, bundle: .main)
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(
                minWidth:    250,
                maxWidth:    500
            )
            .frame(height: _cellHeight)
            #if os(iOS)
            .cornerRadius(40.0)
            #else
            .cornerRadius(20.0)
            #endif
            .onTapGesture
            {
                selected = model

                if focused
                {
                    withAnimation(.easeInOut(duration: 0.45).delay(0.5))
                    {
                        _cellHeight = 140
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
            .padding(.horizontal, Swatch.smallMargin)
    }
}

struct AdaptiveScrollViewItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        _AdaptiveScrollViewItem(
            selected: .constant(Organization.empty()),
            focused:  .constant(false),
            model:    Organization.empty()
        )
    }
}
