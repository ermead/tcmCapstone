//
//  MyCustomButton.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/1/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit

class MyCustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
 
    }
    
    
    func updateButtonProperties() {
        
        var backgroundColor = UIColor.blueColorLight()  
        
        if self.accessibilityIdentifier == "TopLeftButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.blueColorDark(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        
        if self.accessibilityIdentifier == "TopCenterButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        
        if self.accessibilityIdentifier == "TopRightButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    
        if self.accessibilityIdentifier == "BottomLeftButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        if self.accessibilityIdentifier == "BottomCenterButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        if self.accessibilityIdentifier == "BottomRightButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = backgroundColor
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }

    }

}