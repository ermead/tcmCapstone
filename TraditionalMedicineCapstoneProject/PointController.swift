//
//  PointController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointController: NSObject {

    static var points : [Point] {
        
    let ST36 = Point(pinyinName: "Zu San Li", englishName: "Leg Three Miles", pointOnMeridian: "ST-36")
    let HT7 = Point(pinyinName: "Shen Men", englishName: "Spirit Gate", pointOnMeridian: "HT-7")
    let LR3 = Point(pinyinName: "Tai Chong", englishName: "Great Rushing", pointOnMeridian: "LR-3")
    let LI4 = Point(pinyinName: "Hegu", englishName: "Adjoining Valley", pointOnMeridian: "LI-4")
    
    return [ST36, HT7, LR3, LI4]
    
    }
}