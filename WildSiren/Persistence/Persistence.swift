//
//  Persistence.swift
//  Shared
//
//  Created by Cameron de Bruyn on 2021/09/19.
//

import Foundation
import CoreData


struct Persistence
{
    // A singleton for our entire app to use
    static let shared = Persistence()

    // Storage for Core Data
    let container: NSPersistentContainer

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false)
    {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "WildSiren")

        if inMemory
        {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores
        {
            description, error in
            
            if let error = error
            {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save()
    {
        let context = container.viewContext

        if context.hasChanges
        {
            do
            {
                try context.save()
            }
            catch
            {
                print("ERROR: Failed to save Persistence Context")
            }
        }
    }
}
