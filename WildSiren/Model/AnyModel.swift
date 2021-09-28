//
//  AnyModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Amplify
import Foundation


protocol AnyModel : Model
{
    typealias Role = Model

    typealias ID = String
}
