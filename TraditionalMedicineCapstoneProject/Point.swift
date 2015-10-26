//
//  Point.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class Point: NSObject {
    
    let pinyinName: String
    let englishName: String
    let pointOnMeridian: String
    let imageName: String?
    
    init(pinyinName: String, englishName: String, pointOnMeridian: String){
        
        self.pinyinName = pinyinName
        self.englishName = englishName
        self.pointOnMeridian = pointOnMeridian
        self.imageName = englishName.lowercaseString
}
}
