//
//  DefaultHerbs.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/14/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation


class HerbSets {
    
    static let sharedController = HerbSets()
    
    let moc = Stack.sharedStack.managedObjectContext
    
    var HerbSet = HerbSetType.ReleaseWindCold
    var herbset: [Herb] = []
    
    var thisHerbSetType: HerbSetType?
    
    enum HerbSetType {
        case AllHerbs
        case ReleaseWindCold
        case ReleaseWindHeat
        
    }
    
    func getHerbSet(thisSetType: HerbSetType) -> [Herb]{
        //self.thisHerbSetType = thisSetType
        self.HerbSet = thisSetType
        print("this herb set I am trying to load is \(HerbSet)")
        switch thisSetType {
        case .ReleaseWindCold: return windColdHerbs()
            
        case .ReleaseWindCold: return windHeatHerbs()
            
        default: return []
            
        }
    }
    
    
    func windColdHerbs()->[Herb]{
        
        print("Wind-Cold herbs set")
        
        let guiZhi = Herb(pinyinName: "Gui Zhi", botanicalName: "Cinnamomi Ramulus", englishName: "Cinnamon Twig", category: "Disperse Wind-Cold", temp: "warm", meridians: "HT, LU, BL", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: "Gui Zhi Tang", images: [], context: self.moc)
        
        
        let ziSuYe = Herb(pinyinName: "Zi Su Ye", botanicalName: "Perillaw Folium", englishName: "Perilla Leaf", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuYe), majorFormulas: "", images: [], context: moc)
        
        let jingJie = Herb(pinyinName: "Jing Jie", botanicalName: "Schizonepetae Herba", englishName: "Japanese Catnip", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JingJie), majorFormulas: "", images: [], context: moc)
        
        let qiangHuo = Herb(pinyinName: "Qiang Huo", botanicalName: "Notopterygii Rhizoma seu Radix", englishName: "Notopterygium Root", category: "Disperse Wind-Cold", temp: "warm", meridians: "BL, KI", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QiangHuo), majorFormulas: "", images: [], context: moc)
        
        let shengJiang = Herb(pinyinName: "Sheng Jiang", botanicalName: "Zingiberis Rhizoma Recens", englishName: "Fresh Ginger", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP, ST", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengJiang), majorFormulas: "", images: [], context: moc)
        
        return [guiZhi, ziSuYe, jingJie, qiangHuo, shengJiang]
        
        
    }
    
    func windHeatHerbs()->[Herb]{
        
        print("Wind-Heat herbs set")
        
        let boHe = Herb(pinyinName: "Bo He", botanicalName: "Menthae Haplocalycis", englishName: "Field Mint", category: "Disperse Wind-Heat", temp: "cool", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BoHe), majorFormulas: "", images: [], context: self.moc)
        let niuBangZi = Herb(pinyinName: "Niu Bang Zi", botanicalName: "Arctii Fructus", englishName: "Burdock Fruit", category: "Disperse Wind-Heat", temp: "cold", meridians: "LU, ST", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.NiuBangZi), majorFormulas: "", images: [], context: self.moc)
        let sangYe = Herb(pinyinName: "Sang Ye", botanicalName: "Mori Folium", englishName: "Mulberry Leaf", category: "Disperse Wind-Heat", temp: "cool", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangYe), majorFormulas: "", images: [], context: self.moc)
        let juHua = Herb(pinyinName: "Ju Hua", botanicalName: "Chrysanthemi Flos", englishName: "Chrysanthemum Flower", category: "Disperse Wind-Heat", temp: "cool", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JuHua), majorFormulas: "", images: [], context: self.moc)
        let geGen = Herb(pinyinName: "Ge Gen", botanicalName: "Puerariae Radix", englishName: "Kudzu Root", category: "Disperse Wind-Heat", temp: "cool", meridians: "SP, ST", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GeGen), majorFormulas: "", images: [], context: self.moc)
        let chaiHu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Disperse Wind-Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        
        return [boHe, niuBangZi, sangYe, juHua, geGen, chaiHu]
       
    }
    


}

