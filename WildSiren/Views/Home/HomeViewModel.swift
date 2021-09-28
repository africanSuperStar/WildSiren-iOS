//
//  HomeViewModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/26.
//

import Foundation
import Combine
import SwiftUI


final class HomeViewModel : ObservableObject
{
    private var bag = Set <AnyCancellable> ()
    
    @Published
    internal var organizations = [Organization]()
}
