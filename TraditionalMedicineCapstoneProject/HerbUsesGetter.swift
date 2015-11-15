//
//  HerbUses.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/14/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

class HerbUses: NSObject {
    
    static let sharedController = HerbUses()
    
    var thisHerb: Herb? = nil
    var needUse: Bool? = true
    var use: String?
    
    enum Herb {
        case BaiShao,GuiZhi,RenShen,BaiZhu
    }
    
    func getHerbUse(herb: HerbUses.Herb) -> String {
        
        let UseForHerb = herb
        
        switch UseForHerb {
            
        case .BaiShao   : self.use = baishaoUse
        case .GuiZhi    : self.use = guizhiUse
        case .RenShen   : self.use = renshenUse
        case .BaiZhu    : self.use = baizhuUse
        default : self.use = "default"
        }
        
        
        return self.use!
    }
    
    
    var baishaoUse = "This is a test to see what gets entered and where"
    var guizhiUse = "This is the test for guizhiUse"
    var renshenUse = "This is a test for ren shen use"
    var baizhuUse = "Another test for bai zhu use now"
    
    
}



