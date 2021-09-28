//
//  AnyView+Ext.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import SwiftUI


extension View
{
    func eraseToAnyView() -> AnyView
    {
        return AnyView(self)
    }
}

extension View
{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View
    {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
