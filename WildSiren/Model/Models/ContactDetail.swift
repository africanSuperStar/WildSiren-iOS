//
//  ContactDetails.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/26.
//

import Amplify
import Foundation


struct ContactDetail :
    AnyModel,
    Hashable,
    Identifiable
{
    let id:               String
    let created:          String
    let active:           Bool
    var email:            String
    
    let createdAt: Temporal.DateTime?
    let updatedAt: Temporal.DateTime?
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(created, forKey: .created)
        try container.encode(active,  forKey: .active)
        try container.encode(email,   forKey: .email)
    }
    
    static func empty() -> ContactDetail
    {
        return ContactDetail(
            id:               UUID().uuidString,
            created:          Date().description,
            active:           true,
            email:            "",
            createdAt:        Temporal.DateTime.now(),
            updatedAt:        Temporal.DateTime.now()
        )
    }
}

extension ContactDetail
{
    enum CodingKeys: String, ModelKey
    {
    case id
    case created
    case active
    case email
    case createdAt
    case updatedAt
    }
  
    static let keys = CodingKeys.self
  
    static let schema = defineSchema
    {
        model in
    
        let contact = ContactDetail.keys
    
        model.pluralName = "ContactDetails"
    
        model.fields(
            .id(),
            .field(contact.created, is: .optional, ofType: .string),
            .field(contact.active, is: .optional, ofType: .bool),
            .field(contact.email, is: .required, ofType: .string),
            .field(contact.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
            .field(contact.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
        )
    }
}
