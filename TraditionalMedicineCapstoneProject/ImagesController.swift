//
//  ImagesController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/19/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

class ImagesController: NSObject {
    
    private let ImageKey = "images"
    
    static let sharedController = ImagesController()
    
    var defaultImages: [Image] {
        
        var defaultImage1Data = ImageController.getDataFromImage(UIImage(named: "greenCar")!)
        
        let defaultImage1 = Image(data: defaultImage1Data, context: Stack.sharedStack.managedObjectContext)
        
        let defaultImage2 = Image(data: defaultImage1Data, context: Stack.sharedStack.managedObjectContext)
        
        let defaultImage3 = Image(data: defaultImage1Data, context: Stack.sharedStack.managedObjectContext)
        
        return [defaultImage1, defaultImage2, defaultImage3]
    }
    
    var images: [Image] {
        
        let request = NSFetchRequest(entityName: "Image")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Image]
            
        } catch {
            return []
        }
    }
    
    func addImage(image: Image) {
        saveToPersistentStorage()
    }
    
    func removeImage(image: Image) {
        image.managedObjectContext?.deleteObject(image)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage(){
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}


