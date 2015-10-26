//
//  PointsListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var pointsTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PointController.points.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pointsCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = PointController.points[indexPath.row].pointOnMeridian
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPointDetail" {
            
        let index = pointsTableViewOutlet.indexPathForSelectedRow?.row
        
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
            
            print("the index touched was \(index) and the point selected was \(PointController.points[index!].pinyinName)")
                
            pdlc.title = PointController.points[index!].pointOnMeridian
            pdlc.index = index!

            }
                
        } else {
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                    print("preparing for a new point entry")
                    pdlc.title = "New Point"
            }
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
