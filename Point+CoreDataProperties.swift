//
//  Point+CoreDataProperties.swift
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

extension Point {

    @NSManaged var imageName: String?
    @NSManaged var locationDescription: String?
    @NSManaged var uses: String?
    @NSManaged var channel: String?
    @NSManaged var specialCategories: String?
    @NSManaged var pointOnMeridian: String?
    @NSManaged var englishName: String?
    @NSManaged var pinyinName: String?
    @NSManaged var channelAbrev: String?
    @NSManaged var number: String?
    @NSManaged var chineseCharacter: String?
    @NSManaged var onChannel: NSSet?
    @NSManaged var images: NSSet?

}
