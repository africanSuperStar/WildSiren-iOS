//
//  Organization.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Amplify
import Foundation


struct Organization : AnyModel, AdaptiveScrollItem
{
    let id:               String
    var license:          String
    var created:          String
    var active:           Bool
    var name:             String
    var shortDescription: String
    var longDescription:  String
    var image:            String
    
    var contact:          ContactDetail
    var address:          Address
    
    let createdAt: Temporal.DateTime?
    let updatedAt: Temporal.DateTime?
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(license,          forKey: .license)
        try container.encode(created,          forKey: .created)
        try container.encode(active,           forKey: .active)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(longDescription,  forKey: .longDescription)
        try container.encode(image,            forKey: .image)
        try container.encode(contact,          forKey: .contact)
        try container.encode(address,          forKey: .address)
    }
    
    static func empty() -> Organization
    {
        return Organization(
            id:               UUID().uuidString,
            license:          UUID().uuidString,
            created:          Date().description,
            active:           true,
            name:             "",
            shortDescription: "",
            longDescription:  "Long Description",
            image:            "",
            contact:          ContactDetail.empty(),
            address:          Address.empty(),
            createdAt:        Temporal.DateTime.now(),
            updatedAt:        Temporal.DateTime.now()
        )
    }
}

extension Organization
{
    enum CodingKeys: String, ModelKey
    {
    case id
    case license
    case created
    case active
    case name
    case shortDescription
    case longDescription
    case image
    case contact
    case address
    case createdAt
    case updatedAt
    }
  
    static let keys = CodingKeys.self
  
    static let schema = defineSchema
    {
        model in
    
        let organization = Organization.keys
    
        model.pluralName = "Organizations"
    
        model.fields(
            .id(),
            .field(organization.license, is: .required, ofType: .string),
            .field(organization.created, is: .optional, ofType: .string),
            .field(organization.active, is: .optional, ofType: .bool),
            .field(organization.name, is: .optional, ofType: .string),
            .field(organization.shortDescription, is: .optional, ofType: .string),
            .field(organization.longDescription, is: .optional, ofType: .string),
            .field(organization.image, is: .optional, ofType: .string),
            .field(organization.contact, is: .optional, ofType: .model(name: "\(ContactDetail.modelName)")),
            .field(organization.address, is: .optional, ofType: .model(name: "\(Address.modelName)")),
            .field(organization.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
            .field(organization.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
        )
    }
}
