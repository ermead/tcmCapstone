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
        
        
        if self.accessibilityIdentifier == "TopLeftButton" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColorLight()
            self.tintColor = UIColor.whiteColor()
        }
        
        if self.titleLabel?.text == "TopCenterButton" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColorLight()
            self.tintColor = UIColor.whiteColor()
        }
        
        if self.titleLabel?.text == "TopRightButton" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColorLight()
            self.tintColor = UIColor.whiteColor()
        }
    
        if self.titleLabel?.text == "BottomLeftButton" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColorLight()
            self.tintColor = UIColor.whiteColor()
        }
        if self.titleLabel?.text == "BottomLeftButton" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColorLight()
            self.tintColor = UIColor.whiteColor()
        }

    }

}