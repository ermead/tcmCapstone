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
        case GuiZhi, ZiSuYe, JingJie, QiangHuo, ShengJiang, BaiShao, RenShen,BaiZhu
        case BoHe, NiuBangZi, SangYe, JuHua, GeGen, ChaiHu
    }
    
    func getHerbUse(herb: HerbUses.Herb) -> String {
        
        let UseForHerb = herb
        
        switch UseForHerb {
            
        case .GuiZhi    : self.use = guiZhi
        case .ZiSuYe    : self.use = ziSuYe
        case .JingJie   : self.use = jingJie
        case .QiangHuo  : self.use = qiangHuo
        case .ShengJiang: self.use = shengJiang
        
        case .BoHe      : self.use = boHe
        case .NiuBangZi : self.use = niuBangZi
        case .SangYe    : self.use = sangYe
        case .JuHua     : self.use = juHua
        case .GeGen     : self.use = geGen
        case .ChaiHu    : self.use = chaiHu
            
            
        case .RenShen   : self.use = renShen
        case .BaiShao   : self.use = baiShao
        case .BaiZhu    : self.use = baiShu
            
        default : self.use = "default"
        }
        
        
        return self.use!
    }
    
    var guiZhi = ""
    var ziSuYe = ""
    var jingJie = ""
    var qiangHuo = ""
    var shengJiang = ""
    
    var boHe = ""
    var niuBangZi = ""
    var sangYe = ""
    var juHua = ""
    var geGen = ""
    var chaiHu = ""
    
    var baiShao = "This is a test to see what gets entered and where"
    
    var renShen = "This is a test for ren shen use"
    var baiZhu = "Another test for bai zhu use now"
    
    
}



