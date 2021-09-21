//
//  Organizations.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/21.
//

import Foundation
import RealmSwift


final class Organization :
    Object,
    ObjectKeyIdentifiable,
    AnyModel,
    Identifiable
{
    var id: String
    {
        return _id.stringValue
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
 
    @Persisted var items = List <OrganizationItem> ()
}
