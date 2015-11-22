//
//  AppDelegate.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        AppearanceController.setUpAppearance()
        
        let fetchRequestDefaultHerbs = NSFetchRequest(entityName: "Herb")
        do {
            let results = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequestDefaultHerbs)
            if results.count == 0 {
                
                 loadHerbDefaultData()
            }
        } catch {
            fatalError("Error fetching data")
        }
        
        let fetchRequestDefaultPoints = NSFetchRequest(entityName: "Point")
        do {
            let results = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequestDefaultPoints)
            if results.count == 0 {
                
                loadPointsDefaultData()
            }
        } catch {
            fatalError("Error fetching data")
        }
        
        let fetchRequestDefaultFormulas = NSFetchRequest(entityName: "Formula")
        do {
            let results = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequestDefaultFormulas)
            if results.count ==  0 {
                
                loadFormulasDefaultData()
            }
        } catch {
            fatalError("Error fetching data")
        }
        
        let fetchRequestDefaultChannels = NSFetchRequest(entityName: "Channel")
        do {
            let results = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequestDefaultChannels)
            if results.count == 0 {
                
                loadChannelsDefaultData()
            }
        } catch {
            fatalError("Error fetching data")
        }
        
        let fetchRequestDefaultEntries = NSFetchRequest(entityName: "Entry")
        do {
            let results = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequestDefaultEntries)
            if results.count == 0 {
                
                loadEntryDefaultData()
            }
        } catch {
            fatalError("Error fetching data")
        }

        
        return true
    }
    
    func loadHerbDefaultData() {
        
        guard let _ = NSEntityDescription.entityForName("Herb", inManagedObjectContext: Stack.sharedStack.managedObjectContext) else { fatalError("Could not find herbs entity description!")}
        
        _ = HerbsController.sharedController.defaultHerbs
        
//        for herb in defaultHerbArray {
//            
//            let managedHerb = Herb(entity: entity, insertIntoManagedObjectContext: Stack.sharedStack.managedObjectContext)
//            
//            managedHerb.pinyinName = herb.pinyinName
//            managedHerb.englishName = herb.englishName
//            managedHerb.botanicalName = herb.botanicalName
//            managedHerb.temp = herb.temp
//            managedHerb.category = herb.category
//            managedHerb.meridians = herb.meridians
//            managedHerb.majorFormulas = herb.majorFormulas
//        }
    }
    
    func loadPointsDefaultData() {
        
        guard let _ = NSEntityDescription.entityForName("Point", inManagedObjectContext: Stack.sharedStack.managedObjectContext) else { fatalError("Could not find points entity description!")}
        
        _ = PointController.sharedController.defaultPoints
        
    }
    
    func loadFormulasDefaultData() {
        
        guard let formulaEntity = NSEntityDescription.entityForName("Formula", inManagedObjectContext: Stack.sharedStack.managedObjectContext) else {fatalError("Could not find formula entity description!")}
            
        let cinnamonDecoction = Formula(entity: formulaEntity, insertIntoManagedObjectContext: Stack.sharedStack.managedObjectContext)
            cinnamonDecoction.pinyinName = "Gui Zhi Tang"
            cinnamonDecoction.englishName = "Cinnamon Decoction"
            cinnamonDecoction.uses = "Release Wind Cold"
            cinnamonDecoction.imageId1 = nil
            cinnamonDecoction.imageId2 = nil
            cinnamonDecoction.category = "release the exterior"
        
        let SixFlavorDecoction = Formula(entity: formulaEntity, insertIntoManagedObjectContext: Stack.sharedStack.managedObjectContext)
            SixFlavorDecoction.pinyinName = "Liu Wei Di Huang Wan1"
            SixFlavorDecoction.englishName = "6 Flavor Rehmannia Decoction"
            SixFlavorDecoction.uses = "Tonify Liver & Kidney Yin"
            SixFlavorDecoction.imageId1 = nil
            SixFlavorDecoction.imageId2 = nil
            SixFlavorDecoction.category = "Kidney and Liver Yin Tonics"
        
            var herbArray : [Herb] = HerbsController.sharedController.herbs.filter({$0.pinyinName!.lowercaseString.containsString("gui zhi")})
        
            SixFlavorDecoction.hasContents = NSSet(array: herbArray)
        
        do { try Stack.sharedStack.managedObjectContext.save()} catch {print("Error with Default Formulas")}
    }
    
    func loadChannelsDefaultData() {
        
        guard let _ = NSEntityDescription.entityForName("Channel", inManagedObjectContext: Stack.sharedStack.managedObjectContext) else { fatalError("Could not find Channel entity description!")}
        
        _ = ChannelController.sharedController.defaultChannels
        
    }
    
    func loadEntryDefaultData() {
        
        guard let _ = NSEntityDescription.entityForName("Entry", inManagedObjectContext: Stack.sharedStack.managedObjectContext) else { fatalError("Could not find Entry entity description!")}
        
        _ = EntryController.sharedController.defaultEntries 
        
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mysite.TraditionalMedicineCapstoneProject" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("TraditionalMedicineCapstoneProject", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

