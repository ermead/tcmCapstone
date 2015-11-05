//
//  AppearanceController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/1/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit


class AppearanceController {
    
    
    
    
    class func setUpAppearance() {
        
        let color1 = UIColor.blueColorLight()
        let color2 = UIColor.blueColorMedium()
        let color3 = UIColor.blueColorDark()
        let color4 = UIColor.yellowColorA()
        let color5 = UIColor.maroonColor1()
        let white = UIColor.whiteColor()
        
        //Navigation Bar
        UINavigationBar.appearance().barTintColor = color3
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : white]
        
        //UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = UIColor.blueColorDark()
        
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).setTitleColor(white, forState: .Normal)
        

        //UI VIew
        
        //UIView.appearanceWhenContainedInInstancesOfClasses([UIScrollView.self]).backgroundColor = UIColor.yellowColorTest()
        
        //Buttons
        
        //UIButton.appearanceWhenContainedInInstancesOfClasses([MyCustomButton.self]).backgroundColor = UIColor.yellowColorA()
        //UIButton.appearance().backgroundColor = UIColor.greenColorA()
        
        UIButton.appearance().setTitleColor(color3, forState: .Normal)
        
        //Segmented Controls
        
        UISegmentedControl.appearance().backgroundColor = color3
       //UISegmentedControl.appearance().tintColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        UISegmentedControl.appearance().tintColor = color1
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: white], forState: .Normal)
        UISegmentedControl.appearance().layer.borderColor = color3.CGColor
        UISegmentedControl.appearance().layer.borderWidth = 5
        
        //Pickers
        
        UIPickerView.appearance().backgroundColor = color4
        UIPickerView.appearance().layer.borderWidth = 15
        UIPickerView.appearance().layer.cornerRadius = 100
        
        //Tab Bar & Bar Buttons
        
        UITabBar.appearance().barTintColor = color3
        UITabBar.appearance().tintColor = white
        UIBarButtonItem.appearance().tintColor = color3
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = white
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: white ], forState: .Selected)
       
        
    }
}
