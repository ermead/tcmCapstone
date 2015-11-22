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
    @IBOutlet weak var hideButtonOutlet: UIButton!
    @IBOutlet weak var addToButtonOutlet: UIButton!
    
    var herbsList: Bool = true
    var singles: Bool = true
    var index:Int?
    
    var firstPicVisible: Bool = true
    var newFieldsColor = UIColor(red:0.012,  green:0.549,  blue:0.549, alpha: 0.1)
    
    var searchedFor: Bool = false
    var isHideButtonHidden: Bool = true
    var isAddToButtonHidden: Bool = true
    
    var addingToFormula: Bool?
    var thisFormula: Formula?
    var addingToChannel: Bool?
    var thisChannel: Channel?
    
    var category: String = "Herb"
    var filteredHerbArray = [Herb]()
    var filteredPointArray = [Point]()
    var filteredChannelArray = [Channel]()
    var filteredFormulaArray = [Formula]()
    
    
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
    
    var placeholderLeftImageData = NSData?()
    var placeholderRightImageData = NSData?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButtonOutlet.hidden = isHideButtonHidden
        addToButtonOutlet.hidden = isAddToButtonHidden
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        
        location.contentInset = UIEdgeInsetsMake(50.0,0.0,0,0.0)
        indicationsAndUses.contentInset = UIEdgeInsetsMake(20.0, 0, 0, 0)
        
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
        togglePicOutlet.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        togglePicOutlet.backgroundColor = UIColor.blueColorDark()
        togglePicOutlet.layer.cornerRadius = 4
        togglePicOutlet.layer.borderColor = UIColor.blueColorDark().CGColor
        togglePicOutlet.layer.borderWidth = 1
        
        if let index = index {
            
            populatePointInfo()
            saveButton.title = "Edit"
            
        } else {
            
            addNewPointEntry()
            
        }
        
        topRightTextField.layer.cornerRadius = 5
        topRightMiddleTextField.layer.cornerRadius = 5
        topRightBottomTextField.layer.cornerRadius = 5
        location.layer.cornerRadius = 5
        indicationsAndUses.layer.cornerRadius = 5
        
        
//        self.navigationItem.rightBarButtonItem?.enabled = false
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
        if let items = self.navigationController?.navigationBar.items {
            print(items)
            
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
    
    @IBAction func addToButtonTapped(sender: UIButton) {
        if addingToFormula == true {
            let detailHerb = filteredHerbArray[index!]
            print("I'm attempting to add \(detailHerb.pinyinName) to the formula \(thisFormula)")
            if let set = thisFormula!.hasContents{
                var newArray = set.allObjects as! [Herb]
                newArray.append(detailHerb)
                thisFormula?.hasContents = NSSet(array: newArray)
                do {
                    
                 try thisFormula?.managedObjectContext?.save()
                } catch {
                    print("error adding to formula")
                }
            }
            print("now, this formula's contents is \(thisFormula?.hasContents)")
            print("now, the number of contents is \(thisFormula?.hasContents?.count)")
            
        } else if addingToChannel == true {
            
            
            
        } else {
            print("not adding to anything")
        }
        
        
    }
    
    @IBAction func hideButtonTapped(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func populatePointInfo() {
        if herbsList{
            if singles{
            var detailHerb = HerbsController.sharedController.herbs[index!]
                
                if self.searchedFor == true {
                   
                    detailHerb = filteredHerbArray[index!]

                }
            
            //detailHerb = Herb(pinyinName: detailHerb.pinyinName, botanicalName: detailHerb.botanicalName, englishName: detailHerb.englishName!, category: detailHerb.category, temp: detailHerb.temp, meridians: detailHerb.meridians, uses: detailHerb.uses, majorFormulas: detailHerb.majorFormulas)
            
            topRightTextField.text = detailHerb.pinyinName!
            topRightMiddleTextField.text = detailHerb.englishName
            topRightBottomTextField.text = detailHerb.botanicalName
                
            //locationLabel.text = detailHerb.botanicalName
                
            location.text = "This herb, named \(detailHerb.pinyinName!), belongs to the category of \(detailHerb.category!). Having a \(detailHerb.temp!) temperature, it travels along the \(detailHerb.meridians!) channels."
                indicationsAndUses.text = detailHerb.uses
                
                if detailHerb.images != nil{
                    let imageSet = detailHerb.images
                    
                    print("The number of images in this set is \(imageSet!.count)")
                    
                    let imageArray: [Image] = imageSet!.allObjects as! [Image]
                    
                    print("there are \(imageArray.count) images in the array")
                    
                    if imageArray.count >= 2 {
                        if let imageA = ImageController.getImageFromData(imageArray[0].imageData!){
                            self.leftImage.image = imageA
                        }
                        if let imageB = ImageController.getImageFromData(imageArray[1].imageData!){
                            self.rightImage.image = imageB
                        }
                    } else {
                        return
                    }

                }
                
//                if detailHerb.imageId1 != nil {
//                ImageController.imageForImageId(detailHerb.imageId1!, completion: { (image) -> Void in
//                    self.leftImage.image = image
//                })}
//                if detailHerb.imageId2 != nil {
//                ImageController.imageForImageId(detailHerb.imageId2!, completion: { (image) -> Void in
//                    self.rightImage.image = image
//                })}
            }
            else {
                //FORMULA
                var detailFormula = FormulasController.sharedController.formulas[index!]
                
                if self.searchedFor == true {
                    
                    detailFormula = filteredFormulaArray[index!]
                    
                }
                print(detailFormula.pinyinName)
                print(detailFormula.englishName)
                print(detailFormula.uses)
               // generalDescription.text = ("\(detailHerb.pinyinName!) is used for \(detailHerb.uses!).")
                
                topRightTextField.text = detailFormula.pinyinName
                topRightMiddleTextField.text = detailFormula.englishName
                topRightBottomTextField.text = "  "
                //locationLabel.text = detailHerb.pinyinName
                location.text = "This formula, contains how many and what herbs?"
                indicationsAndUses.text = detailFormula.uses
                
                if detailFormula.images != nil{
                    let imageSet = detailFormula.images
                    
                    print("The number of images in this set is \(imageSet!.count)")
                    
                    let imageArray: [Image] = imageSet!.allObjects as! [Image]
                    
                    print("there are \(imageArray.count) images in the array")
                    
                    if imageArray.count >= 2 {
                        if let imageA = ImageController.getImageFromData(imageArray[0].imageData!){
                            self.leftImage.image = imageA
                        }
                        if let imageB = ImageController.getImageFromData(imageArray[1].imageData!){
                            self.rightImage.image = imageB
                        }
                    } else if detailFormula.hasContents != nil {
                        let set = detailFormula.hasContents
                        print("The number of things in this set is \(set!.count)")
                        
                        let setArray: [Herb] = set!.allObjects as! [Herb]
                        
                        print("there are \(setArray.count) things in this array")
                        
                        for herb in setArray{
                            print("my name is \(herb.pinyinName), and I am in \(detailFormula.pinyinName)")
                        }
                        
                    } else {
                        return
                    }
                    
                }
                
                if detailFormula.imageId1 != nil {
                ImageController.imageForImageId(detailFormula.imageId1!, completion: { (image) -> Void in
                    self.leftImage.image = image
                })}
                if detailFormula.imageId2 != nil {
                ImageController.imageForImageId(detailFormula.imageId2!, completion: { (image) -> Void in
                    self.rightImage.image = image
                })}
                
            }
            
            
        } else {
        
            if singles{
                var point = PointController.sharedController.points[index!]
                
                if self.searchedFor == true {
                    
                    point = filteredPointArray[index!]
                    
                }
                
                //point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
                
                topRightTextField.text = point.pinyinName
                topRightMiddleTextField.text = point.englishName
                topRightBottomTextField.text = point.pointOnMeridian
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
                
                if self.searchedFor == true {
                    
                    channel = filteredChannelArray[index!]
                    
                }
    
                topRightTextField.text = channel.name
                topRightMiddleTextField.text = "  "
                topRightBottomTextField.text = "  "
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
            
            self.placeholderLeftImageData = ImageController.getDataFromImage(self.leftImage.image!)
            
            self.placeholderRightImageData = ImageController.getDataFromImage(self.rightImage.image!)
//            
//            topRightTextField.backgroundColor = .whiteColor()
//            topRightMiddleTextField.backgroundColor = .whiteColor()
//            topRightBottomTextField.backgroundColor = .whiteColor()
//            location.backgroundColor = .whiteColor()
//            indicationsAndUses.backgroundColor = .whiteColor()
            
        self.addButtonsToScene(false)
            
        self.navigationController?.popViewControllerAnimated(true)
            
            
            
        } else {
            print("it is Edit")
            canEdit = true
            addButtonsToScene(true)
            self.saveButton.title = "Save"
            topRightTextField.backgroundColor = newFieldsColor
            topRightMiddleTextField.backgroundColor = newFieldsColor
            topRightBottomTextField.backgroundColor = newFieldsColor
            location.backgroundColor = newFieldsColor
            indicationsAndUses.backgroundColor = newFieldsColor
            
            self.navigationItem.rightBarButtonItem?.image = nil
            self.navigationItem.rightBarButtonItem?.title = "Cancel"
        }
        
    }
    func addNewPointEntry() {
        canEdit = true
        addButtonsToScene(true)
        print("adding new point")
        leftImage.image = UIImage(named: "default")
        rightImage.image = UIImage(named: "default2")
        topRightTextField.placeholder = "New Name"
        topRightMiddleTextField.placeholder = "new something"
        topRightBottomTextField.placeholder = "soemthing else"
        location.text = ""
        indicationsAndUses.text = ""
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.backgroundColor = newFieldsColor
        indicationsAndUses.backgroundColor = newFieldsColor
        
    }
    
    func updateHerb() {
        
        let pinyinName = topRightTextField.text
        let botanicalName = topRightBottomTextField.text
        let englishName = topRightMiddleTextField.text
        let category = ""
        let temp = ""
        let meridians = ""
        let uses = indicationsAndUses.text
        let majorFormulas = ""
    
        let imageObject1 = Image(data: placeholderLeftImageData, context: Stack.sharedStack.managedObjectContext)
        
        let imageObject2 = Image(data: placeholderRightImageData, context: Stack.sharedStack.managedObjectContext)
        
        ImagesController.sharedController.addImage(imageObject1)
        ImagesController.sharedController.addImage(imageObject2)
        
        let arrayofImageObjects: [Image] = [imageObject1, imageObject2]
        let thisSetOfImageObjects = NSSet(array: arrayofImageObjects)
        
        //thisSetOfImageObjects.setByAddingObjectsFromArray(arrayofImageObjects)
        print("This set I am adding has \(thisSetOfImageObjects.count) image objects")
        
        let newHerb = Herb(pinyinName: pinyinName, botanicalName: botanicalName, englishName: englishName!, category: category, temp: temp , meridians: meridians, uses: uses, majorFormulas: majorFormulas, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, images: thisSetOfImageObjects, context: Stack.sharedStack.managedObjectContext)
        
        
        HerbsController.sharedController.addHerb(newHerb)
        //print("Here are my images in data form: \(newHerb.images)")
       
    }
    

    
    func updatePoint() {
        
        let pinyinName = topRightTextField.text
        let englishName = topRightMiddleTextField.text
        let pointOnMeridan = topRightBottomTextField.text
        let specialCategories = ""
        let locationDescription = location.text
        let channel = ""
        let uses = indicationsAndUses.text
        let imageName = ""
        
        let imageObject1 = Image(data: placeholderLeftImageData, context: Stack.sharedStack.managedObjectContext)
        
        let imageObject2 = Image(data: placeholderRightImageData, context: Stack.sharedStack.managedObjectContext)
        
        ImagesController.sharedController.addImage(imageObject1)
        ImagesController.sharedController.addImage(imageObject2)
        
        let arrayofImageObjects: [Image] = [imageObject1, imageObject2]
        let thisSetOfImageObjects = NSSet(array: arrayofImageObjects)
        
        //thisSetOfImageObjects.setByAddingObjectsFromArray(arrayofImageObjects)
        print("This set I am adding has \(thisSetOfImageObjects.count) image objects")

        
        
        let point = Point(pinyinName: pinyinName, englishName: englishName, pointOnMeridian: pointOnMeridan, specialCategories: specialCategories, locationDescription: locationDescription, channel: channel, uses: uses, imageName: imageName, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, images: thisSetOfImageObjects, context: Stack.sharedStack.managedObjectContext)
        
        PointController.sharedController.addPoint(point)
        print("I tried to add a point")
        
    }
    
    func updateFormula() {
        
        let pinyinName = topRightTextField.text
        let englishName = topRightMiddleTextField.text
        let uses = indicationsAndUses.text
        
        
        let imageObject1 = Image(data: placeholderLeftImageData, context: Stack.sharedStack.managedObjectContext)
        
        let imageObject2 = Image(data: placeholderRightImageData, context: Stack.sharedStack.managedObjectContext)
        
        ImagesController.sharedController.addImage(imageObject1)
        ImagesController.sharedController.addImage(imageObject2)
        
        let arrayofImageObjects: [Image] = [imageObject1, imageObject2]
        let thisSetOfImageObjects = NSSet(array: arrayofImageObjects)
        
        //thisSetOfImageObjects.setByAddingObjectsFromArray(arrayofImageObjects)
        print("This set I am adding has \(thisSetOfImageObjects.count) image objects")
    
        let newFormula = Formula(pinyinName: pinyinName, englishName: englishName, uses: uses, hasContents: [], imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, images: thisSetOfImageObjects, context: Stack.sharedStack.managedObjectContext)
        
        FormulasController.sharedController.addFormula(newFormula)
        print("I tried to add a new Formula")
    }
    
    func updateChannel(){
        
        let name = topRightTextField.text
        let uses = indicationsAndUses.text
        
        
        let imageObject1 = Image(data: placeholderLeftImageData, context: Stack.sharedStack.managedObjectContext)
        
        let imageObject2 = Image(data: placeholderRightImageData, context: Stack.sharedStack.managedObjectContext)
        
        ImagesController.sharedController.addImage(imageObject1)
        ImagesController.sharedController.addImage(imageObject2)
        
        let arrayofImageObjects: [Image] = [imageObject1, imageObject2]
        let thisSetOfImageObjects = NSSet(array: arrayofImageObjects)
        
        //thisSetOfImageObjects.setByAddingObjectsFromArray(arrayofImageObjects)
        print("This set I am adding has \(thisSetOfImageObjects.count) image objects")
        
        let newCombo = Channel(name: name, uses: uses, imageId1: placeholderLeftImageId, imageId2: placeholderRightImageId, images: thisSetOfImageObjects, context: Stack.sharedStack.managedObjectContext)
        
        ChannelController.sharedController.addCombo(newCombo)
        print("I tried to add a new Combo")
    }
    
    
    @IBAction func NewButtonTapped(sender: UIBarButtonItem) {
        
       
        
        if sender.title == "Cancel"{
            
            canEdit = false
            self.saveButton.title = "Edit"
            topRightTextField.backgroundColor = UIColor.whiteColor()
            topRightMiddleTextField.backgroundColor = UIColor.whiteColor()
            topRightBottomTextField.backgroundColor = UIColor.whiteColor()
            location.backgroundColor = UIColor.whiteColor()
            indicationsAndUses.backgroundColor = UIColor.whiteColor()
            
            self.navigationItem.rightBarButtonItem?.image = UIImage(named: "Hamburger")
            self.navigationItem.rightBarButtonItem?.title = nil
            
        } else {
        
            canEdit = true
            
            self.navigationItem.rightBarButtonItem?.image = nil
            self.navigationItem.rightBarButtonItem?.title = "Cancel"
            
        let commentAlert = UIAlertController(title: "Add New", message: nil, preferredStyle: .Alert)
        
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Main Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "English Name"
        }
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Other Info, i.e. Botanical Name"
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
            self.saveButton.title = "Save"
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
             self.saveButton.title = "Save"

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
            self.saveButton.title = "Save"

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
            self.saveButton.title = "Save"

            }
            ))

        
        commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            self.navigationItem.rightBarButtonItem?.image = UIImage(named: "Hamburger")
            self.navigationItem.rightBarButtonItem?.title = nil
        
        }))
        
        presentViewController(commentAlert, animated: true, completion: nil)
        }
      
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
        //locationLabel.text = "Preparation and Dosage"
        location.text = "..."
        indicationsAndUses.text = "..."
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.backgroundColor = newFieldsColor
        indicationsAndUses.backgroundColor = newFieldsColor
        
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
        //locationLabel.text = "Preparation and Dosage"
        location.text = "..."
        indicationsAndUses.text = "..."
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.backgroundColor = newFieldsColor
        indicationsAndUses.backgroundColor = newFieldsColor
        
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
        //locationLabel.text = "Location"
        location.text = "..."
        indicationsAndUses.text = "..."
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.backgroundColor = newFieldsColor
        indicationsAndUses.backgroundColor = newFieldsColor
        
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
        //locationLabel.text = "General Strategy"
        location.text = "..."
        indicationsAndUses.text = "..."
        topRightTextField.backgroundColor = newFieldsColor
        topRightMiddleTextField.backgroundColor = newFieldsColor
        topRightBottomTextField.backgroundColor = newFieldsColor
        location.backgroundColor = newFieldsColor
        indicationsAndUses.backgroundColor = newFieldsColor
        
        addButtonsToScene(true)

    }
    
    func addButtonsToScene(add: Bool){
        
        var addButton = UIButton()
        addButton.frame = CGRect(x: self.view.bounds.size.width/2+75, y: self.view.bounds.size.height/2 + 25 , width: 80, height: 30)
        addButton.setTitle("Action", forState: .Normal)
        addButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(12))
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.blueColorLight().CGColor
        addButton.addTarget(self, action: "addButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addButton.layer.cornerRadius = CGFloat(8)
        addButton.backgroundColor = UIColor.blueColorDark()
        
        var addPhotoButton = UIButton()
        addPhotoButton.frame = CGRect(x: self.view.bounds.size.width/2-10, y: self.view.bounds.size.height/2 + 25, width: 80, height: 30)
        addPhotoButton.setTitle("add photo", forState: .Normal)
        addPhotoButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(12))
        addPhotoButton.addTarget(self, action: "addPhotoButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.blueColorLight().CGColor
        addPhotoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addPhotoButton.layer.cornerRadius = CGFloat(8)
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
        
        performSegueWithIdentifier("toCombinationsView", sender: sender)
        
//        let cvc = self.storyboard?.instantiateViewControllerWithIdentifier("combinations") as! UINavigationController
//        cvc.navigationItem.title = "Test"
//        self.presentViewController(cvc, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toCombinationsView" {
            
            print("display combinations detail")
            if let cvc : CombinationsViewController = segue.destinationViewController as? CombinationsViewController {
            
                if herbsList == true{
                    let detailFormula = FormulasController.sharedController.formulas[index!]
                    cvc.thisFormula = detailFormula
                    cvc.navigationItem.title = detailFormula.pinyinName
                    cvc.filteredHerbArray = detailFormula.hasContents?.allObjects as! [Herb]
                    cvc.herbsList = true
                } else {
                    let detailChannel = ChannelController.sharedController.channels[index!]
                    cvc.thisChannel = detailChannel
                    cvc.navigationItem.title = detailChannel.name
                    cvc.filteredPointArray = detailChannel.hasPoints?.allObjects as! [Point]
                    cvc.herbsList = false
                }
            }
        }
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
