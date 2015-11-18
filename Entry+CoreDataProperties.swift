//
//  Entry+CoreDataProperties.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/18/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var text1: String?
    @NSManaged var text2: String?
    @NSManaged var text3: String?
    @NSManaged var image1: NSData?
    @NSManaged var image2: NSData?
    @NSManaged var image3: NSData?
    @NSManaged var image4: NSData?
    @NSManaged var image5: NSData?
    @NSManaged var image6: NSData?

}
