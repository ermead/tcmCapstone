//
//  Channel.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import CoreData

@objc(Channel)
class Channel: NSManagedObject {
        
        // Insert code here to add functionality to your managed object subclass
        
    convenience init(name: String? = "", uses: String? = "" , imageId1: String? = "", imageId2: String? = "", images: NSSet? = [], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
            
            let entity = NSEntityDescription.entityForName("Channel", inManagedObjectContext: context)
            
            self.init(entity: entity!, insertIntoManagedObjectContext: context)
            
            self.name = name
            self.uses = uses
            self.imageId1 = imageId1
            self.imageId2 = imageId2
        
    }

}
