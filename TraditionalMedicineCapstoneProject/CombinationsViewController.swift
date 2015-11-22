//
//  CombinationsViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/12/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class CombinationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    @IBOutlet weak var tableView: UITableView!
   
    var thisFormula: Formula?
    var thisChannel: Channel?
    
    var herbsList = true
    var searchController: UISearchController!
    
    var index: Int?
    
    @IBOutlet weak var topRightAddButtonOutlet: UIButton!
    
    var filteredHerbArray: [Herb] = []
    var filteredPointArray: [Point] = []
    
    @IBOutlet weak var buttonStackOutlet: UIStackView!
    
    @IBOutlet weak var button1a: UIButton!
    @IBOutlet weak var button1b: UIButton!
    @IBOutlet weak var button1c: UIButton!
    @IBOutlet weak var button1d: UIButton!
    @IBOutlet weak var button2a: UIButton!
    @IBOutlet weak var button2b: UIButton!
    @IBOutlet weak var button2c: UIButton!
    @IBOutlet weak var button2d: UIButton!

    @IBAction func BackButtonTapped(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func collapseButtonTapped(sender: UIButton) {
        
        print("unfold buttons")
        
        if buttonStackOutlet.hidden == true{
            buttonStackOutlet.hidden = false
        } else { buttonStackOutlet.hidden = true }
        
    }
    
    @IBAction func topRightAddButtonTapped(sender: UIButton) {
        
        if searchController.searchBar.hidden == true{
            searchController.searchBar.hidden = false
        } else { searchController.searchBar.hidden = true }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        topRightAddButtonOutlet.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        buttonStackOutlet.hidden = true
        setupSearchController()
        searchController.searchBar.hidden = true
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
        
        print("combination View loaded")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if herbsList == true{
            cell.textLabel?.text = filteredHerbArray[indexPath.row].pinyinName
            cell.detailTextLabel?.text = filteredHerbArray[indexPath.row].englishName
        } else {
            cell.textLabel?.text = filteredPointArray[indexPath.row].pinyinName
            cell.detailTextLabel?.text = filteredPointArray[indexPath.row].englishName
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if herbsList == true {
            return filteredHerbArray.count
        } else {
            return filteredPointArray.count
        }
    }
    
    func setupSearchController(){
        
        let resultsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SearchResults")
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "search for new herbs to add"
        tableView.tableHeaderView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
     
    }
    
    // MARK: - Search Results Updating Protocol
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchTerm = searchController.searchBar.text!.lowercaseString ?? " "
        
        let resultsViewController = searchController.searchResultsController as! SearchResultsTableViewController
        
        if herbsList{
                resultsViewController.addingToFormula = true
                resultsViewController.thisFormula = self.thisFormula
                resultsViewController.category = "Herb"
                resultsViewController.filteredHerbArray = HerbsController.sharedController.herbs.filter({ $0.pinyinName!.lowercaseString.containsString(searchTerm) })
            } else {
                resultsViewController.addingToChannel = true
                resultsViewController.thisChannel = self.thisChannel
                resultsViewController.category = "Point"
                resultsViewController.filteredPointArray = PointController.sharedController.points.filter({ $0.pinyinName!.lowercaseString.containsString(searchTerm) })
            }
        
        resultsViewController.tableView.reloadData()
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPointDetail" && herbsList == true {
            
            print("display herb detail")
            let index = tableView.indexPathForSelectedRow?.row
            
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                
                    print("the index touched was \(index) and the point selected was \(filteredHerbArray[index!].pinyinName)")
                    pdlc.searchedFor = true
                    pdlc.isHideButtonHidden = false
                    pdlc.filteredHerbArray = self.filteredHerbArray
                    if thisFormula != nil {
                        pdlc.title = "Ingredient in \(thisFormula!.pinyinName!)"
                    }
                    pdlc.index = index!
                    pdlc.herbsList = true
                    pdlc.singles = true
                    pdlc.navigationItem.rightBarButtonItem?.enabled = false

            }
            
        } else if segue.identifier == "showPointDetail" && herbsList == false {
            
            
            let index = tableView.indexPathForSelectedRow?.row
            
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                
                    print("the index touched was \(index) and the point selected was \(filteredPointArray[index!].pinyinName)")
                    pdlc.searchedFor = true
                    pdlc.isHideButtonHidden = false
                    pdlc.filteredPointArray = self.filteredPointArray
                    pdlc.title = filteredPointArray[index!].pinyinName
                    pdlc.index = index!
                    pdlc.herbsList = false
                    pdlc.singles = true
                }
            } else {
            
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                    print("preparing for a new entry")
                    pdlc.title = "New Entry"
                        if herbsList == false {
                            pdlc.herbsList = false
                }
            }
        }
    }
    
    func setupButtons() {
        let titleColor = UIColor.WhiteMetal()
        let borderColor = UIColor.blueColorLight().CGColor
        let borderWidth = CGFloat(0.25)
        let backgroundColor = UIColor.blueColorMedium()
        let fontsize = UIFont.systemFontOfSize(12)
        let cornerRadius = CGFloat(2)
        
        button1a.backgroundColor = backgroundColor
        button1a.setTitleColor(titleColor, forState: .Normal)
        button1a.setTitle("action", forState: .Normal)
        button1a.layer.borderColor = borderColor
        button1a.layer.borderWidth = borderWidth
        button1a.titleLabel?.font = fontsize
        button1a.layer.cornerRadius = cornerRadius
        
        button1b.backgroundColor = backgroundColor
        button1b.setTitleColor(titleColor, forState: .Normal)
        button1b.setTitle("action", forState: .Normal)
        button1b.layer.borderColor = borderColor
        button1b.layer.borderWidth = borderWidth
        button1b.titleLabel?.font = fontsize
        button1b.layer.cornerRadius = cornerRadius
        
        button1c.backgroundColor = backgroundColor
        button1c.setTitleColor(titleColor, forState: .Normal)
        button1c.setTitle("action", forState: .Normal)
        button1c.layer.borderColor = borderColor
        button1c.layer.borderWidth = borderWidth
        button1c.titleLabel?.font = fontsize
        button1c.layer.cornerRadius = cornerRadius
        
        
        button1d.backgroundColor = backgroundColor
        button1d.setTitleColor(titleColor, forState: .Normal)
        button1d.setTitle("action", forState: .Normal)
        button1d.layer.borderColor = borderColor
        button1d.layer.borderWidth = borderWidth
        button1d.titleLabel?.font = fontsize
        button1d.layer.cornerRadius = cornerRadius
        
        button2a.backgroundColor = backgroundColor
        button2a.setTitleColor(titleColor, forState: .Normal)
        button2a.setTitle("action", forState: .Normal)
        button2a.layer.borderColor = borderColor
        button2a.layer.borderWidth = borderWidth
        button2a.titleLabel?.font = fontsize
        button2a.layer.cornerRadius = cornerRadius
        
        button2b.backgroundColor = backgroundColor
        button2b.setTitleColor(titleColor, forState: .Normal)
        button2b.setTitle("action", forState: .Normal)
        button2b.layer.borderColor = borderColor
        button2b.layer.borderWidth = borderWidth
        button2b.titleLabel?.font = fontsize
        button2b.layer.cornerRadius = cornerRadius
        
        button2c.backgroundColor = backgroundColor
        button2c.setTitleColor(titleColor, forState: .Normal)
        button2c.setTitle("action", forState: .Normal)
        button2c.layer.borderColor = borderColor
        button2c.layer.borderWidth = borderWidth
        button2c.titleLabel?.font = fontsize
        button2c.layer.cornerRadius = cornerRadius
        
        button2d.backgroundColor = backgroundColor
        button2d.setTitleColor(titleColor, forState: .Normal)
        button2d.setTitle("action", forState: .Normal)
        button2d.layer.borderColor = borderColor
        button2d.layer.borderWidth = borderWidth
        button2d.titleLabel?.font = fontsize
        button2d.layer.cornerRadius = cornerRadius
        
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
