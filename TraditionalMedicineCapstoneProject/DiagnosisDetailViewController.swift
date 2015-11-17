//
//  DiagnosisDetailViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/27/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class DiagnosisDetailViewController: UIViewController {

    var mainTitle = ""
    var specificCategory = ""
   
    @IBOutlet weak var mainTitleOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("the main title is \(mainTitle)")
        // Do any additional setup after loading the view.
      
        mainTitleOutlet.text =  self.mainTitle.stringByReplacingOccurrencesOfString(" ", withString: " \(specificCategory) ")
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
