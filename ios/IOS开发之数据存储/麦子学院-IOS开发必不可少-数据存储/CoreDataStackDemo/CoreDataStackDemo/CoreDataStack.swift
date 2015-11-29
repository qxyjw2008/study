//
//  CoreDataStack.swift
//  CoreDataStackDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject {

    let context: NSManagedObjectContext
    let coordinator: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let store: NSPersistentStore?
    
    static func defaultStack() -> CoreDataStack {
        return instance
    }
    
    private static let instance = CoreDataStack()
    
    private override init() {
        //构建托管对象模型
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("CoreDataStackDemo", withExtension: "momd")!
        model = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        //构建持久化存储助理
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        //构建托管对象上下文，并且将助理连接到上下文
        context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        
        //构建持久化存储
        let manager = NSFileManager.defaultManager()
        let documentsURL = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        print(documentsURL)
        let storeURL = documentsURL.URLByAppendingPathComponent("CoreDataStackDemo")
        
        store = (try! coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil))
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save failed...")
            }
        }
    }
}
