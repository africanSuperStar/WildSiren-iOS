//
//  Organization.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Foundation
import RealmSwift

final class OrganizationItem :
    Object,
    ObjectKeyIdentifiable,
    AnyModel,
    Identifiable
{
    typealias Role = Organization
    
    var id: String
    {
        return _id.stringValue
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted
    var license:          String

    @Persisted
    var created:          String?
    
    @Persisted
    var active:           Bool?
    
    @Persisted
    var name:             String?
    
    @Persisted
    var shortDescription: String?
    
    @Persisted
    var longDescription:  String?
    
    @Persisted
    var profile:          String?
    
    @Persisted(originProperty: "items")
    var organizations: LinkingObjects <Organization>
    
    enum CodingKeys: String, CodingKey
    {
        case license, created, active, name, shortDescription, longDescription, profile
    }
    
    convenience init(
        license:          String,
        created:          String?,
        active:           Bool?,
        name:             String?,
        shortDescription: String?,
        longDescription:  String?,
        profile:          String?
    ) {
        self.init()
        
        self.license          = license
        self.created          = created
        self.active           = active
        self.name             = name
        self.shortDescription = shortDescription
        self.longDescription  = longDescription
        self.profile          = profile
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(license,          forKey: .license)
        try container.encode(created,          forKey: .created)
        try container.encode(active,           forKey: .active)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(longDescription,  forKey: .longDescription)
        try container.encode(profile,          forKey: .profile)
    }
    
    static func empty() -> OrganizationItem
    {
        return OrganizationItem(
            license:          UUID().uuidString,
            created:          Date().description,
            active:           true,
            name:             "Chilk Koot Trail",
            shortDescription: "Lorem Ipsem",
            longDescription:  "Lorem Ipsem Description",
            profile:          "chilkoottrail"
        )
    }
}
