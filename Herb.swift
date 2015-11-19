//
//  Herb.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/2/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import CoreData

@objc(Herb)
class Herb: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    convenience init(pinyinName: String? = nil, botanicalName: String? = nil, englishName: String, category: String? = nil, temp: String? = nil, meridians: String? = nil, uses: String? = nil, majorFormulas: String? = nil, imageId1: String? = "", imageId2: String? = "", images: NSSet? = [], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
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
        self.imageId1 = imageId1
        self.imageId2 = imageId2
        self.images = images

    }
    
}


//convenience init(name: String, notes: String? = nil, due: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
//    
//    let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
//    
//    self.init(entity: entity, insertIntoManagedObjectContext: context)
//    
//    self.name = name
//    self.notes = notes
//    self.due = due
//    self.isComplete = false


//let pinyinName: String
//let botanicalName: String
//let englishName: String
//
//let imageName: String?
//
//let category: String
//let temp: String
//let meridians: String
//let uses: String
//let majorFormulas: String
//
//init(pinyinName: String, botanicalName: String, englishName: String, category: String, temp: String, meridians: String, uses: String, majorFormulas: String){
//    
//    self.pinyinName = pinyinName
//    self.botanicalName = botanicalName
//    self.englishName = englishName
//    self.imageName = englishName.lowercaseString
//    self.category = category
//    self.temp = temp
//    self.meridians = meridians
//    self.uses = uses
//    self.majorFormulas = majorFormulas
