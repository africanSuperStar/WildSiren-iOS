//
//  TextModifier.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/27.
//

import SwiftUI


struct PrimaryTextModifier : ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .foregroundColor(Color.primaryText)
            .font(.body)
    }
}

struct SecondaryTextModifier : ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .foregroundColor(Color.secondaryText)
            .font(.body)
    }
}

struct DefaultFontModifier : ViewModifier
{
    let color: Color
    let font:  Font
    
    func body(content: Content) -> some View
    {
        content
            .foregroundColor(color)
            .font(font)
    }
}

struct TextModifier_Previews: PreviewProvider
{
    static var previews: some View
    {
        VStack
        {
            Text("Hello World")
                .padding()
                .primaryText()
            
            Text("Hello World")
                .padding()
                .secondaryText()
            
            Text("Hello World")
                .padding()
                .text(.headline, color: Color.warning)
        }
    }
}

extension View
{
    func primaryText() -> some View
    {
        ModifiedContent(content: self, modifier: PrimaryTextModifier())
    }
    
    func secondaryText() -> some View
    {
        ModifiedContent(content: self, modifier: SecondaryTextModifier())
    }
    
    func text(_ font: Font, color: Color) -> some View
    {
        ModifiedContent(content: self, modifier: DefaultFontModifier(color: color, font: font))
    }
}
