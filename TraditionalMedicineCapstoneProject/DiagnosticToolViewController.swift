//
//  DiagnosticToolViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/27/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class DiagnosticToolViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var bottomCenterLabel: UILabel!
    @IBOutlet weak var bottomRightLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var topLeftButton: MyCustomButton!
    @IBOutlet weak var topCenterButton: MyCustomButton!
    @IBOutlet weak var topRightButton: MyCustomButton!
    @IBOutlet weak var bottomLeftButton: MyCustomButton!
    @IBOutlet weak var bottomCenterButton: MyCustomButton!
    @IBOutlet weak var bottomRightButton: MyCustomButton!
    
    @IBOutlet weak var findInfoOnOutlet: UIButton!
    
    var upDateLabelControl = 0
    var labelTitle = "Acute"
    var buttonTitle = ""
    var rowOfpickerSelected: Int?
    
    var acuteQuickArray = [String]()
    var chronicQuickArray = [String]()
    var longevityQuickArray = [String]()
    
    var acuteButtonArray = [String]()
    var chronicButtonArray = [String]()
    var longevityButtonArray = [String]()
    
    @IBOutlet weak var chooseACommonLabel: UILabel!
    
    var pickerViewDataSource: [String] {
        if upDateLabelControl == 0 {
            // 10 Acute disorders
            return acuteQuickArray
        } else if upDateLabelControl == 1 {
            //10 Chronic Disorders
            return chronicQuickArray
        } else if upDateLabelControl == 2 {
            //10 Longevity Tonics
            return longevityQuickArray}
        else { return []}
    }
    
    @IBAction func topLeftNavigationButton(sender: UIBarButtonItem) {
        
        self.presentQuickOrButtons()
    }
    
    @IBAction func FindInfoButtonPressed(sender: UIButton) {
        let row = rowOfpickerSelected
        if let row = row {
            print("Find info on: \(pickerViewDataSource[row])")
            buttonTitle = String(pickerViewDataSource[row])
            performSegueWithIdentifier("diagnosticSegue", sender: self)
        }
 
    }
    
    @IBAction func segmentedControlButton(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            print("segment acute hit")
            topLeftButton.updateButtonProperties()
            topCenterButton.updateButtonProperties()
            topRightButton.updateButtonProperties()
            bottomLeftButton.updateButtonProperties()
            bottomCenterButton.updateButtonProperties()
            bottomRightButton.updateButtonProperties()  
            pickerView.reloadAllComponents()
            upDateLabelControl = 0
            upDateLabels()
            topLeftButton.setTitle("Stress", forState: .Normal)
            topCenterButton.setTitle("Pain", forState: .Normal)
            topRightButton.setTitle("Cold & Flu", forState: .Normal)
            bottomLeftButton.setTitle("Digestive", forState: .Normal)
            bottomCenterButton.setTitle("Repro", forState: .Normal)
            bottomRightButton.setTitle("Deficiency", forState: .Normal)
        }
        if(sender.selectedSegmentIndex == 1){
            print("segment chronic hit")
            topLeftButton.updateButtonProperties()
            topCenterButton.updateButtonProperties()
            topRightButton.updateButtonProperties()
            bottomLeftButton.updateButtonProperties()
            bottomCenterButton.updateButtonProperties()
            bottomRightButton.updateButtonProperties()
            pickerView.reloadAllComponents()
            upDateLabelControl = 1
            upDateLabels()
            topLeftButton.setTitle("Stress", forState: .Normal)
            topCenterButton.setTitle("Pain", forState: .Normal)
            topRightButton.setTitle("Lung", forState: .Normal)
            bottomLeftButton.setTitle("Digestive", forState: .Normal)
            bottomCenterButton.setTitle("Repro", forState: .Normal)
            bottomRightButton.setTitle("Deficiency", forState: .Normal)
        }
        if(sender.selectedSegmentIndex == 2){
            print("segment longevity hit")
            topLeftButton.updateButtonProperties()
            topCenterButton.updateButtonProperties()
            topRightButton.updateButtonProperties()
            bottomLeftButton.updateButtonProperties()
            bottomCenterButton.updateButtonProperties()
            bottomRightButton.updateButtonProperties()
            pickerView.reloadAllComponents()
            upDateLabelControl = 2
            upDateLabels()
            topLeftButton.setTitle("Liver", forState: .Normal)
            topCenterButton.setTitle("Heart", forState: .Normal)
            topRightButton.setTitle("Lung", forState: .Normal)
            bottomLeftButton.setTitle("Spleen", forState: .Normal)
            bottomCenterButton.setTitle("Kidney", forState: .Normal)
            bottomRightButton.setTitle("Qi & Blood", forState: .Normal)
        }


    }
    
    @IBAction func topLeftButton(sender: UIButton) {
        print("topLeft button hit")
        buttonTitle = String(sender.titleLabel!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)

    }
    
    @IBAction func topCenterButton(sender: AnyObject) {
        print("topCenter button hit")
        buttonTitle = String(sender.titleLabel!!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)
    }
    
    @IBAction func topRightButton(sender: UIButton) {
        print("topRight button hit")
        buttonTitle = String(sender.titleLabel!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)
    }
    
    @IBAction func bottomLeftButton(sender: UIButton) {
        print("bottomLeft button hit")
        buttonTitle = String(sender.titleLabel!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)
    }
    
    @IBAction func bottomCenterButton(sender: UIButton) {
        print("bottomCenter button hit")
        buttonTitle = String(sender.titleLabel!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)
    }
    
    @IBAction func bottomRightButton(sender: UIButton) {
        print("bottomRight button hit")
        buttonTitle = String(sender.titleLabel!.text!)
        performSegueWithIdentifier("diagnosticSegue", sender: self)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        topLeftButton.setTitle("Stress", forState: .Normal)
        topCenterButton.setTitle("Pain", forState: .Normal)
        topRightButton.setTitle("Cold & Flu", forState: .Normal)
        bottomLeftButton.setTitle("Digestive", forState: .Normal)
        bottomCenterButton.setTitle("Repro", forState: .Normal)
        bottomRightButton.setTitle("Deficiency", forState: .Normal)
        upDateLabels()
        findInfoOnOutlet.hidden = true
        findInfoOnOutlet.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        topLeftButton.updateButtonProperties()
        topCenterButton.updateButtonProperties()
        topRightButton.updateButtonProperties()
        bottomLeftButton.updateButtonProperties()
        bottomCenterButton.updateButtonProperties()
        bottomRightButton.updateButtonProperties()
        
        acuteQuickArray = ["Insomnia", "Cold", "Flu", "Upset Stomach", "Traumatic Injury", "Headache", "Bowels", "Ear Ache", "Burns", ""]
        
        chronicQuickArray = ["Fibromyalgia", "Low Back Pain", "Depression", "Insomnia", "Chronic Inflammation", "Migraines", "Irritable Bowel Syndrome ", "High Blood Pressure", "Cancer Support Therapy", ""]
        
        longevityQuickArray = ["6 Flavor Rehmannia", "Golden Book", "Eight Immortals", "Mushroom", "Immune Boosters", "Hair Tonics", "", "", "", ""]

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return pickerViewDataSource.count
        if upDateLabelControl == 0 {
            // 10 Acute disorders
            return acuteQuickArray.count
        } else if upDateLabelControl == 1 {
            //10 Chronic Disorders
            return chronicQuickArray.count
        } else if upDateLabelControl == 2 {
            //10 Longevity Tonics
            return longevityQuickArray.count
        }
        else { return 10}
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerViewDataSource[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseACommonLabel.alpha = 0
        findInfoOnOutlet.hidden = false
        rowOfpickerSelected = row
        print(pickerViewDataSource[row])
    }
    
    

    func upDateLabels() {
        switch upDateLabelControl{
        case 0 : labelTitle = "Acute Disorders"
        case 1 : labelTitle = "Chronic Disorders"
        case 2 : labelTitle = "Longevity Tonics"
        default: labelTitle = ""
        }
        topLeftLabel.text = labelTitle
        bottomLeftLabel.text = labelTitle
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "diagnosticSegue" {
            print("the segue hit was the diagnosticSegue")
            if let ddlc : DiagnosisDetailViewController = segue.destinationViewController as? DiagnosisDetailViewController {
                    ddlc.title = buttonTitle
                    ddlc.mainTitle = labelTitle
        }
    }
    }

   
    func presentQuickOrButtons(){
        
        let commentAlert = UIAlertController(title: "Customize Your Settings", message: "do you want to customize your buttons or quick picks?", preferredStyle: .Alert)
        commentAlert.addAction(UIAlertAction(title: "Buttons", style: .Default, handler: { (action) -> Void in
            self.presentSettingsActionSheet("Buttons")
        }))
        commentAlert.addAction(UIAlertAction(title: "Quick Picks", style: .Default, handler: { (action) -> Void in
            self.presentSettingsActionSheet("Quick Picker")
        }))
        
        presentViewController(commentAlert, animated: true, completion: nil)
    }
    
    
    func presentSettingsActionSheet(kind: String){
        
        
        
        let commentAlert = UIAlertController(title: "Customize Your Settings", message: nil, preferredStyle: .Alert)
       
        
        commentAlert.addAction(UIAlertAction(title: "Acute \(kind)", style: .Default, handler: { (action) ->
           Void in
            if kind == "Quick Picker"{
            self.presentQuickPickerSettings(self.acuteQuickArray)
            } else {
            self.presentQuickPickerSettings(self.acuteButtonArray)
            }
            
        }))
        
        commentAlert.addAction(UIAlertAction(title: "Chronic \(kind)", style: .Default, handler: { (action) ->
            Void in
            if kind == "Quick Picker"{
            self.presentQuickPickerSettings(self.chronicQuickArray)
            } else {
            self.presentQuickPickerSettings(self.chronicButtonArray)
            }
        
            
        }))
        
        commentAlert.addAction(UIAlertAction(title: "Longevity \(kind)", style: .Default, handler: { (action) ->
            Void in
            if kind == "Quick Picker" {
            self.presentQuickPickerSettings(self.longevityQuickArray)
            } else {
            self.presentQuickPickerSettings(self.longevityButtonArray)
            }
            
        }))
        commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        presentViewController(commentAlert, animated: true, completion: nil)
    
    }
    
    func presentQuickPickerSettings(kind: [String]){
    
        var kind = kind
        var title = ""
        var kindString = ""
        var isQuick: Bool = true
        
        if kind == self.acuteQuickArray {
            title = "Quick Picker Settings"
            kindString = "Acute Disorders"
            isQuick = true
        } else if kind == self.chronicQuickArray {
            title = "Quick Picker Settings"
            kindString = "Chronic Disorders"
            isQuick = true
        } else if kind == self.longevityQuickArray {
            title = "Quick Picker Settings"
            kindString = "Longevity Disorders"
            isQuick = true
            
        } else if kind == self.acuteButtonArray{
            title = "Button Settings"
            kindString = "Acute Disorders"
            isQuick = false
        } else if kind == self.chronicButtonArray{
            title = "Button Settings"
            kindString = "Chronic Disorders"
            isQuick = false
        } else if kind == self.longevityButtonArray{
            title = "Button Settings"
            kindString = "Chronic Disorders"
            isQuick = false
        } else {
            print("quick picker changed?")
        }

        
        let commentAlert2 = UIAlertController(title: "\(title)", message: "\(kindString)", preferredStyle: .Alert)
        
       
        
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[0]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[1]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[2]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[3]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[4]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[5]
        }
        if isQuick == true {
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[6]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[7]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[8]
        }
        commentAlert2.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = kind[9]
        }
        }
        commentAlert2.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        commentAlert2.addAction(UIAlertAction(title: "Save?", style: .Default, handler: { (action) -> Void in
            
                var newArray: [String] = []
                if let textfield = commentAlert2.textFields{
                    for text in textfield{
                        if text.text != nil {
                            newArray.append(text.text!)
                        } else {
                            let newText = "..."
                            newArray.append(newText)
                        }
                    }
                    
                if kind == self.acuteQuickArray  {
                        self.acuteQuickArray = newArray
//                        self.acuteQuickArray.append("test")
//                        self.acuteQuickArray.append("test")
//                        self.acuteQuickArray.append("test")
                } else if kind == self.chronicQuickArray {
                        self.chronicQuickArray = newArray
                } else if kind == self.longevityQuickArray {
                        self.longevityQuickArray = newArray
                } else if kind == self.acuteButtonArray {
                        self.acuteButtonArray = newArray
                } else if kind == self.chronicButtonArray {
                        self.chronicButtonArray = newArray
                } else if kind == self.longevityButtonArray{
                        self.longevityButtonArray = newArray
                } else {
                    print("quick picker changed?")
                    }
                    
                self.pickerView.reloadAllComponents()
                }
    
        }))
        
        
        
        presentViewController(commentAlert2, animated: true, completion: nil)
        
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
