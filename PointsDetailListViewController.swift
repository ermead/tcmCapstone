//
//  PointsDetailListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointsDetailListViewController: UIViewController {
    
    var herb: Herb?
    var point: Point?
    
    var herbsList: Bool = true
    var singles: Bool = true
    var index:Int?
    var firstPicVisible: Bool = true
    var newFieldsColor = UIColor(red:0.012,  green:0.549,  blue:0.549, alpha: 0.2)
    
    @IBOutlet weak var togglePicOutlet: UIButton!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var generalDescription: UITextView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var indicationsAndUses: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" I loaded the index \(index)")
        
        if singles {
            print("I am loading up a single detail")
        } else {
            print("I am loading up a combination detail")
        }
        
        leftImage.alpha = 1
        rightImage.alpha = 0
        togglePicOutlet.setTitleColor(UIColor.blueColorDark(), forState: .Normal)
        
        if let index = index {
            
            populatePointInfo()
            
        } else {
            
            addNewPointEntry()
        }
        
    }
    
    @IBAction func TogglePictureButtonTapped(sender: UIButton) {
        
        if firstPicVisible{
            leftImage.alpha = 0
            rightImage.alpha = 1
            firstPicVisible = false
            
        } else {
            leftImage.alpha = 1
            rightImage.alpha = 0
            firstPicVisible = true
        }
        
    }
    
    
    func populatePointInfo() {
        if herbsList{
            
            var detailHerb = HerbsController.sharedController.herbs[index!]
            
            //detailHerb = Herb(pinyinName: detailHerb.pinyinName, botanicalName: detailHerb.botanicalName, englishName: detailHerb.englishName!, category: detailHerb.category, temp: detailHerb.temp, meridians: detailHerb.meridians, uses: detailHerb.uses, majorFormulas: detailHerb.majorFormulas)
            
            generalDescription.text = ("\(detailHerb.pinyinName!) is found in the major formula(s) \(detailHerb.majorFormulas!).")
            
            topRightLabel.text = detailHerb.englishName
            locationLabel.text = detailHerb.botanicalName
            location.text = "This herb, named \(detailHerb.pinyinName!), belongs to the category of \(detailHerb.category!). Having a \(detailHerb.temp!) temperature, it travels along the \(detailHerb.meridians!) channels."
            indicationsAndUses.text = detailHerb.uses
            
        } else {
        
        var point = PointController.points[index!]
        
        point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
        
        topRightLabel.text = point.channel
        generalDescription.text = ("The point \(point.pinyinName) is located on the \(point.channel) meridian.")
        location.text = point.locationDescription
        indicationsAndUses.text = point.uses
        }
        
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        print("save attempted")
        updateHerb()
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    func addNewPointEntry() {
        print("adding new point")
        leftImage.image = UIImage(named: "default")
        rightImage.image = UIImage(named: "default2")
        topRightLabel.text = ""
        topRightLabel.backgroundColor = newFieldsColor
        generalDescription.text = ""
        generalDescription.backgroundColor = newFieldsColor
        location.text = ""
        location.backgroundColor = newFieldsColor
        indicationsAndUses.text = ""
        indicationsAndUses.backgroundColor = newFieldsColor
        
    }
    
    func updateHerb() {
        
        let pinyinName = indicationsAndUses.text!
        let englishName = indicationsAndUses.text
        
        let newHerb = Herb(pinyinName: pinyinName, botanicalName: "", englishName: englishName, category: "", temp: "", meridians: "", uses: "", majorFormulas: "", context: Stack.sharedStack.managedObjectContext)
        
        HerbsController.sharedController.addHerb(newHerb)
        print("did I update?")
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
