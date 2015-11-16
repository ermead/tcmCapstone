//
//  OtherResourcesViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/16/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class OtherResourcesViewController: UIViewController {
    
    var titleA: String = "TEST"

    @IBOutlet weak var button1Outlet: UIButton!
    @IBOutlet weak var button2Outlet: UIButton!
    @IBOutlet weak var button3Outlet: UIButton!
    @IBOutlet weak var button4Outlet: UIButton!
    @IBOutlet weak var button5Outlet: UIButton!
    @IBOutlet weak var button6Outlet: UIButton!
    @IBOutlet weak var button7Outlet: UIButton!
    @IBOutlet weak var button8Outlet: UIButton!
    @IBOutlet weak var button9Outlet: UIButton!
    
    
    var arrayOfButtonNames: [String] = []
    
    @IBAction func buttonedTapped(sender: UIButton){
        print("button \(sender.titleLabel!.text) got tapped")
        
            self.titleA = sender.titleLabel!.text!
        
        
//        if sender.restorationIdentifier! == "1" {
//          print(sender.restorationIdentifier)
//          self.titleA = sender.titleLabel!.text!
//        } else {
//            print("not it!")
//            titleA = "something else"
//        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    if segue.identifier == "toOtherResourcesDetailView" {
        
        print("display other resources detail")
        
    
            if let ordc : OtherResourcesDetailViewController = segue.destinationViewController as? OtherResourcesDetailViewController {
                print("This is going well")
                ordc.titleB = self.titleA
            } else {
                print("error preparing")
              
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        // Do any additional setup after loading the view.
    }

    func setUpButtons() {
        arrayOfButtonNames = ["Microsystems", "Yoga Postures", "EFT", "Classical Quotes", "Songs", "Pulse", "Tongue", "Quiz", "Diet"]
        
            self.button1Outlet.setTitle(arrayOfButtonNames[0], forState: .Normal)
            self.button2Outlet.setTitle(arrayOfButtonNames[1], forState: .Normal)
            self.button3Outlet.setTitle(arrayOfButtonNames[2], forState: .Normal)
            self.button4Outlet.setTitle(arrayOfButtonNames[3], forState: .Normal)
            self.button5Outlet.setTitle(arrayOfButtonNames[4], forState: .Normal)
            self.button6Outlet.setTitle(arrayOfButtonNames[5], forState: .Normal)
            self.button7Outlet.setTitle(arrayOfButtonNames[6], forState: .Normal)
            self.button8Outlet.setTitle(arrayOfButtonNames[7], forState: .Normal)
            self.button9Outlet.setTitle(arrayOfButtonNames[8], forState: .Normal)
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
