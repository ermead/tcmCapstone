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
            
        case .ReleaseWindHeat: return windHeatHerbs()
            
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
    
    func purgeHeatHerbs() -> [Herb]{
        
        let shiGao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let zhiMu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let zhiZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let xiaKuCao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [shiGao, zhiMu, zhiZi, xiaKuCao]
    }
    
    func clearBloodHeatHerbs() -> [Herb]{
        
        let shengDiHuang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let muDanPi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let xuanShen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [shengDiHuang, muDanPi, xuanShen]
        
    }
    
    func clearDampHeatHerbs() -> [Herb]{
        
        let huangQin = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huangLian = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huangBai = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let longDanCao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [huangQin, huangLian, huangBai, longDanCao]
        
    }
    
    func clearToxicHeatHerbs() -> [Herb]{
        
        let jinYinHua = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let lianQiao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let puGongYing = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let tuFuLing = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [jinYinHua, lianQiao, puGongYing, tuFuLing]
        
    }
    
    func clearDeficiencyHeatHerbs() -> [Herb]{
        
        let qingHao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let diGuPi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baiWei = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [qingHao, diGuPi, baiWei]
    }
    
    func laxativeHerbs() -> [Herb]{
        
        let daHuang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let mangXiao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huoMaRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [daHuang, mangXiao, huoMaRen]
    }
    
    func drainDampHerbs() -> [Herb]{
        
        let fuLing = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let zeXie = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let yiYiRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [fuLing, zeXie, yiYiRen]
    }
    
    func dispelWindDampHerbs() -> [Herb]{
        
        let duHuo = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let muGua = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let sangJiSheng = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let sangZhi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [duHuo, muGua, sangJiSheng, sangZhi]
    }
    
    func dissolveHotPhlegmHerbs() -> [Herb]{
        
        let chuanBeiMu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let guaLuo = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [chuanBeiMu, guaLuo]
    }
    
    func dissolveColdPhlegmHerbs() -> [Herb]{
        
        let banXia = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let jieGeng = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [banXia, jieGeng]
    }
    
    func stopCoughHerbs() -> [Herb]{
        
        let xingRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let piPaYe = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let ziSuZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let sangBaiPi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [xingRen, piPaYe, ziSuZi, sangBaiPi]
    }
    
    func aromaticDampResolvingHerbs() -> [Herb]{
        
        let huoPo = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let cangZhu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huoXiang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let shaRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [huoPo, cangZhu, huoXiang, shaRen]
    }
    
    func digestiveHerbs() -> [Herb]{
        
        let shanZha = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let shenQu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let maiYa = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let laiFuZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [shanZha, shenQu, maiYa, laiFuZi]
    }
    
    func regulateQiHerbs() -> [Herb]{
        
        let chenPi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let xiangFu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let wuYao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let chuanLianZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [chenPi, xiangFu, wuYao, chuanLianZi]
    }
    
    func stopBleedingHerbs() -> [Herb]{
        
        let sanQi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let puHuang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let ceBaiYe = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let aiYe = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [sanQi, puHuang, ceBaiYe, aiYe]
    }
    
    func bloodMovingHerbs() -> [Herb]{
        
        let chuanXiong = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let danShen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let yanHuoSuo = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let yuJin = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let taoRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let hongHua = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let moYao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let chiShao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [chuanXiong, danShen, yanHuoSuo, yuJin, taoRen, hongHua, moYao, chiShao]
        
    }
    
    func interiorWarmingHerbs() -> [Herb]{
        
        let fuZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let ganJiang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huJiao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let xiaoHuiXiang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [fuZi, ganJiang, rouGui, huJiao, xiaoHuiXiang]
    }
    
    func qiTonicHerbs() -> [Herb]{
        
        let renShen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let dangShen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huangQi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baiZhu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let ganCao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let daZao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [renShen, dangShen, huangQi, baiZhu, ganCao, daZao]
    }
    
    func bloodTonicHerbs() -> [Herb]{
        let dangGui = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let shuDiHuang = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baiShao = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let sangShen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [dangGui, shuDiHuang, baiShao, sangShen]
    }
    
    func yangTonicHerbs() -> [Herb]{
        
        let yinYangHuo = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let huTaoRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let xuDuan = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baJiTian = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [yinYangHuo, huTaoRen, xuDuan, baJiTian]
    }
    
    func yinTonicHerbs() -> [Herb]{
        let maiMenDong = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let tianMenDong = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baiHe = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let heiZhiMa = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [maiMenDong, tianMenDong, baiHe, heiZhiMa]
    }
    
    func astringentHerbs() -> [Herb]{
        
        let wuWeiZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let rouDouKou = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let wuMei = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let fuPenZi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let shanZhuYu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [wuWeiZi, rouDouKou, wuMei, fuPenZi, shanZhuYu ]
    }
    
    func shenCalmingHerbs() -> [Herb]{
        
        let longGu = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let muLi = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [longGu, muLi]

    }
    
    func shenNourishingHerbs() -> [Herb]{
        
        let suanZaoRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let baiZiRen = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [suanZaoRen, baiZiRen]
    }
    
    func liverWindExtinguishingHerbs() -> [Herb]{
        
        let gouTeng = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let tianMa = Herb(pinyinName: "Chai Hu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        
        return [gouTeng, tianMa]
    }
    
//    func externalUseHerbs() -> [Herb]{
//        
//    }
    
    
    
    


}

