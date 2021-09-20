//
//  Organization.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Foundation


struct Organization : AnyModel, Hashable, Identifiable, Equatable
{
    typealias Role = Self
    
    var id: String
    {
        return license
    }
    
    let license:          String
    let created:          String?
    let active:           Bool?
    let name:             String?
    let shortDescription: String?
    let longDescription:  String?
    let profile:          String?
    let assets:           [Data?]
    
    enum CodingKeys: String, CodingKey
    {
        case license, created, active, name, shortDescription, longDescription, profile, assets
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(license,          forKey: .license)
        try container.encode(created,          forKey: .created)
        try container.encode(active,           forKey: .assets)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(longDescription,  forKey: .longDescription)
        try container.encode(profile,          forKey: .profile)
        try container.encode(assets,           forKey: .assets)
    }
    
    static func empty() -> Organization
    {
        return Organization(
            license:          "",
            created:          .none,
            active:           false,
            name:             "",
            shortDescription: "",
            longDescription:  "",
            profile:          "chilkoottrail",
            assets:           []
        )
    }
}
