//
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
    
//    var defaultHerbs: [Herb] {
//        
//        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: "Gui Zhi Tang", imageId1: nil, imageId2: nil, images: [])
//        let ginseng = Herb(pinyinName: "Ren Shen", botanicalName: "insert botanical name", englishName: "Ginseng", category: "Tonify the Qi", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: "Si Jun Zi Tang", imageId1: nil, imageId2: nil, images: [])
//        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "insert botanical name", englishName: "Angelica", category: "Tonify the Blood", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: "Si Wu Tang", imageId1: nil, imageId2: nil, images: [])
//        
//        return [cinnamon, ginseng, dangGui]
//        
//    }
    
    var defaultHerbs: [Herb] {
        
        var array: [Herb] = []
        
        let windCold = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DisperseWindCold)
        let windHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DisperseWindHeat)
        let PurgeHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.PurgeHeat)
        let ClearBloodHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ClearBloodHeat)
        let ClearDampHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ClearDampHeat)
        let ClearToxicHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ClearToxicHeat)
        let ClearDeficiencyHeat = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ClearDeficiencyHeat)
        let Laxatives = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.Laxatives)
        let DrainDamp = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DrainDamp)
        let DispelWindDamp = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DispelWindDamp)
        let DissolveHotPhlegm = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DissolveHotPhlegm)
        let DissolveColdPhlegm = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.DissolveColdPhlegm)
        let StopCough = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.StopCough)
        let AromaticsDispelDamp = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.AromaticsDispelDamp)
        let Digestives = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.Digestives)
        let RegulateQi = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.RegulateQi)
        let StopBleeding = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.StopBleeding)
        let MoveBlood = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.MoveBlood)
        let WarmInterior = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.WarmInterior)
        let TonifyQi = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.TonifyQi)
        let TonifyBlood = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.TonifyBlood)
        let TonifyYang = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.TonifyYang)
        let TonifyYin = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.TonifyYin)
        let Astringents = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.Astringents)
        let CalmShen = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.CalmShen)
        let NourishShen = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.NourishShen)
        let ExtinguishLiverWind = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ExtinguishLiverWind)
        
        
        var array0 = [windCold, windHeat]
        var array1 = [PurgeHeat, ClearBloodHeat, ClearDampHeat, ClearToxicHeat, ClearDeficiencyHeat]
        var array2 = [Laxatives,  DrainDamp]
        var array3 = [DispelWindDamp, AromaticsDispelDamp]
        var array4 = [DissolveHotPhlegm, DissolveColdPhlegm, StopCough]
        var array5 = [Digestives, RegulateQi]
        var array6 = [StopBleeding, MoveBlood]
        var array7 = [WarmInterior]
        var array8 = [TonifyQi, TonifyBlood, TonifyYin, TonifyYang]
        var array9 = [Astringents, CalmShen, NourishShen]
        var array10 = [ExtinguishLiverWind]
        
        return array0 + array1
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