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
        
        var earth = UIColor.YellowEarth()
        var fire = UIColor.RedFire()
        var wood = UIColor.GreenWood()
        var water = UIColor.BlueWater()
        var metal = UIColor.WhiteMetal()
        
        //BUTTONS on Quick View
        if self.accessibilityIdentifier == "TopLeftButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = wood
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.blueColorDark(), forState: .Normal)
            self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        
        if self.accessibilityIdentifier == "TopCenterButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = fire
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        
        if self.accessibilityIdentifier == "TopRightButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = metal
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    
        if self.accessibilityIdentifier == "BottomLeftButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = earth
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        if self.accessibilityIdentifier == "BottomCenterButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = water
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        if self.accessibilityIdentifier == "BottomRightButton" {
            self.layer.cornerRadius = 37.5;
            self.layer.borderColor = UIColor.blueColorDark().CGColor
            self.layer.borderWidth = 1.5
            //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
            self.backgroundColor = water
            self.tintColor = UIColor.whiteColor()
            //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        
        //BUTTONS on Other Resources View
        if self.restorationIdentifier != nil {
            
            if self.restorationIdentifier! == "1"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            
            if self.restorationIdentifier! == "2"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "3"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "4"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "5"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "6"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "7"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "8"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.blueColorDark().CGColor
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
            if self.restorationIdentifier! == "9"{
                
                print("I am a custom button!!!")
                self.layer.cornerRadius = 5;
                self.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(11))
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.layer.borderWidth = 1.5
                //self.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
                self.backgroundColor = UIColor.blueColorDark()
                self.tintColor = UIColor.whiteColor()
                //self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
        }
        
        
        
        
        

    }

}