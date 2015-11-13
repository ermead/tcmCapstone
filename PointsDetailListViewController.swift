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
            if singles{
            var detailHerb = HerbsController.sharedController.herbs[index!]
            
            //detailHerb = Herb(pinyinName: detailHerb.pinyinName, botanicalName: detailHerb.botanicalName, englishName: detailHerb.englishName!, category: detailHerb.category, temp: detailHerb.temp, meridians: detailHerb.meridians, uses: detailHerb.uses, majorFormulas: detailHerb.majorFormulas)
            
            generalDescription.text = ("\(detailHerb.pinyinName!) is found in the major formula(s) \(detailHerb.majorFormulas!).")
            
            topRightLabel.text = detailHerb.englishName
            locationLabel.text = detailHerb.botanicalName
            location.text = "This herb, named \(detailHerb.pinyinName!), belongs to the category of \(detailHerb.category!). Having a \(detailHerb.temp!) temperature, it travels along the \(detailHerb.meridians!) channels."
                indicationsAndUses.text = detailHerb.uses
            }
            else {
                //FORMULA
                var detailHerb = FormulasController.sharedController.formulas[index!]
                print(detailHerb.pinyinName)
                print(detailHerb.englishName)
                print(detailHerb.uses)
               // generalDescription.text = ("\(detailHerb.pinyinName!) is used for \(detailHerb.uses!).")
                
                topRightLabel.text = detailHerb.englishName
                locationLabel.text = detailHerb.pinyinName
                location.text = "This formula, contains how many and what herbs?"
                indicationsAndUses.text = detailHerb.uses
                
            }
            
            
        } else {
        
        var point = PointController.sharedController.points[index!]
        
        //point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
        
        topRightLabel.text = point.channel
        generalDescription.text = ("The point \(point.pinyinName) is located on the \(point.channel) meridian.")
        location.text = point.locationDescription
        indicationsAndUses.text = point.uses
        }
        
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        print("save attempted")
        if herbsList {
            if singles{
                updateHerb()
            } else {
                updateFormula()
            }
        } else {
            updatePoint()
        }
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
       
    }
    
    
    func updatePoint() {
        
        let pinyinName = indicationsAndUses.text!
        let englishName = indicationsAndUses.text!
        
        let point = Point(pinyinName: pinyinName, englishName: englishName, pointOnMeridian: englishName, specialCategories: "", locationDescription: "", channel: "", uses: "", imageName: "", context: Stack.sharedStack.managedObjectContext)
        
        PointController.sharedController.addPoint(point)
        print("well did I?")
        
    }
    
    func updateFormula() {
        
        let pinyinName = indicationsAndUses.text!
        let englishName = indicationsAndUses.text
        
        let newFormula = Formula(pinyinName: pinyinName, englishName: englishName, uses: "It has these uses", hasContents: [], context: Stack.sharedStack.managedObjectContext)
        
        FormulasController.sharedController.addFormula(newFormula)
        print("I tried to add a new Formula")
    }
    
    
    @IBAction func NewButtonTapped(sender: UIBarButtonItem) {
        
        let commentAlert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .Alert)
        
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Main Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Botanical Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Other Name"
        }
        commentAlert.addAction(UIAlertAction(title: "...a New Formula", style: .Default, handler: { (action) -> Void in
            self.herbsList = true
            self.singles = false
            self.setupNewFormulaScene()
            if let textfields = commentAlert.textFields{
                self.generalDescription.text = textfields[0].text
                self.locationLabel.text = textfields[1].text
                self.topRightLabel.text = textfields[2].text
            }
            }
            ))

        commentAlert.addAction(UIAlertAction(title: "...a New Herb", style: .Default, handler: { (action) -> Void in
            self.herbsList = true
            self.singles = true
            self.setupNewHerbScene()
            if let textfields = commentAlert.textFields{
                self.generalDescription.text = textfields[0].text
                self.locationLabel.text = textfields[1].text
                self.topRightLabel.text = textfields[2].text
            }
            }
            ))

        
        commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        presentViewController(commentAlert, animated: true, completion: nil)
        
        
    }
    
    
    func setupNewFormulaScene(){
        print("setting up new Formula Scene")
        self.title = "New Formula"
        
    }
    
    func setupNewHerbScene(){
        print("setting up new Herb Scene")
        self.title = "New Herb"
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
