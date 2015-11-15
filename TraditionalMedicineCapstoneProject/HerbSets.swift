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
        return setHerbSet1()
    }
    
    
    func setHerbSet()->[Herb]{
        
        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: "Gui Zhi Tang", imageId1: nil, imageId2: nil)
        let ginseng = Herb(pinyinName: "Ren Shen", botanicalName: "insert botanical name", englishName: "Ginseng", category: "Tonify the Qi", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RenShen), majorFormulas: "Si Jun Zi Tang", imageId1: nil, imageId2: nil)
        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "insert botanical name", englishName: "Angelica", category: "Tonify the Blood", temp: "Warm", meridians: "insert meridians", uses:HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: "Si Wu Tang", imageId1: nil, imageId2: nil)
        
        let baishao = Herb(pinyinName: "Bai Shao", botanicalName: "Radix Peony", englishName: "White Peony", category: "Yin Tonic", temp: "Cool", meridians: "LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiShao), majorFormulas: "Xiao Yao San", imageId1: nil, imageId2: nil)
        
        
        let baishao1 = Herb(pinyinName: "chi Shao", botanicalName: "Radix Peony", englishName: "White Peony", category: "Yin Tonic", temp: "Cool", meridians: "LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiShao), majorFormulas: "Xiao Yao San", imageId1: nil, imageId2: nil)
        
        return [cinnamon]
    }
    
    func setHerbSet1()->[Herb]{
        
        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: "Gui Zhi Tang", imageId1: nil, imageId2: nil)
        
        let baishao1 = Herb(pinyinName: "chi Shao", botanicalName: "Radix Peony", englishName: "White Peony", category: "Yin Tonic", temp: "Cool", meridians: "LR", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiShao), majorFormulas: "Xiao Yao San", imageId1: nil, imageId2: nil)
        
        return [cinnamon]
    }
    
    func setHerbSet2()->[Herb]{
        
        var array = setHerbSet1()
        var array1 = setHerbSet2()
        for herb in array1{
            array.append(herb)
        }
        return array
    }


}



