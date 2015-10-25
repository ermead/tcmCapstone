//
//  HerbsListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class HerbsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var herbsListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HerbsController.herbs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("herbsCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = HerbsController.herbs[indexPath.row].englishName
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let index = herbsListTableView.indexPathForSelectedRow?.row
        
        if let hldc: HerbsListDetailViewController = segue.destinationViewController as? HerbsListDetailViewController{
             print("the index touched was \(index) and the herb selected was \(HerbsController.herbs[index!].englishName)")
            
            hldc.title = HerbsController.herbs[index!].englishName
            hldc.index = index!
        }
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
