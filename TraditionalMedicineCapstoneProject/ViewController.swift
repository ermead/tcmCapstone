//
//  ViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       deleteCoreData()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteCoreData() {
        
        let classObjectsToBeDeleted = ["Herb", "Point", "Formula", "Channel", "Entry"]
        
        for thing in classObjectsToBeDeleted {
        let fetchRequest = NSFetchRequest(entityName: thing)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do { try Stack.sharedStack.managedObjectContext.executeRequest(deleteRequest)
        } catch _ as NSError {
            print("error deleting batch")
            return
        }
        }
    }
    
    func addHerbSet(array: [Herb]){
        
       //let array = HerbSets.sharedController.getHerbSet(HerbSets.HerbSetType.ReleaseWindHeat)
       
        let array = array
        
        for herb in array{
            
            HerbsController.sharedController.addHerb(herb)
        
        }
    }
    
    
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }


}

