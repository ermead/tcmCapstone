//
//  EntryController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/18/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//
import UIKit
import CoreData

class EntryController: NSObject {
    
    private let EntryKey = "entries"
    
    static let sharedController = EntryController()
    
    var defaultEntries: [Entry] {
        
        let entry1 = Entry(name: "", text1: "", text2: "", text3: "", images: [])
        
        let entry2 = Entry(name: "", text1: "", text2: "", text3: "", images: [])
        
        let entry3 = Entry(name: "", text1: "", text2: "", text3: "", images: [])
        
        return [entry1, entry2, entry3]
        
    }
    
    var entries: [Entry] {
        
        let request = NSFetchRequest(entityName: "Entry")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Entry]
            
        } catch {
            return []
        }
    }
    
    func addEntry(entry: Entry) {
        saveToPersistentStorage()
    }
    
    func removeEntry( entry: Entry) {
        entry.managedObjectContext?.deleteObject(entry)
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