//
//  Entry.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/18/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import CoreData

@objc(Entry)
class Entry: NSManagedObject {

    convenience init(name: String?, text1 : String?, text2: String?, text3: String?, image1: NSData?, image2: NSData?, image3: NSData?, image4: NSData?, image5: NSData?, image6: NSData?,  context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Entry", inManagedObjectContext: context)
        
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        self.image4 = image4
        self.image5 = image5
        self.image6 = image6
    }
    
    

}
