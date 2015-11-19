//
//  Image+CoreDataProperties.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/19/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Image {

    @NSManaged var imageData: NSData?
    @NSManaged var entry: Entry?
    @NSManaged var herb: Herb?
    @NSManaged var point: Point?
    @NSManaged var channel: Channel?
    @NSManaged var formula: Formula?

}
