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
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var mainTitleOutlet: UILabel!
    
    @IBOutlet weak var textView1: UITextView!
    
    var newFieldsColor = UIColor(red:0.012,  green:0.549,  blue:0.549, alpha: 0.1)
    
    @IBOutlet weak var topRightTextField: UITextField!
    @IBOutlet weak var topRightMiddleTextField: UITextField!
    @IBOutlet weak var topRightBottomTextField: UITextField!
    
    var textFieldPlaceholderZero: String? = ""
    var textFieldPlaceholderOne: String? = ""
    var textFieldPlaceholderTwo: String? = ""
    
    var photos = [AnyObject]()
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    var placeholderLeftImageData = NSData?()
    var placeholderRightImageData = NSData?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("the main title is \(mainTitle)")
        // Do any additional setup after loading the view.
        
        mainTitleOutlet.text =  self.mainTitle.stringByReplacingOccurrencesOfString(" ", withString: " \(specificCategory) ")
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        print(" I loaded the index \(index)")
        
        if let index = index {
            
            populateEntryInfo()
            addButton.title = "Edit"
            
        } else {
            
            addNewEntry()
            
        }
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        print("add button tapped")
        saveButtonTapped(sender)
        
    }
    
    
    func populateEntryInfo() {
        
        let detailEntry = EntryController.sharedController.entries[index!]
        
        topRightTextField.text = detailEntry.text1
        topRightMiddleTextField.text = detailEntry.text2
        topRightBottomTextField.text = detailEntry.text3
        
        if detailEntry.images != nil{
            let imageSet = detailEntry.images
            
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
        
    }
    
    func saveButtonTapped(sender: UIBarButtonItem) {
        print("save attempted")
        
        if sender.title == "Save"{
            let saveAlert = UIAlertController(title: "Save this Entry", message: "as...", preferredStyle: .Alert)
            
            
            saveAlert.addAction(UIAlertAction(title: "Save as \(mainTitleOutlet.text)", style: .Default, handler: { (action) -> Void in
                
                self.updateEntry()
                
            }))
            
            saveAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            presentViewController(saveAlert, animated: true, completion: nil)
            
            self.placeholderLeftImageData = ImageController.getDataFromImage(self.leftImage.image!)
            self.placeholderRightImageData = ImageController.getDataFromImage(self.rightImage.image!)
            
            self.navigationController?.popViewControllerAnimated(true)
            
            
            
        } else {
            print("it is Edit")
            self.addButton.title = "Save"
            textView1.backgroundColor = newFieldsColor
            
            
        }
        
    }
    
    func addNewEntry() {
        
        print("adding new entry")
//        leftImage.image = UIImage(named: "default")
//        rightImage.image = UIImage(named: "default2")
//        topRightTextField.placeholder = "New Name"
//        topRightMiddleTextField.placeholder = "new something"
//        topRightBottomTextField.placeholder = "soemthing else"
//        
//        topRightTextField.backgroundColor = newFieldsColor
//        topRightMiddleTextField.backgroundColor = newFieldsColor
//        topRightBottomTextField.backgroundColor = newFieldsColor
        
        if addButton.title == "Cancel"{
            
            self.addButton.title = "Edit"
            
        } else {
            
            let commentAlert = UIAlertController(title: "Add New", message: nil, preferredStyle: .Alert)
            
            commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
                textfield.placeholder = "Entry Name"
                
                commentAlert.addAction(UIAlertAction(title: "Entry", style: .Default, handler: { (action) -> Void in
                    
                    if let textfields = commentAlert.textFields{
                        self.textFieldPlaceholderZero = textfields[0].text
                    }
                    
                    self.setupNewEntryScene()
                    self.addButton.title = "Save"
                    
                    }
                    ))
                
                commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
                    
                    
                }))
                
                self.presentViewController(commentAlert, animated: true, completion: nil)
            }
            
        }
    }
    
    func updateEntry() {
        print("trying to update or save Entry")
        
    }
    
    
    func setupNewEntryScene(){
        print("setting up new Formula Scene")
        
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
        
        leftImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        rightImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return true
    }
    
    
}
