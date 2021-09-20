//
//  AnyModel.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Foundation


protocol AnyModel : Codable
{
    typealias Role = Codable

    typealias ID = String
}
