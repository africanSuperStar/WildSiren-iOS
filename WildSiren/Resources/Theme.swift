//
//  Theme.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/20.
//

import Foundation
import SwiftUI


extension Color
{
    static var primary: Color
    {
        // MARK: - Primary Color
        return Color(red: 0.83, green: 0.29, blue: 0.06)
    }
    
    static var primary40: Color
    {
        // MARK: - Primary Color
        return Color(red: 0.87, green: 0.32, blue: 0.11)
    }
    
    static var primary20: Color
    {
        // MARK: - Primary Color
        return Color(red: 0.93, green: 0.39, blue: 0.16)
    }
    
    static var secondary: Color
    {
        // MARK: - Secondary Color
        return Color(red: 0.44, green: 0.60, blue: 0.57)
    }
    
    static var success: Color
    {
        // MARK: - Light Mode
        return Color(red: 0.46, green: 0.80, blue: 0.44)
    }
    
    static var error: Color
    {
        // MARK: - Light Mode
        return Color(red: 1.00, green: 0.39, blue: 0.39)
    }
    
    static var warning: Color
    {
        // MARK: - Light Mode
        return Color(red: 1.00, green: 0.76, blue: 0.30)
    }
    
    /// - Tag: Texts
    
    static var primaryText: Color
    {
        return Color(red:0.25, green:0.30, blue:0.40)
    }
    
    static var secondaryText: Color
    {
        return Color(red:0.7, green:0.7, blue:0.7)
    }
}

enum Swatch
{
    /// Navigation Height
    static let navigationHeight: CGFloat = 50
    
    /// Margins
    static let tinyMargin:  CGFloat = 5.5
    static let smallMargin: CGFloat = 10.0
    static let margin:      CGFloat = 15.0
    static let largeMargin: CGFloat = 30.0
    
    /// Corner Radii
    static let cornerRadius:    CGFloat = 4.0
    static let smallRectRadius: CGFloat = 25.0
    static let rectRadius:      CGFloat = 50.0
    
    /// Logo
    static let logoSize:   CGFloat = 55.0
    static let smallImage: CGFloat = 40.0
}
