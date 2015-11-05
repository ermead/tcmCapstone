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
    
    @IBOutlet weak var chooseACommonLabel: UILabel!
    
    var pickerViewDataSource: [String] {
        if upDateLabelControl == 0 {
            // 10 Acute disorders
            return ["Insomnia", "Cold", "Flu", "Upset Stomach", "Traumatic Injury", "Headache", "Constipation", "Ear Ache", "", ""]
        } else if upDateLabelControl == 1 {
            //10 Chronic Disorders
            return ["Fibromyalgia", "Low Back Pain", "Depression", "Insomnia", "Chronic Inflammation", "Migraines", "Irritable Bowel Syndrome ", "High Blood Pressure", "Cancer Support Therapy", ""]
        } else if upDateLabelControl == 2 {
            //10 Longevity Tonics
            return ["6 Flavor Rehmannia", "Golden Book", "Eight Immortals", "Mushroom", "Immune Boosters", "Hair Tonics", "", "", "", ""]}
        else { return []}
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
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        topLeftButton.updateButtonProperties()
        topCenterButton.updateButtonProperties()
        topRightButton.updateButtonProperties()
        bottomLeftButton.updateButtonProperties()
        bottomCenterButton.updateButtonProperties()
        bottomRightButton.updateButtonProperties()

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return pickerViewDataSource.count
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerViewDataSource[row])
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
