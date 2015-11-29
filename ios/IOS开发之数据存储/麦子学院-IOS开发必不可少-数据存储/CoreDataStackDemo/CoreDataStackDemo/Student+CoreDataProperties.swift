//
//  Student+CoreDataProperties.swift
//  CoreDataStackDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var name: String?
    @NSManaged var score: NSNumber?
    @NSManaged var sno: String?

}
