//
//  PointsListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit
import CoreData

class PointsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //toggle this var if herbs list or points list
    var herbsList: Bool = false
    var singles: Bool = true
   
    
    @IBOutlet weak var singleOrComboHerbsOutlet: UISegmentedControl!
    @IBOutlet weak var singleOrComboPointsOutlet: UISegmentedControl!
    
    @IBAction func BackToHomeTapped(sender: UIBarButtonItem) {
        
       // self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func SingleOrComboPoints(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            print("segment single points hit")
            singles = true
        } else {
            print("segment combo points hit")
            singles = false
        }
        
    }
    @IBAction func SingleOrComboHerbs(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            print("segment single herbs hit")
            singles = true
        } else {
            print("segment formulas hit")
            singles = false
        }
        
    }
    
    @IBAction func segmentedSwitched(sender: UISegmentedControl) {
      
        if(sender.selectedSegmentIndex == 0){
            print("segment points hit")
            herbsList = false
            singleOrComboHerbsOutlet.hidden = true
            singleOrComboPointsOutlet.hidden = false
            pointsTableViewOutlet.reloadData()

        } else {
            print("segment herbs hit")
            herbsList = true
            singleOrComboHerbsOutlet.hidden = false
            singleOrComboPointsOutlet.hidden = true
            pointsTableViewOutlet.reloadData()
        }
        
    }
   
    @IBOutlet weak var pointsTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleOrComboHerbsOutlet.hidden = true
        
        if herbsList == true {
            print("displaying herb list")
            singleOrComboHerbsOutlet.hidden = false
        } else {
            print("displaying point list")
        }
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if herbsList{
             return HerbsController.sharedController.herbs.count
        } else {
            return PointController.sharedController.points.count
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        pointsTableViewOutlet.reloadData()
        //print(HerbsController.sharedController.herbs)
        print(PointController.sharedController.points)
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 12
//    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if herbsList {
                let herb = HerbsController.sharedController.herbs[indexPath.row]
                HerbsController.sharedController.removeHerb(herb)
                tableView.reloadData()
            } else {
                let point = PointController.sharedController.points[indexPath.row]
                PointController.sharedController.removePoint(point)
                tableView.reloadData()
    
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pointsCell", forIndexPath: indexPath)
        
        if herbsList {
        
            cell.textLabel?.text = HerbsController.sharedController.herbs[indexPath.row].pinyinName
            cell.detailTextLabel?.text = HerbsController.sharedController.herbs[indexPath.row].englishName
           
        } else {
            cell.textLabel?.text = PointController.sharedController.points[indexPath.row].pointOnMeridian
            cell.detailTextLabel?.text = PointController.sharedController.points[indexPath.row].pinyinName

        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPointDetail" && herbsList == true {
        
            print("display herb detail")
            let index = pointsTableViewOutlet.indexPathForSelectedRow?.row
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                
                if singleOrComboHerbsOutlet.selectedSegmentIndex == 0 {
                    print("the index touched was \(index) and the point selected was \(HerbsController.sharedController.herbs[index!].pinyinName)")
                    pdlc.title = HerbsController.sharedController.herbs[index!].pinyinName
                    pdlc.index = index!
                    pdlc.herbsList = true
                    pdlc.singles = true
                } else {
                    print("the index touched was \(index) and the formula selected was UPDATE \(HerbsController.sharedController.herbs[index!].pinyinName)")
                    
                    pdlc.title = HerbsController.sharedController.herbs[index!].pinyinName
                    pdlc.index = index!
                    pdlc.herbsList = true
                    pdlc.singles = false
                }
            }

        
        } else if segue.identifier == "showPointDetail" && herbsList == false {
        
            
            let index = pointsTableViewOutlet.indexPathForSelectedRow?.row
        
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
            
                if singleOrComboPointsOutlet.selectedSegmentIndex == 0 {
                    print("the index touched was \(index) and the point selected was \(PointController.sharedController.points[index!].pinyinName)")
                    pdlc.title = PointController.sharedController.points[index!].pointOnMeridian
                    pdlc.index = index!
                    pdlc.herbsList = false
                    pdlc.singles = true
                } else {
                    print("the index touched was \(index) and the combination selected was UPDATE \(PointController.sharedController.points[index!].pinyinName)")
                    
                    pdlc.title = PointController.sharedController.points[index!].pointOnMeridian
                    pdlc.index = index!
                    pdlc.herbsList = false
                    pdlc.singles = false
                }
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
