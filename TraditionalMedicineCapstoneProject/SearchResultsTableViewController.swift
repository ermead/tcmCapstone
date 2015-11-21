//
//  SearchResultsTableViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/21/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var category: String = "Herb"
    var filteredHerbArray = [Herb]()
    var filteredPointArray = [Point]()
    var filteredChannelArray = [Channel]()
    var filteredFormulaArray = [Formula]()
    
    var placeholderHerbArray = [Herb]()
    var placeholderPointArray = [Point]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if category == "Herb"{
            return filteredHerbArray.count
        } else if category == "Point" {
            return filteredPointArray.count
        } else if category == "Channel" {
            return filteredChannelArray.count
        } else if category == "Formula"{
            return filteredFormulaArray.count
        } else {
            return 0
            print("Error assigning rows")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchResultsCell", forIndexPath: indexPath)
        
        if category == "Herb"{
            let herb = filteredHerbArray[indexPath.row]
            cell.textLabel?.text = herb.pinyinName
        } else if category == "Point" {
            let point = filteredPointArray[indexPath.row]
            cell.textLabel?.text = point.pinyinName
        } else if category == "Channel" {
            let channel = filteredChannelArray[indexPath.row]
            cell.textLabel?.text = channel.name
        } else if category == "Formula"{
            let formula = filteredFormulaArray[indexPath.row]
            cell.textLabel?.text = formula.pinyinName
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let herb = filteredHerbArray[indexPath.row]
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
