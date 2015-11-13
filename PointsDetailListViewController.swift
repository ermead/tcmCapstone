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
        
            if singles{
                var point = PointController.sharedController.points[index!]
                
                //point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
                
                topRightLabel.text = point.channel
                generalDescription.text = ("The point \(point.pinyinName) is located on the \(point.channel) meridian.")
                location.text = point.locationDescription
                indicationsAndUses.text = point.uses
        } else {
                var channel = ChannelController.sharedController.channels[index!]
    
                topRightLabel.text = channel.name
                generalDescription.text = ("The channel \(channel.name) is is used for \(channel.uses)")
                location.text = channel.name
                indicationsAndUses.text = channel.uses
        }
        
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
            if singles{
            updatePoint()
            } else {
                updateChannel()
            }
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
    
    func updateChannel(){
        
        let name = indicationsAndUses.text!
        let uses = indicationsAndUses.text
        
        let newCombo = Channel(name: name, uses: uses, context: Stack.sharedStack.managedObjectContext)
        ChannelController.sharedController.addCombo(newCombo)
        
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
        
        commentAlert.addAction(UIAlertAction(title: "...a New Point", style: .Default, handler: { (action) -> Void in
            self.herbsList = false
            self.singles = true
            self.setupNewPointScene()
            if let textfields = commentAlert.textFields{
                self.generalDescription.text = textfields[0].text
                self.locationLabel.text = textfields[1].text
                self.topRightLabel.text = textfields[2].text
            }
            }
            ))
        
        commentAlert.addAction(UIAlertAction(title: "...a New Point Combination", style: .Default, handler: { (action) -> Void in
            self.herbsList = false
            self.singles = false
            self.setupNewpointComboScene()
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
        self.herbsList = true
        self.singles = false
        self.title = "New Formula"
        let addButton = UIButton()
        addButton.backgroundColor = UIColor.blueColor()
        addButton.frame = CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2 , width: 100, height: 50)
        addButton.titleLabel!.text = "Add Button"
        addButton.addTarget(self, action: "addButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addButton)
        
    }
    
    func setupNewHerbScene(){
        print("setting up new Herb Scene")
        self.herbsList = true
        self.singles = true
        self.title = "New Herb"
    }
    
    func setupNewPointScene(){
        print("setting up new Point Scene")
        self.herbsList = false
        self.singles = true
        self.title = "New Point"
    }
    
    func setupNewpointComboScene(){
        print("setting up new Point Combination Scene")
        self.herbsList = false
        self.singles = false
        self.title = "New Point Combination"

        
    }
    
    @IBAction func addButtonTapped(sender: UIButton){
        
        print("ADD BUTTON TAPPED")
        
        let cvc = self.storyboard?.instantiateViewControllerWithIdentifier("combinations") as! CombinationsViewController
        self.presentViewController(cvc, animated: true, completion: nil)
        
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
