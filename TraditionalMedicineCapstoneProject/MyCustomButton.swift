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
        
        if self.titleLabel?.text == "Pain" {
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.blueColor()
        self.tintColor = UIColor.whiteColor()
        }
        
        if self.titleLabel?.text == "Stress" {
            self.layer.cornerRadius = 10.0;
            self.layer.borderColor = UIColor.greenColor().CGColor
            self.layer.borderWidth = 1.5
            self.backgroundColor = UIColor.blueColor()
            self.tintColor = UIColor.whiteColor()
        }
        
    }
}