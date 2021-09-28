//
//  Address.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/26.
//

import Amplify
import Foundation


struct Address :
    AnyModel,
    Hashable,
    Identifiable
{
    let id:           String
    let created:      String
    let active:       Bool
    var addressLine1: String
    var addressLine2: String
    var postalCode:   String
    
    let createdAt: Temporal.DateTime?
    let updatedAt: Temporal.DateTime?
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(created,      forKey: .created)
        try container.encode(active,       forKey: .active)
        try container.encode(addressLine1, forKey: .addressLine1)
        try container.encode(addressLine2, forKey: .addressLine2)
        try container.encode(postalCode,   forKey: .postalCode)
    }
    
    static func empty() -> Address
    {
        return Address(
            id:               UUID().uuidString,
            created:          Date().description,
            active:           true,
            addressLine1:     "",
            addressLine2:     "",
            postalCode:       "",
            createdAt:        Temporal.DateTime.now(),
            updatedAt:        Temporal.DateTime.now()
        )
    }
}

extension Address
{
    enum CodingKeys: String, ModelKey
    {
    case id
    case created
    case active
    case addressLine1
    case addressLine2
    case postalCode
    case createdAt
    case updatedAt
    }
  
    static let keys = CodingKeys.self
  
    static let schema = defineSchema
    {
        model in
    
        let address = Address.keys
    
        model.pluralName = "ContactDetails"
    
        model.fields(
            .id(),
            .field(address.created, is: .optional, ofType: .string),
            .field(address.active, is: .optional, ofType: .bool),
            .field(address.addressLine1, is: .optional, ofType: .string),
            .field(address.addressLine2, is: .optional, ofType: .string),
            .field(address.postalCode, is: .optional, ofType: .string),
            .field(address.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
            .field(address.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
        )
    }
}
