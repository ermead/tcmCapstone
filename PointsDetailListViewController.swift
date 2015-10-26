//
//  PointsDetailListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointsDetailListViewController: UIViewController {

    var index:Int?
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var generalDescription: UITextView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var indicationsAndUses: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" I loaded the index \(index)")
        
        if let index = index{
            populatePointInfo()
        } else {
            addNewPointEntry()
        }
        
    }
    
    func populatePointInfo() {
        
        
    }
    
    func addNewPointEntry() {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
