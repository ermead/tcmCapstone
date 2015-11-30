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
        
        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "Cinnamomi Ramulus", englishName: "Cinnamon Twig", category: "Disperse Wind-Cold", temp: "warm", meridians: "HT, LU, BL", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: "Gui Zhi Tang", images: [], context: self.moc)
        
        
        let ziSuYe = Herb(pinyinName: "Zi Su Ye", botanicalName: "Perillaw Folium", englishName: "Perilla Leaf", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuYe), majorFormulas: "", images: [], context: moc)
        
        let jingJie = Herb(pinyinName: "Jing Jie", botanicalName: "Schizonepetae Herba", englishName: "Japanese Catnip", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JingJie), majorFormulas: "", images: [], context: moc)
        
        let qiangHuo = Herb(pinyinName: "Qiang Huo", botanicalName: "Notopterygii Rhizoma seu Radix", englishName: "Notopterygium Root", category: "Disperse Wind-Cold", temp: "warm", meridians: "BL, KI", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QiangHuo), majorFormulas: "", images: [], context: moc)
        
        let shengJiang = Herb(pinyinName: "Sheng Jiang", botanicalName: "Zingiberis Rhizoma Recens", englishName: "Fresh Ginger", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP, ST", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengJiang), majorFormulas: "", images: [], context: moc)
        
        return [cinnamon]
        
        
    }
    
    func windHeatHerbs()->[Herb]{
        
        print("Wind-Heat herbs set")
        
        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "Cinnamomi Ramulus", englishName: "Cinnamon Twig", category: "Disperse Wind-Cold", temp: "warm", meridians: "HT, LU, BL", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: "Gui Zhi Tang", images: [], context: self.moc)
        
        
        let ziSuYe = Herb(pinyinName: "Zi Su Ye", botanicalName: "Perillaw Folium", englishName: "Perilla Leaf", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuYe), majorFormulas: "", images: [], context: moc)
        
        let jingJie = Herb(pinyinName: "Jing Jie", botanicalName: "Schizonepetae Herba", englishName: "Japanese Catnip", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JingJie), majorFormulas: "", images: [], context: moc)
        
        let qiangHuo = Herb(pinyinName: "Qiang Huo", botanicalName: "Notopterygii Rhizoma seu Radix", englishName: "Notopterygium Root", category: "Disperse Wind-Cold", temp: "warm", meridians: "BL, KI", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QiangHuo), majorFormulas: "", images: [], context: moc)
        
        let shengJiang = Herb(pinyinName: "Sheng Jiang", botanicalName: "Zingiberis Rhizoma Recens", englishName: "Fresh Ginger", category: "Disperse Wind-Cold", temp: "warm", meridians: "LU, SP, ST", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengJiang), majorFormulas: "", images: [], context: moc)
        
        return [cinnamon]

        
       
    }
    


}

