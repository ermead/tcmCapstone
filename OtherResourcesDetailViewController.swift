//
//  OtherResourcesDetailViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/16/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class OtherResourcesDetailViewController: UIViewController {

    var titleB: String = "..."
    
    @IBAction func backButtonTapped(sender: UIBarButtonItem) {
        
         self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleB
        // Do any additional setup after loading the view.
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
