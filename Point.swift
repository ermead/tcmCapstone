//
//  Point.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import CoreData

@objc(Point)
class Point: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    convenience init(pinyinName: String? = "", englishName: String? = "", pointOnMeridian: String? = "", specialCategories: String? = "", locationDescription: String? = "", channel: String? = "", uses: String? = "", imageName: String? = "", images: NSSet? = [],context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Point", inManagedObjectContext: context)
        
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        self.pinyinName = pinyinName
        self.englishName = englishName
        self.pointOnMeridian = pointOnMeridian
        self.specialCategories = specialCategories
        self.locationDescription = locationDescription
        self.channel = channel
        self.uses = uses
        self.imageName = imageName

    }
    
}



/*convenience init(pinyinName: String? = nil, botanicalName: String? = nil, englishName: String, category: String? = nil, temp: String? = nil, meridians: String? = nil, uses: String? = nil, majorFormulas: String? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
    
    let entity = NSEntityDescription.entityForName("Herb", inManagedObjectContext: context)
    
    self.init(entity: entity!, insertIntoManagedObjectContext: context)
    
    self.pinyinName = pinyinName
    self.botanicalName = botanicalName
    self.englishName = englishName
    self.category = category
    self.temp = temp
    self.meridians = meridians
    self.uses = uses
    self.majorFormulas = majorFormulas
    
}

}
*/