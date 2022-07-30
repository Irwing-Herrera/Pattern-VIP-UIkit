//
//  PersistentContainerProvider.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import CoreData

class PersistentContainerProvider {
    
    private init() {}
    
    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Error no resuelto \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    public static func getInstance() -> NSPersistentContainer {
        return persistentContainer
    }
}
