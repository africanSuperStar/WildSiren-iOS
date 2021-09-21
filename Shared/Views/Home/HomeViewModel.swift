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

import RealmSwift


final class HomeViewModel : ObservableObject
{
    private var bag = Set <AnyCancellable> ()
 
    var selected: CurrentValueSubject <OrganizationItem, Never> = CurrentValueSubject(OrganizationItem.empty())
    
    @ObservedRealmObject
    var organizations = Organization()
}
