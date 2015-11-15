
//  HerbsController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

class HerbsController: NSObject {
    
    private let HerbKey = "herbs"
    
    static let sharedController = HerbsController()
    
    var defaultHerbs: [Herb] {

        let herbset = HerbSets.sharedController.getHerbSet(.ReleaseWindCold)
        return herbset

//        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: "cold & flu", majorFormulas: "Gui Zhi Tang", imageId1: nil, imageId2: nil)
//        let ginseng = Herb(pinyinName: "Ren Shen", botanicalName: "insert botanical name", englishName: "Ginseng", category: "Tonify the Qi", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Qi", majorFormulas: "Si Jun Zi Tang", imageId1: nil, imageId2: nil)
//        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "insert botanical name", englishName: "Angelica", category: "Tonify the Blood", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Blood", majorFormulas: "Si Wu Tang", imageId1: nil, imageId2: nil)
//        
//        return [cinnamon, ginseng, dangGui]
        
    }
    
    var herbs: [Herb] {
        
        let request = NSFetchRequest(entityName: "Herb")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Herb]
            
        } catch {
            return []
        }
    }

    func addHerb(herb: Herb) {
      saveToPersistentStorage()
    }
    
    func removeHerb( herb: Herb) {
        herb.managedObjectContext?.deleteObject(herb)
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

//class TaskController {
//    
//    private let TaskKey = "tasks"
//    
//    static let sharedController = TaskController()
//    
//    var mockTasks:[Task] {
//        let sampleTask1 = Task(name: "Go grocery shopping", notes: "Costco")
//        let sampleTask2 = Task(name: "Pay rent", notes: "344 South State Street, SLC, Utah", due: NSDate(timeIntervalSinceNow: NSTimeInterval(60*60*24*3)))
//        let sampleTask3 = Task(name: "Finish work project")
//        let sampleTask4 = Task(name: "Install new light fixture", notes: "Downstairs bathroom")
//        sampleTask4.isComplete = true
//        let sampleTask5 = Task(name: "Order pizza")
//        sampleTask5.isComplete = true
//        
//        return [sampleTask1, sampleTask2, sampleTask3, sampleTask4]
//    }
//    
//    var tasks:[Task] {
//        
//        let request = NSFetchRequest(entityName: "Task")
//        
//        do {
//            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Task]
//        } catch {
//            return []
//        }
//    }
//    
//    var completedTasks:[Task] {
//        
//        return tasks.filter({$0.isComplete.boolValue})
//    }
//    
//    var incompleteTasks:[Task] {
//        
//        return tasks.filter({!$0.isComplete.boolValue})
//    }
//    
//    func addTask(task: Task) {
//        
//        saveToPersistentStorage()
//    }
//    
//    func removeTask(task: Task) {
//        
//        task.managedObjectContext?.deleteObject(task)
//        saveToPersistentStorage()
//    }
//    
//    // MARK: - Persistence
//    
//    func saveToPersistentStorage() {
//        
//        do {
//            try Stack.sharedStack.managedObjectContext.save()
//        } catch {
//            print("Error saving Managed Object Context. Items not saved.")
//        }
//    }
//    
//    func filePath(key: String) -> String {
//        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
//        let documentsPath: AnyObject = directorySearchResults[0]
//        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
//        
//        return entriesPath
//    }
//}