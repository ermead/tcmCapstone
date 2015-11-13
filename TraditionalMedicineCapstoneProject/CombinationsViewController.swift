//
//  CombinationsViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/12/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class CombinationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func BackButtonTapped(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("combination View loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = HerbsController.sharedController.herbs[indexPath.row].pinyinName
        cell.detailTextLabel?.text = HerbsController.sharedController.herbs[indexPath.row].englishName
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HerbsController.sharedController.herbs.count
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
