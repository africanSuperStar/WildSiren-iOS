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
