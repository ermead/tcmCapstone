//
//  DiagnosisDetailViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/27/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class DiagnosisDetailViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate  {
    
    var mainTitle = ""
    var specificCategory = ""
    var index:Int?
    var entries: [Entry]?
    var canEdit: Bool? = false
    var nameKey: String?
    
    @IBOutlet weak var clearButtonOutlet: UIButton!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var mainTitleOutlet: UILabel!
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var textView3: UITextView!
    
    var newFieldsColor = UIColor(red:0.012,  green:0.549,  blue:0.549, alpha: 0.1)
    
    
    var photos = [AnyObject]()
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    
    var placeholderTopImageData = NSData?()
    var placeholderMiddleImageData = NSData?()
    
    
    var dictionary = EntryController.sharedController.createDictionaryfromArrayOfEntryObjects(EntryController.sharedController.entries)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.entries = EntryController.sharedController.entries
        addButton.title = "Edit"
        canEdit = false
        clearButtonOutlet.hidden = true
        clearButtonOutlet.backgroundColor = UIColor.whiteColor()
        
        print("the main title is \(mainTitle)")
        
        print("The dictionary is \(self.dictionary)")
        print("Its keys are: \(self.dictionary.keys)")
        
        // Do any additional setup after loading the view.
        
        mainTitleOutlet.text =  self.mainTitle.stringByReplacingOccurrencesOfString(" ", withString: " \(specificCategory) ")
        mainTitleOutlet.textColor = UIColor.whiteColor()
        nameKey = mainTitleOutlet.text! + "_name"
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        print(" I loaded the index \(index)")
        
        if self.dictionary.keys.contains(nameKey!){
            populateEntryInfo()
            addButton.title = "Edit"
        } else {
            setupNewEntryScene()
        }
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        print("add button tapped")
        saveButtonTapped(sender)
        
    }
    
    @IBAction func clearButtonTapped(sender: UIButton) {
        if self.canEdit == true {
            textView1.text = "  "
            textView2.text = "  "
            textView3.text = "  "
        }
    }
    
    @IBAction func cameraButtonTapped(sender: UIButton) {
        addPhotoButtonTapped(sender)
    }
    
    
    func populateEntryInfo() {
        
        print("I am trying to populate an Entry")
        
        let detailEntryName = self.dictionary[("\(mainTitleOutlet.text!)_name")]
        let detailEntryText1 = self.dictionary[("\(mainTitleOutlet.text!)_text1")] as! String
        let detailEntryText2 = self.dictionary[("\(mainTitleOutlet.text!)_text2")] as! String
        let detailEntryText3 = self.dictionary[("\(mainTitleOutlet.text!)_text3")] as! String
        
        print("I am about to print the values:")
        print(detailEntryName)
        print(detailEntryText1)
        print(detailEntryText2)
        print(detailEntryText3)
        
        self.textView1.text = detailEntryText1
        self.textView2.text = detailEntryText2
        self.textView3.text = detailEntryText3

//        if detailEntry!.images != nil{
//            let imageSet = detailEntry!.images
//            
//            print("The number of images in this set is \(imageSet!.count)")
//            
//            let imageArray: [Image] = imageSet!.allObjects as! [Image]
//            
//            print("there are \(imageArray.count) images in the array")
//            
//            if imageArray.count >= 2 {
//                if let imageA = ImageController.getImageFromData(imageArray[0].imageData!){
//                    self.leftImage.image = imageA
//                }
//                if let imageB = ImageController.getImageFromData(imageArray[1].imageData!){
//                    self.rightImage.image = imageB
//                }
//            } else {
//                return
//            }
//
//       }
        self.view.setNeedsDisplay()
    }
    
    func saveButtonTapped(sender: UIBarButtonItem) {
        print("save attempted")
        
        if sender.title == "Save"{
            let saveAlert = UIAlertController(title: "Save this Entry", message: "as...", preferredStyle: .Alert)
            
            saveAlert.addAction(UIAlertAction(title: mainTitleOutlet.text!, style: .Default, handler: { (action) -> Void in
                
                self.updateEntry()
                self.clearButtonOutlet.hidden = true
                
            }))
            
            saveAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            presentViewController(saveAlert, animated: true, completion: nil)
            
           self.placeholderTopImageData = ImageController.getDataFromImage(self.topImage.image!)
            self.placeholderMiddleImageData = ImageController.getDataFromImage(self.middleImage.image!)
            
            self.navigationController?.popViewControllerAnimated(true)
            
            
            
        } else {
            print("it is Edit")
            self.addButton.title = "Save"
            clearButtonOutlet.hidden = false
            textView1.backgroundColor = newFieldsColor
            textView2.backgroundColor = newFieldsColor
            textView3.backgroundColor = newFieldsColor
            canEdit = true
        }
        
    }
  
    func updateEntry() {
        print("trying to update or save Entry")
        
        let imageObject1 = Image(data: placeholderTopImageData, context: Stack.sharedStack.managedObjectContext)
        
        let imageObject2 = Image(data: placeholderMiddleImageData, context: Stack.sharedStack.managedObjectContext)
        
        ImagesController.sharedController.addImage(imageObject1)
        ImagesController.sharedController.addImage(imageObject2)
        
        let arrayofImageObjects: [Image] = [imageObject1, imageObject2]
        let thisSetOfImageObjects = NSSet(array: arrayofImageObjects)
        
        //thisSetOfImageObjects.setByAddingObjectsFromArray(arrayofImageObjects)
        print("This set I am adding has \(thisSetOfImageObjects.count) image objects")
        
        let newEntry = Entry(name: mainTitleOutlet.text, text1: textView1.text, text2: textView2.text, text3: textView3.text, images: thisSetOfImageObjects, context: Stack.sharedStack.managedObjectContext)
        
        EntryController.sharedController.addEntry(newEntry)
        
    }
    
    
    func setupNewEntryScene(){
        print("setting up new Entry Scene")
        textView1.text = " "
        
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
        
        topImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        middleImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.canEdit!
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return self.canEdit!
    }
    
    
}
