//
//  RoundedCorner.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/27.
//

import SwiftUI


struct RoundedCorner: Shape
{
    var radius:  CGFloat      = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    
        return Path(path.cgPath)
    }
}
