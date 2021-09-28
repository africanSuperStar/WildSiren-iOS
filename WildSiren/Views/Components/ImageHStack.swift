//
//  ImageHStack.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/27.
//

import SwiftUI

extension Image : Hashable, Identifiable
{
    public var id: String
    {
        return UUID().uuidString
    }
    
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(id)
    }
}

struct ImageHStack: View
{
    @Binding
    var imageNames: [String]
    
    let bundle: Bundle? = .main
    
    var body: some View
    {
        HStack(spacing: 0.0)
        {
            ForEach(imageNames, id: \.self)
            {
                name in
                
                Image(name, bundle: bundle)
                    .resizable()
                    .scaledToFit()
                    .opacity(minValue: 1.0, maxValue: 0.0)
                    .frame(height: 90)
            }
        }
        .cornerRadius(Swatch.rectRadius)
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct ImageHStack_Previews: PreviewProvider {
    static var previews: some View {
        ImageHStack(imageNames: .constant(
            [
                "onboarding-1",
                "onboarding-2",
                "onboarding-3"
            ]
        ))
    }
}
