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
        
        //deleteCoreData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteCoreData() {
        
        let fetchRequest = NSFetchRequest(entityName: "Herb")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do { try Stack.sharedStack.managedObjectContext.executeRequest(deleteRequest)
        } catch let error as NSError {
            print("error deleting batch")
            return
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }


}

