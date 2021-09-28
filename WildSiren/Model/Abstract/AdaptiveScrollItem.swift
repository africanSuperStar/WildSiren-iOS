//
//  AdaptiveScroll.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/25.
//

import Foundation


protocol AdaptiveScrollItem :
    AnyModel,
    Hashable,
    Identifiable
{
    var name:             String { get set }
    var shortDescription: String { get set }
    var longDescription:  String { get set }
    var image:            String { get set }
}
