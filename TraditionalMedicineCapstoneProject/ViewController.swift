//
//  ViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import SafariServices
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       deleteCoreData()
        
//        let url = "http://maciociaonline.blogspot.com/"
//        let url2 = "http://www.shen-nong.com/eng/exam/index.html"
//        
//        let svc = SFSafariViewController(URL: NSURL(string: url2)!)
//        svc.view.frame = CGRect(x: 50, y: 50, width: 180, height: 180)
        
 //     self.presentViewController(svc, animated: true, completion: nil)
     
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
    
    


}

