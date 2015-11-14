//
//  Herb+CoreDataProperties.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Herb {

    @NSManaged var botanicalName: String?
    @NSManaged var category: String?
    @NSManaged var englishName: String?
    @NSManaged var imageName: String?
    @NSManaged var majorFormulas: String?
    @NSManaged var meridians: String?
    @NSManaged var pinyinName: String?
    @NSManaged var temp: String?
    @NSManaged var uses: String?
    @NSManaged var inContents: NSSet?
    @NSManaged var imageId1: String?
    @NSManaged var imageId2: String?

}
