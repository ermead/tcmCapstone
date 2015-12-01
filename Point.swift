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

    convenience init(pinyinName: String? = "", englishName: String? = "", chineseCharacter: String? = "",pointOnMeridian: String? = "", channelAbrev: String? = "", number: String? = "", specialCategories: String? = "", locationDescription: String? = "", channel: String? = "", uses: String? = "", imageName: String? = "", images: NSSet? = [],context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Point", inManagedObjectContext: context)
        
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        self.pinyinName = pinyinName
        self.englishName = englishName
        self.chineseCharacter = chineseCharacter
        self.pointOnMeridian = pointOnMeridian
        self.channelAbrev = channelAbrev
        self.number = number
        self.specialCategories = specialCategories
        self.locationDescription = locationDescription
        self.channel = channel
        self.uses = uses
        self.imageName = imageName

    }
    
    func completeDetails() -> String{
        
        return "\(pinyinName), \(englishName), \(uses), \(specialCategories), \(channel)"
    }
    
}
