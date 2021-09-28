//
//  DateTime+Ext.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/22.
//

import Amplify
import Foundation


extension Temporal.DateTime : Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(foundationDate)
    }
}
