//
//  Persistence.swift
//  Shared
//
//  Created by Misael Landero on 18/08/21.
//

import CoreData


import CoreData
public class PersistentCloudKitContainer: ObservableObject {
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "toTravel")
        
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("No descriptions found")
        }
        
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
         
        return container
    }()
    
}
