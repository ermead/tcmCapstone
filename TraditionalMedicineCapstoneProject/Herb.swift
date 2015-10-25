//
//  Herbs.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class Herb: NSObject {
    
    
    let pinyinName: String
    let botanicalName: String
    let englishName: String
    
    let imageName: String?
    
    let category: String
    let temp: String
    let meridians: String
    
    init(pinyinName: String, botanicalName: String, englishName: String, category: String, temp: String, meridians: String){
        
        self.pinyinName = pinyinName
        self.botanicalName = botanicalName
        self.englishName = englishName
        self.imageName = englishName.lowercaseString
        self.category = category
        self.temp = temp
        self.meridians = meridians
        
    }

}
