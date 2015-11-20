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
        
        let entry1 = Entry(name: "Acute Headache Disorders", text1: "this is a test for acute headache disorer remedies", text2: "this is a test for acute headache disorer remedies2", text3: "this is a test for acute headache disorer remedies3", images: [])
        
        let entry2 = Entry(name: "Acute Pain Disorders", text1: "this is a test for acute pain disorer remedies", text2: "this is a test for acute pain disorer remedies2", text3: "this is a test for acute pain disorer remedies3", images: [])
        
        let entry3 = Entry(name: "Acute Stress Disorders", text1: "this is a test for acute stress disorder remedies", text2: "this is a test for chronic headache disorer remedies2", text3: "this is a test for chronic headache disorer remedies3", images: [])
        
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
    
    func createDictionaryfromArrayOfEntryObjects(entries: [Entry]) -> [String: AnyObject] {
        var entriesDictionary  = [String: AnyObject]()
            for entry in entries {
                let nameKey = "\(entry.name!)_name"
                let nameValue = entry.name!
                let text1Key = "\(entry.name!)_text1"
                let text1Value = entry.text1!
                let text2Key = "\(entry.name!)_text2"
                let text2Value = entry.text2!
                let text3Key = "\(entry.name!)_text3"
                let text3Value = entry.text3!
                entriesDictionary[nameKey]  = nameValue
                entriesDictionary[text1Key] = text1Value
                entriesDictionary[text2Key] = text2Value
                entriesDictionary[text3Key] = text3Value
            }
        
        return entriesDictionary
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