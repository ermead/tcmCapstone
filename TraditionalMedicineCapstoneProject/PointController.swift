//
//  PointController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

class PointController: NSObject {

    private let PointKey = "points"
    
    static let sharedController = PointController()
    
    var defaultPoints: [Point] {
        
        let ST36 = Point(pinyinName: "Zu San Li", englishName: "Leg Three Miles", pointOnMeridian: "ST-36", specialCategories: "He Sea", channel: "Foot Yang Ming", locationDescription: "on the Leg", uses: "channel regulation",imageId1: nil, imageId2: nil)
        let HT7 = Point(pinyinName: "Shen Men", englishName: "Spirit Gate", pointOnMeridian: "HT-7", specialCategories: "Yuan Source", channel: "Arm Shao Yin",locationDescription: "", uses: "channel regulation", imageId1: nil, imageId2: nil)
        let LR3 = Point(pinyinName: "Tai Chong", englishName: "Great Rushing", pointOnMeridian: "LR-3", specialCategories: "Yuan Source", channel:"Leg Jue Yin", locationDescription: "", uses: "channel regulation", imageId1: nil, imageId2: nil)
        let LI4 = Point(pinyinName: "Hegu", englishName: "Adjoining Valley", pointOnMeridian: "LI-4", specialCategories: "Yuan Source", channel: "Arm Yang Ming", locationDescription: "", uses: "channel regulation",imageId1: nil, imageId2: nil)
    
    return [ST36, HT7, LR3, LI4]
    
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