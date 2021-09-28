//
//  AppViewModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/21.
//

import Foundation
import Combine
import SwiftUI
import MetalKit


final class AppViewModel : ObservableObject
{
    private var bag = Set <AnyCancellable> ()
    
    @Published
    var home = HomeViewModel()
}
