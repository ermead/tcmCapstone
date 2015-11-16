//
//  PointsDetailListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointsDetailListViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var herb: Herb?
    var point: Point?
    
    var photos = [AnyObject]()
    var canEdit: Bool = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var herbsList: Bool = true
    var singles: Bool = true
    var index:Int?
    var firstPicVisible: Bool = true
    var newFieldsColor = UIColor(red:0.012,  green:0.549,  blue:0.549, alpha: 0.2)
    
    
    @IBOutlet weak var topRightTextField: UITextField!
    @IBOutlet weak var topRightMiddleTextField: UITextField!
    @IBOutlet weak var topRightBottomTextField: UITextField!
    
    @IBOutlet weak var togglePicOutlet: UIButton!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var indicationsAndUses: UITextView!
    
    var textFieldPlaceholderZero: String? = ""
    var textFieldPlaceholderOne: String? = ""
    var textFieldPlaceholderTwo: String? = ""
    
    var placeholderLeftImageId: String = ""
    var placeholderRightImageId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if canEdit{
            addButtonsToScene(true)
        }
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
            saveButton.title = "Edit"
            
        } else {
            
            addNewPointEntry()
            
        }
        
//        self.navigationItem.rightBarButtonItem?.enabled = false
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
        
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
            
            topRightTextField.text = detailHerb.pinyinName!
            topRightMiddleTextField.text = detailHerb.englishName
            topRightBottomTextField.text = detailHerb.botanicalName
                
            locationLabel.text = detailHerb.botanicalName
                
            location.text = "This herb, named \(detailHerb.pinyinName!), belongs to the category of \(detailHerb.category!). Having a \(detailHerb.temp!) temperature, it travels along the \(detailHerb.meridians!) channels."
                indicationsAndUses.text = detailHerb.uses
                
                if detailHerb.imageId1 != nil {
                ImageController.imageForImageId(detailHerb.imageId1!, completion: { (image) -> Void in
                    self.leftImage.image = image
                })}
                if detailHerb.imageId2 != nil {
                ImageController.imageForImageId(detailHerb.imageId2!, completion: { (image) -> Void in
                    self.rightImage.image = image
                })}
            }
            else {
                //FORMULA
                var detailHerb = FormulasController.sharedController.formulas[index!]
                print(detailHerb.pinyinName)
                print(detailHerb.englishName)
                print(detailHerb.uses)
               // generalDescription.text = ("\(detailHerb.pinyinName!) is used for \(detailHerb.uses!).")
                
                topRightTextField.text = detailHerb.pinyinName
                topRightMiddleTextField.text = detailHerb.englishName
                topRightBottomTextField.text = detailHerb.englishName
                locationLabel.text = detailHerb.pinyinName
                location.text = "This formula, contains how many and what herbs?"
                indicationsAndUses.text = detailHerb.uses
                
                if detailHerb.imageId1 != nil {
                ImageController.imageForImageId(detailHerb.imageId1!, completion: { (image) -> Void in
                    self.leftImage.image = image
                })}
                if detailHerb.imageId2 != nil {
                ImageController.imageForImageId(detailHerb.imageId2!, completion: { (image) -> Void in
                    self.rightImage.image = image
                })}
                
            }
            
            
        } else {
        
            if singles{
                var point = PointController.sharedController.points[index!]
                
                //point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
                
                topRightTextField.text = point.channel
                topRightMiddleTextField.text = point.pinyinName
                topRightBottomTextField.text = point.englishName
                location.text = point.locationDescription
                indicationsAndUses.text = point.uses
                
                if point.imageId1 != nil {
                ImageController.imageForImageId(point.imageId1!, completion: { (image) -> Void in
                    self.leftImage.image = image
                })}
                if point.imageId2 != nil {
                ImageController.imageForImageId(point.imageId2!, completion: { (image) -> Void in
                    self.rightImage.image = image
                })}
                
        } else {
                var channel = ChannelController.sharedController.channels[index!]
    
                topRightTextField.text = channel.name
                topRightMiddleTextField.text = channel.name
                topRightBottomTextField.text = channel.name
                location.text = channel.name
                indicationsAndUses.text = channel.uses
                
                if channel.imageId1 != nil {
                ImageController.imageForImageId(channel.imageId1!, completion: { (image) -> Void in
                    self.leftImage.image = image
                })}
                if channel.imageId2 != nil {
                ImageController.imageForImageId(channel.imageId2!, completion: { (image) -> Void in
                    self.rightImage.image = image
                })}
        }
        
    }
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        print("save attempted")
    
        if sender.title == "Save"{
        let saveAlert = UIAlertController(title: "Save this Entry", message: "as...", preferredStyle: .Alert)
        
        
            saveAlert.addAction(UIAlertAction(title: "Herb", style: .Default, handler: { (action) -> Void in
               self.updateHerb()
                }))
            saveAlert.addAction(UIAlertAction(title: "Formula", style: .Default, handler: { (action) -> Void in
               self.updateFormula()
                
            }))
        
            saveAlert.addAction(UIAlertAction(title: "Point", style: .Default, handler: { (action) -> Void in
               self.updatePoint()
            
            }))
        
            saveAlert.addAction(UIAlertAction(title: "Combination", style: .Default, handler: { (action) -> Void in
                self.updateChannel()
            
            }))
        
            saveAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            presentViewController(saveAlert, animated: true, completion: nil)
            
            ImageController.getImageIdFromPhoto(leftImage.image!) { (imageId) -> Void in
                
                if let imageId = imageId {
                    self.placeholderLeftImageId = imageId
                }
            }
            ImageController.getImageIdFromPhoto(rightImage.image!) { (imageId) -> Void in
            
            if let imageId = imageId {
                self.placeholderRightImageId = imageId
            }
            }
            
        self.addButtonsToScene(false)
            
        self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            print("it is Edit")
            canEdit = true
            addButtonsToScene(true)
            self.saveButton.title = "Save"
        }
        
    }
    func addNewPointEntry() {
        canEdit = true
        addButtonsToScene(true)
        print("adding new point")
        leftImage.image = UIImage(named: "default")
        rightImage.image = UIImage(named: "default2")
        topRightTextField.placeholder = "New Name"
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.placeholder = "new something"
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.placeholder = "soemthing else"
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.text = ""
        location.backgroundColor = newFieldsColor
        indicationsAndUses.text = ""
        indicationsAndUses.backgroundColor = newFieldsColor
        
    }
    
    func updateHerb() {
        
        let pinyinName = topRightTextField.text
        let botanicalName = ""
        let englishName = topRightMiddleTextField.text
        let category = ""
        let temp = ""
        let meridians = ""
        let uses = ""
        let majorFormulas = ""
        
        let newHerb = Herb(pinyinName: pinyinName, botanicalName: botanicalName, englishName: englishName!, category: category, temp: temp , meridians: meridians, uses: uses, majorFormulas: majorFormulas, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, context: Stack.sharedStack.managedObjectContext)
        
        HerbsController.sharedController.addHerb(newHerb)
       
    }
    
    
    func updatePoint() {
        
        let pinyinName = topRightTextField.text
        let englishName = topRightMiddleTextField.text
        let pointOnMeridan = ""
        let specialCategories = ""
        let locationDescription = location.text
        let channel = ""
        let uses = indicationsAndUses.text
        let imageName = ""
        
        let point = Point(pinyinName: pinyinName, englishName: englishName, pointOnMeridian: pointOnMeridan, specialCategories: specialCategories, locationDescription: locationDescription, channel: channel, uses: uses, imageName: imageName, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, context: Stack.sharedStack.managedObjectContext)
        
        PointController.sharedController.addPoint(point)
        print("I tried to add a point")
        
    }
    
    func updateFormula() {
        
        let pinyinName = topRightTextField.text
        let englishName = topRightMiddleTextField.text
        let uses = indicationsAndUses.text
    
        let newFormula = Formula(pinyinName: pinyinName, englishName: englishName, uses: uses, hasContents: [], imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, context: Stack.sharedStack.managedObjectContext)
        
        FormulasController.sharedController.addFormula(newFormula)
        print("I tried to add a new Formula")
    }
    
    func updateChannel(){
        
        let name = topRightTextField.text
        let uses = indicationsAndUses.text
        
        let newCombo = Channel(name: name, uses: uses, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, context: Stack.sharedStack.managedObjectContext)
        ChannelController.sharedController.addCombo(newCombo)
        print("I tried to add a new Combo")
    }
    
    
    @IBAction func NewButtonTapped(sender: UIBarButtonItem) {
        
        saveButton.title = "Save"
        canEdit = true
        
        let commentAlert = UIAlertController(title: "Add New", message: nil, preferredStyle: .Alert)
        
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Main Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Secondary Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Other Info"
        }
        commentAlert.addAction(UIAlertAction(title: "Herb", style: .Default, handler: { (action) -> Void in
            self.herbsList = true
            self.singles = true
            
            if let textfields = commentAlert.textFields{
                self.textFieldPlaceholderZero = textfields[0].text
                self.textFieldPlaceholderOne = textfields[1].text
                self.textFieldPlaceholderTwo = textfields[2].text
            }
            self.setupNewHerbScene()
            }
            ))

        commentAlert.addAction(UIAlertAction(title: "Formula", style: .Default, handler: { (action) -> Void in
            self.herbsList = true
            self.singles = false
           
            if let textfields = commentAlert.textFields{
                self.textFieldPlaceholderZero = textfields[0].text
                self.textFieldPlaceholderOne = textfields[1].text
                self.textFieldPlaceholderTwo = textfields[2].text
            }
             self.setupNewFormulaScene()
            }
            ))
        
        commentAlert.addAction(UIAlertAction(title: "Point", style: .Default, handler: { (action) -> Void in
            self.herbsList = false
            self.singles = true
            
            if let textfields = commentAlert.textFields{
                self.textFieldPlaceholderZero = textfields[0].text
                self.textFieldPlaceholderOne = textfields[1].text
                self.textFieldPlaceholderTwo = textfields[2].text
            }
            self.setupNewPointScene()
            }
            ))
        
        commentAlert.addAction(UIAlertAction(title: "Combination", style: .Default, handler: { (action) -> Void in
            self.herbsList = false
            self.singles = false
            
            if let textfields = commentAlert.textFields{
                self.textFieldPlaceholderZero = textfields[0].text
                self.textFieldPlaceholderOne = textfields[1].text
                self.textFieldPlaceholderTwo = textfields[2].text
            }
            self.setupNewpointComboScene()
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
        
        //togglePicOutlet
        //leftImage.image
        topRightTextField.text = self.textFieldPlaceholderZero!
        topRightMiddleTextField.text = self.textFieldPlaceholderOne!
        topRightBottomTextField.text = self.textFieldPlaceholderTwo!
        locationLabel.text = "Preparation and Dosage"
        location.text = "..."
        indicationsAndUses.text = "..."
        
        addButtonsToScene(true)

    }
    
    func setupNewHerbScene(){
        print("setting up new Herb Scene")
        self.herbsList = true
        self.singles = true
        self.title = "New Herb"
        
        //togglePicOutlet
        //leftImage.image
        topRightTextField.text = self.textFieldPlaceholderZero!
        topRightMiddleTextField.text = self.textFieldPlaceholderOne!
        topRightBottomTextField.text = self.textFieldPlaceholderTwo!
        locationLabel.text = "Preparation and Dosage"
        location.text = "..."
        indicationsAndUses.text = "..."
        
        addButtonsToScene(true)
        
    }
    
    func setupNewPointScene(){
        print("setting up new Point Scene")
        self.herbsList = false
        self.singles = true
        self.title = "New Point"
        
        //togglePicOutlet
        //leftImage.image
        topRightTextField.text = self.textFieldPlaceholderZero!
        topRightMiddleTextField.text = self.textFieldPlaceholderOne!
        topRightBottomTextField.text = self.textFieldPlaceholderTwo!
        locationLabel.text = "Location"
        location.text = "..."
        indicationsAndUses.text = "..."
        
        addButtonsToScene(true)
    }
    
    func setupNewpointComboScene(){
        print("setting up new Point Combination Scene")
        self.herbsList = false
        self.singles = false
        self.title = "New Point Combination"
        
        //togglePicOutlet
        //leftImage.image
        topRightTextField.text = self.textFieldPlaceholderZero!
        topRightMiddleTextField.text = self.textFieldPlaceholderOne!
        topRightBottomTextField.text = self.textFieldPlaceholderTwo!
        locationLabel.text = "General Strategy"
        location.text = "..."
        indicationsAndUses.text = "..."
        
        addButtonsToScene(true)

    }
    
    func addButtonsToScene(add: Bool){
        
        var addButton = UIButton()
        addButton.frame = CGRect(x: self.view.bounds.size.width/2+75, y: self.view.bounds.size.height/2-90 , width: 100, height: 50)
        addButton.setTitle("add Action", forState: .Normal)
        addButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(12))
        addButton.addTarget(self, action: "addButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addButton.layer.cornerRadius = CGFloat(5)
        addButton.backgroundColor = UIColor.blueColorDark()
        
        var addPhotoButton = UIButton()
        addPhotoButton.frame = CGRect(x: self.view.bounds.size.width/2-25, y: self.view.bounds.size.height/2-90 , width: 100, height: 50)
        addPhotoButton.setTitle("add photo", forState: .Normal)
        addPhotoButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(12))
        addPhotoButton.addTarget(self, action: "addPhotoButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        addPhotoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addPhotoButton.layer.cornerRadius = CGFloat(5)
        addPhotoButton.backgroundColor = UIColor.blueColorDark()
        
        self.view.addSubview(addButton)
        self.view.addSubview(addPhotoButton)
        
        if add{
           return
        } else {
            print("tried to remove buttons")
            if view.subviews.contains(addButton){
                print("well, I contain the addButton")
                addButton.removeFromSuperview() 
            }
            if view.subviews.contains(addPhotoButton){
                print("well, I contain the addPhotoButton")
                addPhotoButton.removeFromSuperview()
            }
        }
    }
    
    
    @IBAction func addButtonTapped(sender: UIButton){
        
        print("ADD BUTTON TAPPED")
        
        let cvc = self.storyboard?.instantiateViewControllerWithIdentifier("combinations") as! UINavigationController
        cvc.navigationItem.title = "Test"
        self.presentViewController(cvc, animated: true, completion: nil)
        
    }
    
    @IBAction func addPhotoButtonTapped(sender: UIButton){
       
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let photoChoiceAlert = UIAlertController(title: "Select Photo Location", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            photoChoiceAlert.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            photoChoiceAlert.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .Camera
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
            
        }
        
        photoChoiceAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(photoChoiceAlert, animated: true, completion: nil)

        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        if firstPicVisible{
            leftImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }else {
            rightImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return canEdit
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return canEdit
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
