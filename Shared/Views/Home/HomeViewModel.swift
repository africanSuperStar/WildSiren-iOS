//
//  HomeViewModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Foundation
import SwiftUI
import Combine
import CoreData


final class HomeViewModel : ObservableObject
{
    private var bag = Set <AnyCancellable> ()
 
    var selected: CurrentValueSubject <Organization, Never> = CurrentValueSubject(Organization.empty())
    
    @Published
    var organizations: [Organization] = load("organization.json")
}
