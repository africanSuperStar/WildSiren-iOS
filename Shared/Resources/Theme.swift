//
//  Theme.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/20.
//

import Foundation
import UIKit
import SwiftUI


enum Swatch
{
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
    
    /// Navigation Height
    static let navigationHeight: CGFloat = 50
    
    /// Margins
    static let tinyMargin:  CGFloat = 5.5
    static let smallMargin: CGFloat = 10.0
    static let margin:      CGFloat = 15.0
    static let largeMargin: CGFloat = 30.0
    
    /// Corner Radii
    static let cornerRadius: CGFloat = 4.0
    
    /// Logo
    static let logoSize:   CGFloat = 55.0
    static let smallImage: CGFloat = 40.0
}
