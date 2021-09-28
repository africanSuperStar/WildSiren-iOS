//
//  BooleanAnimation.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/27.
//

import SwiftUI


struct OpacityAnimationModifier : ViewModifier
{
    let delay:    CGFloat
    let minValue: CGFloat
    let maxValue: CGFloat
    
    @State
    private var _value: CGFloat = .zero
    
    init(minValue: CGFloat, maxValue: CGFloat, delay: CGFloat = 0.4)
    {
        self.minValue = minValue
        self.maxValue = maxValue
        self.delay    = delay
        
        _value = minValue
    }
    
    func body(content: Content) -> some View
    {
        content
            .opacity(_value)
            .onAppear
            {
                withAnimation(.easeInOut(duration: 0.8).delay(delay))
                {
                    _value = minValue
                }
            }
            .onDisappear
            {
                withAnimation(.default)
                {
                    _value = maxValue
                }
            }
    }
}

struct AppearanceAnimationModifier_Previews: PreviewProvider
{
    static var previews: some View
    {
        VStack
        {
            Text("Hello World")
                .opacity(minValue: 0.0, maxValue: 180.0)
        }
    }
}

extension View
{
    func opacity(minValue: CGFloat, maxValue: CGFloat, delay: CGFloat = 0.4) -> some View
    {
        ModifiedContent(
            content:  self,
            modifier: OpacityAnimationModifier(
                minValue: minValue,
                maxValue: maxValue,
                delay:    delay
            )
        )
    }
}
