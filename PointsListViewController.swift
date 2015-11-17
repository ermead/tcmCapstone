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
    
    @IBOutlet weak var buttonStackOutlet: UIStackView!
    
    @IBOutlet weak var button1a: UIButton!
    @IBOutlet weak var button1b: UIButton!
    @IBOutlet weak var button1c: UIButton!
    @IBOutlet weak var button1d: UIButton!
    @IBOutlet weak var button2a: UIButton!
    @IBOutlet weak var button2b: UIButton!
    @IBOutlet weak var button2c: UIButton!
    @IBOutlet weak var button2d: UIButton!
    
    @IBAction func BackToHomeTapped(sender: UIButton) {
        print("back button")
        
        if buttonStackOutlet.hidden == true{
        buttonStackOutlet.hidden = false
        } else { buttonStackOutlet.hidden = true }
        
       self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
//    @IBAction func SingleOrComboPoints(sender: UISegmentedControl) {
//        if(sender.selectedSegmentIndex == 0){
//            print("segment single points hit")
//            singles = true
//            pointsTableViewOutlet.reloadData()
//        } else {
//            print("segment combo points hit")
//            singles = false
//            pointsTableViewOutlet.reloadData()
//        }
//        
//    }
//    @IBAction func SingleOrComboHerbs(sender: UISegmentedControl) {
//        if(sender.selectedSegmentIndex == 0){
//            print("segment single herbs hit")
//            singles = true
//            pointsTableViewOutlet.reloadData()
//        } else {
//            print("segment formulas hit")
//            singles = false
//            pointsTableViewOutlet.reloadData()
//        }
//        
//    }
    
    @IBAction func segmentedSwitched(sender: UISegmentedControl) {
      
        if(sender.selectedSegmentIndex == 0){
            print("segment points hit")
            herbsList = false
            singles = true
            pointsTableViewOutlet.reloadData()

        } else if(sender.selectedSegmentIndex == 1) {
            print("segment combos hit")
            herbsList = false
            singles = false
            pointsTableViewOutlet.reloadData()
        } else if(sender.selectedSegmentIndex == 2) {
             print("segment herbs hit")
            herbsList = true
            singles = true
            pointsTableViewOutlet.reloadData()
        } else if(sender.selectedSegmentIndex == 3){
             print("segment formulas hit")
            herbsList = true
            singles = false
            pointsTableViewOutlet.reloadData()
        } else {
            print("error on segmented switch")
            pointsTableViewOutlet.reloadData()
        }
        
    }
   
    @IBOutlet weak var pointsTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStackOutlet.hidden = true
        
        if herbsList == true {
            print("displaying herb list")
            singleOrComboHerbsOutlet.hidden = false
        } else {
            print("displaying point list")
        }
        
        setupButtons()
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if herbsList{
            if singles{
                return HerbsController.sharedController.herbs.count
            } else {
                return FormulasController.sharedController.formulas.count
            }
        } else {
            if singles{
                return PointController.sharedController.points.count
            } else {
                return ChannelController.sharedController.channels.count
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        pointsTableViewOutlet.reloadData()
        //print(HerbsController.sharedController.herbs)
        //print(PointController.sharedController.points)
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 12
//    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if herbsList {
                if singles{
                let herb = HerbsController.sharedController.herbs[indexPath.row]
                HerbsController.sharedController.removeHerb(herb)
                tableView.reloadData()
                } else {
                    let formula = FormulasController.sharedController.formulas[indexPath.row]
                    FormulasController.sharedController.removeFormula(formula)
                    tableView.reloadData()  
                }
            } else {
                if singles{
                let point = PointController.sharedController.points[indexPath.row]
                PointController.sharedController.removePoint(point)
                tableView.reloadData()
                } else {
                    let combo = ChannelController.sharedController.channels[indexPath.row]
                    ChannelController.sharedController.removeCombo(combo)
                    tableView.reloadData()
                }
    
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pointsCell", forIndexPath: indexPath)
        
        if herbsList {
            if singles{
            cell.textLabel?.text = HerbsController.sharedController.herbs[indexPath.row].pinyinName
            cell.detailTextLabel?.text = HerbsController.sharedController.herbs[indexPath.row].englishName
                if HerbsController.sharedController.herbs[indexPath.row].imageId1 != nil{
           /* ImageController.imageForImageId(HerbsController.sharedController.herbs[indexPath.row].imageId1!, completion: { (image) -> Void in
                
                 cell.imageView?.image = image
 
            })
            */
                }
            } else {
                cell.textLabel?.text = FormulasController.sharedController.formulas[indexPath.row].pinyinName
                cell.detailTextLabel?.text = FormulasController.sharedController.formulas[indexPath.row].englishName
            }
           
        } else {
            if singles{
            cell.textLabel?.text = PointController.sharedController.points[indexPath.row].pointOnMeridian
            cell.detailTextLabel?.text = PointController.sharedController.points[indexPath.row].pinyinName
            } else {
                cell.textLabel?.text = ChannelController.sharedController.channels[indexPath.row].name
                cell.detailTextLabel?.text = ChannelController.sharedController.channels[indexPath.row].uses
            }

        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPointDetail" && herbsList == true {
        
            print("display herb detail")
            let index = pointsTableViewOutlet.indexPathForSelectedRow?.row
        
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
                
                if singles == true {
                    print("the index touched was \(index) and the point selected was \(HerbsController.sharedController.herbs[index!].pinyinName)")
                    pdlc.title = HerbsController.sharedController.herbs[index!].pinyinName
                    pdlc.index = index!
                    pdlc.herbsList = true
                    pdlc.singles = true
                } else {
                    print("the index touched was \(index) and the formula selected was \(FormulasController.sharedController.formulas[index!].pinyinName)")
                    
                    pdlc.title = FormulasController.sharedController.formulas[index!].pinyinName
                    pdlc.index = index!
                    pdlc.herbsList = true
                    pdlc.singles = false
                }
            }

        
        } else if segue.identifier == "showPointDetail" && herbsList == false {
        
            
            let index = pointsTableViewOutlet.indexPathForSelectedRow?.row
        
            if let pdlc : PointsDetailListViewController = segue.destinationViewController as? PointsDetailListViewController {
            
                if singles == true {
                    print("the index touched was \(index) and the point selected was \(PointController.sharedController.points[index!].pinyinName)")
                    pdlc.title = PointController.sharedController.points[index!].pointOnMeridian
                    pdlc.index = index!
                    pdlc.herbsList = false
                    pdlc.singles = true
                } else {
                    print("the index touched was \(index) and the combination selected was \(ChannelController.sharedController.channels[index!].name)")
                    
                    pdlc.title = ChannelController.sharedController.channels[index!].name
                    pdlc.index = index!
                    pdlc.herbsList = false
                    pdlc.singles = false
                }
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
