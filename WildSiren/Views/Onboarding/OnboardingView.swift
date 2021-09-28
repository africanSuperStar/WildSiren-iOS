//
//  OnboardingView.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/27.
//

import SwiftUI


struct OnboardingView: View
{
    var body: some View
    {
        NavigationView
        {
            _OnboardingContents()
                .background(
                    _OnboardingBackground()
                )
                .frame(maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: [.leading, .trailing])
        }
        .transition(.move(edge: .bottom))
    }
}

struct OnboardingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        OnboardingView()
    }
}

struct _Item : View, Equatable
{
    var gradient: LinearGradient
    {
        LinearGradient(
            gradient:   Gradient(colors: [Color.primary, Color.primary20]),
            startPoint: .leading,
            endPoint:   .trailing
        )
    }
    
    var body: some View
    {
        VStack(spacing: 0.0)
        {
            Text("WILD SIREN")
                .font(.custom("StickNoBills-Medium", size: 42))
                .foregroundColor(Color.white)
                .padding(.vertical, Swatch.smallMargin)
            
            Text("Will they be there when we are gone?")
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.white)
                .padding(.bottom, Swatch.smallMargin)
        }
        .frame(maxWidth: .infinity)
        .background(gradient)
    }
}

struct _OnboardingBackground : View
{
    let imageNames: Array <String> = [
        "onboarding-1",
        "onboarding-2",
        "onboarding-3",
        "onboarding-4",
        "background-1",
        "background-2",
        "background-3",
        "background-4",
        "background-5",
        "background-6",
        "background-7",
        "background-8",
        "background-9",
        "background-18",
        "background-19",
        "background-20",
        "background-21",
        "background-22",
        "background-23",
        "background-24",
        "background-25",
        "background-26",
        "background-27",
        "background-28",
        "background-29",
        "background-30",
        "background-31",
        "background-32",
        "background-33",
        "background-34",
        "background-35",
        "onboarding-1",
        "onboarding-2",
        "onboarding-3",
        "onboarding-4",
        "background-1",
        "background-2",
        "background-3",
        "background-4",
        "background-5",
        "background-6",
        "background-7",
        "background-8",
        "background-9",
    ]

    let columns = [
        GridItem(.flexible(minimum: 200.0, maximum: 250.0)),
        GridItem(.flexible(minimum: 200.0, maximum: 350.0)),
        GridItem(.flexible(minimum: 200.0, maximum: 350.0)),
        GridItem(.flexible(minimum: 200.0, maximum: 350.0)),
        GridItem(.flexible(minimum: 200.0, maximum: 250.0))
    ]
    
    var body: some View
    {
        LazyVGrid(columns: columns, spacing: 0.0)
        {
            ForEach(Array(imageNames.enumerated()), id: \.0)
            {
                index, name in
                
                let delay = (Double(index) * Double.random(in: 0.05..<0.1))
                
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(minHeight: 50, maxHeight: 250)
                    .opacity(minValue: 1.0, maxValue: 0.0, delay: delay)
            }
        }
        .padding(.horizontal)
    }
}

struct _OnboardingContents : View
{
    var body: some View
    {
        VStack(alignment: .center, spacing: .zero)
        {
            Spacer()
            
            _Item()
                .padding(.vertical, Swatch.largeMargin)
        
            NavigationLink(destination: RegistrationForm())
            {
                Text("Do you really want to change the world?")
            }
            .padding()
            .overlay(
                RoundedRectangle(
                    cornerRadius: Swatch.smallRectRadius
                )
                    .stroke(Color.primary, lineWidth: 4)
            )
            .background(
                RoundedRectangle(
                    cornerRadius: Swatch.smallRectRadius
                )
                    .fill(Color.black)
            )
            .foregroundColor(Color.white)
            .buttonStyle(PlainButtonStyle())

            Spacer()
        }
    }
}
