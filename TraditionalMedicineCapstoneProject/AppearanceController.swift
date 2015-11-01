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
        
        
        //Navigation Bar
        UINavigationBar.appearance().barTintColor = UIColor.blueColorMedium()
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = UIColor.blueColorDark()
        
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).setTitleColor(UIColor.whiteColor(), forState: .Normal)
        

        //UI VIew
        
        //UIView.appearanceWhenContainedInInstancesOfClasses([UIScrollView.self]).backgroundColor = UIColor.yellowColorTest()
        
        //Buttons
        
        UIButton.appearanceWhenContainedInInstancesOfClasses([MyCustomButton.self]).backgroundColor = UIColor.yellowColorA()
        //UIButton.appearance().backgroundColor = UIColor.greenColorA()
        
        UIButton.appearance().setTitleColor(UIColor.maroonColor1(), forState: .Normal)
        
        //Segmented Controls
        
        UISegmentedControl.appearance().backgroundColor = UIColor.blueColorDark()
        UISegmentedControl.appearance().tintColor = UIColor.blueColorLight()
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
        
        //Pickers
        
        //UIPickerView.appearance().backgroundColor = UIColor.yellowColor1()
        
        //Tab Bar & Bar Buttons
        
        UITabBar.appearance().barTintColor = UIColor.blueColorLight()
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
        UIBarButtonItem.appearance().tintColor = UIColor.blueColorDark()
        
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = UIColor.whiteColor()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor() ], forState: .Selected)
        
        

        
    }
}
