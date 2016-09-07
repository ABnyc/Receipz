//
//  Receipe+CoreDataProperties.swift
//  Receipz
//
//  Created by Arpita Bhatia on 9/5/16.
//  Copyright © 2016 Arpita Bhatia. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Receipe {

    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?

}
