//
//  DiagnosticToolViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/27/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class DiagnosticToolViewController: UIViewController {

    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var bottomCenterLabel: UILabel!
    @IBOutlet weak var bottomRightLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topCenterButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomCenterButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    var upDateLabelControl = 0
    var labelTitle = "Acute"
    
    @IBAction func segmentedControlButton(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            print("segment acute hit")
            upDateLabelControl = 0
            upDateLabels()
            topLeftButton.setTitle("Stress", forState: .Normal)
            topCenterButton.setTitle("Acute Pain", forState: .Normal)
            topRightButton.setTitle("Cold & Flu", forState: .Normal)
            bottomLeftButton.setTitle("Digestive", forState: .Normal)
            bottomCenterButton.setTitle("Repro", forState: .Normal)
            bottomRightButton.setTitle("Deficiency", forState: .Normal)
        }
        if(sender.selectedSegmentIndex == 1){
            print("segment chronic hit")
            upDateLabelControl = 1
            upDateLabels()
            topLeftButton.setTitle("Stress", forState: .Normal)
            topCenterButton.setTitle("Chronic Pain", forState: .Normal)
            topRightButton.setTitle("Lung", forState: .Normal)
            bottomLeftButton.setTitle("Digestive", forState: .Normal)
            bottomCenterButton.setTitle("Repro", forState: .Normal)
            bottomRightButton.setTitle("Deficiency", forState: .Normal)
        }
        if(sender.selectedSegmentIndex == 2){
            print("segment longevity hit")
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
    }
    
    @IBAction func topCenterButton(sender: AnyObject) {
        print("topCenter button hit")
    }
    
    @IBAction func topRightButton(sender: UIButton) {
        print("topRight button hit")
    }
    
    @IBAction func bottomLeftButton(sender: UIButton) {
        print("bottomLeft button hit")
    }
    
    @IBAction func bottomCenterButton(sender: UIButton) {
        print("bottomCenter button hit")
    }
    
    @IBAction func bottomRightButton(sender: UIButton) {
        print("bottomRight button hit")
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLeftButton.setTitle("Stress", forState: .Normal)
        topCenterButton.setTitle("Pain", forState: .Normal)
        topRightButton.setTitle("Cold & Flu", forState: .Normal)
        bottomLeftButton.setTitle("Digestive", forState: .Normal)
        bottomCenterButton.setTitle("Repro", forState: .Normal)
        bottomRightButton.setTitle("Deficiency", forState: .Normal)
        upDateLabels()

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
