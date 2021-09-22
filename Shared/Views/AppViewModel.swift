//
//  AppViewModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/21.
//

import Foundation
import Combine

import RealmSwift


final class AppViewModel : ObservableObject
{
    private var bag = Set <AnyCancellable> ()
 
    @Published
    var realm: Realm? = nil
 }
