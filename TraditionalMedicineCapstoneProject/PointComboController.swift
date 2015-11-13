//
//  PointComboController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/12/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PointComboController: NSObject {
    
    private let PointComboKey = "pointsCombo"
    
    static let sharedController = PointComboController()
    
    var defaultPointCombos: [Channel] {
        
        let fourFlowers = Channel(name: "Four Flowers", uses: "Exhaustion", context: Stack.sharedStack.managedObjectContext)
    
        return[fourFlowers]
        
    }
    
    var points: [Point] {
        
        let request = NSFetchRequest(entityName: "Point")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Point]
            
        } catch {
            return []
        }
    }
    
    func addPoint(point: Point) {
        saveToPersistentStorage()
        print("did I add it?")
    }
    
    func removePoint( point: Point) {
        point.managedObjectContext?.deleteObject(point)
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


//private let HerbKey = "herbs"
//
//static let sharedController = HerbsController()
//
//var defaultHerbs: [Herb] {
//
//    let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: "cold & flu", majorFormulas: "Gui Zhi Tang")
//    let ginseng = Herb(pinyinName: "Ren Shen", botanicalName: "insert botanical name", englishName: "Ginseng", category: "Tonify the Qi", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Qi", majorFormulas: "Si Jun Zi Tang")
//    let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "insert botanical name", englishName: "Angelica", category: "Tonify the Blood", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Blood", majorFormulas: "Si Wu Tang")
//
//    return [cinnamon, ginseng, dangGui]
//
//}
//
//var herbs: [Herb] {
//
//    let request = NSFetchRequest(entityName: "Herb")
//
//    do {
//        return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Herb]
//
//    } catch {
//        return []
//    }
//}
//
//func addHerb(herb: Herb) {
//    saveToPersistentStorage()
//}
//
//func removeHerb( herb: Herb) {
//    herb.managedObjectContext?.deleteObject(herb)
//    saveToPersistentStorage()
//}
//
//func saveToPersistentStorage(){
//    do {
//        try Stack.sharedStack.managedObjectContext.save()
//    } catch {
//        print("Error saving Managed Object Context. Items not saved.")
//    }
//}
//
//func filePath(key: String) -> String {
//    let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
//    let documentsPath: AnyObject = directorySearchResults[0]
//    let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
//
//    return entriesPath
//}
//}