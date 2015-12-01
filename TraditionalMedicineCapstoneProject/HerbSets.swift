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
        
        let shiGao = Herb(pinyinName: "Shi Gao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShiGao), majorFormulas: "", images: [], context: self.moc)
        let zhiMu = Herb(pinyinName: "Zhi Mu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZhiMu), majorFormulas: "", images: [], context: self.moc)
        let zhiZi = Herb(pinyinName: "Zhi Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZhiZi), majorFormulas: "", images: [], context: self.moc)
        let xiaKuCao = Herb(pinyinName: "Xia Ku Cao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiaKuCao), majorFormulas: "", images: [], context: self.moc)
        
        return [shiGao, zhiMu, zhiZi, xiaKuCao]
    }
    
    func clearBloodHeatHerbs() -> [Herb]{
        
        let shengDiHuang = Herb(pinyinName: "Sheng Di Huang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengDiHuang), majorFormulas: "", images: [], context: self.moc)
        let muDanPi = Herb(pinyinName: "Mu Dan Pi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuDanPi), majorFormulas: "", images: [], context: self.moc)
        let xuanShen = Herb(pinyinName: "Xuan Shen", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XuanShen ), majorFormulas: "", images: [], context: self.moc)
        
        return [shengDiHuang, muDanPi, xuanShen]
        
    }
    
    func clearDampHeatHerbs() -> [Herb]{
        
        let huangQin = Herb(pinyinName: "Huang Qin", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangQin), majorFormulas: "", images: [], context: self.moc)
        let huangLian = Herb(pinyinName: "Huang Lian", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangLian), majorFormulas: "", images: [], context: self.moc)
        let huangBai = Herb(pinyinName: "Huang Bai", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangBai), majorFormulas: "", images: [], context: self.moc)
        let longDanCao = Herb(pinyinName: "Long Dan Cao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LongDanCao), majorFormulas: "", images: [], context: self.moc)
        
        return [huangQin, huangLian, huangBai, longDanCao]
        
    }
    
    func clearToxicHeatHerbs() -> [Herb]{
        
        let jinYinHua = Herb(pinyinName: "Jin Yin Hua", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JinYinHua), majorFormulas: "", images: [], context: self.moc)
        let lianQiao = Herb(pinyinName: "Lian Qiao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LianQiao), majorFormulas: "", images: [], context: self.moc)
        let puGongYing = Herb(pinyinName: "Pu Gong Ying", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PuGongYing), majorFormulas: "", images: [], context: self.moc)
        let tuFuLing = Herb(pinyinName: "Tu Fu Ling", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TuFuLing), majorFormulas: "", images: [], context: self.moc)
        
        return [jinYinHua, lianQiao, puGongYing, tuFuLing]
        
    }
    
    func clearDeficiencyHeatHerbs() -> [Herb]{
        
        let qingHao = Herb(pinyinName: "Qinag Hao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QingHao), majorFormulas: "", images: [], context: self.moc)
        let diGuPi = Herb(pinyinName: "Di Gu Pi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DiGuPi), majorFormulas: "", images: [], context: self.moc)
        let baiWei = Herb(pinyinName: "Bai Wei", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiWei), majorFormulas: "", images: [], context: self.moc)
        
        return [qingHao, diGuPi, baiWei]
    }
    
    func laxativeHerbs() -> [Herb]{
        
        let daHuang = Herb(pinyinName: "Da Huang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DaHuang), majorFormulas: "", images: [], context: self.moc)
        let mangXiao = Herb(pinyinName: "Mang Xiao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MangXiao), majorFormulas: "", images: [], context: self.moc)
        let huoMaRen = Herb(pinyinName: "Huo Ma Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoMaRen), majorFormulas: "", images: [], context: self.moc)
        
        return [daHuang, mangXiao, huoMaRen]
    }
    
    func drainDampHerbs() -> [Herb]{
        
        let fuLing = Herb(pinyinName: "Fu Ling", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuLing), majorFormulas: "", images: [], context: self.moc)
        let zeXie = Herb(pinyinName: "Ze Xie", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZeXie), majorFormulas: "", images: [], context: self.moc)
        let yiYiRen = Herb(pinyinName: "Yi Yi Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YiYiRen), majorFormulas: "", images: [], context: self.moc)
        
        return [fuLing, zeXie, yiYiRen]
    }
    
    func dispelWindDampHerbs() -> [Herb]{
        
        let duHuo = Herb(pinyinName: "Du Huo", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DuHuo), majorFormulas: "", images: [], context: self.moc)
        let muGua = Herb(pinyinName: "Mu Gua", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuGua), majorFormulas: "", images: [], context: self.moc)
        let sangJiSheng = Herb(pinyinName: "Sang Ji Sheng", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangJiSheng), majorFormulas: "", images: [], context: self.moc)
        let sangZhi = Herb(pinyinName: "Sang Zhi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangZhi), majorFormulas: "", images: [], context: self.moc)
        
        return [duHuo, muGua, sangJiSheng, sangZhi]
    }
    
    func dissolveHotPhlegmHerbs() -> [Herb]{
        
        let chuanBeiMu = Herb(pinyinName: "Chuan Bei Mu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanBeiMu), majorFormulas: "", images: [], context: self.moc)
        let guaLuo = Herb(pinyinName: "Gua Luo", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuaLuo), majorFormulas: "", images: [], context: self.moc)
        
        return [chuanBeiMu, guaLuo]
    }
    
    func dissolveColdPhlegmHerbs() -> [Herb]{
        
        let banXia = Herb(pinyinName: "Ban Xia", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BanXia), majorFormulas: "", images: [], context: self.moc)
        let jieGeng = Herb(pinyinName: "Jie Geng", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JieGeng), majorFormulas: "", images: [], context: self.moc)
        
        return [banXia, jieGeng]
    }
    
    func stopCoughHerbs() -> [Herb]{
        
        let xingRen = Herb(pinyinName: "Xing Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XingRen), majorFormulas: "", images: [], context: self.moc)
        let piPaYe = Herb(pinyinName: "Pi Pa Ye", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PiPaYe), majorFormulas: "", images: [], context: self.moc)
        let ziSuZi = Herb(pinyinName: "Zi Su Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuZi), majorFormulas: "", images: [], context: self.moc)
        let sangBaiPi = Herb(pinyinName: "Sang Bai Pi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangBaiPi), majorFormulas: "", images: [], context: self.moc)
        
        return [xingRen, piPaYe, ziSuZi, sangBaiPi]
    }
    
    func aromaticDampResolvingHerbs() -> [Herb]{
        
        let huoPo = Herb(pinyinName: "Huo Po", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoPo), majorFormulas: "", images: [], context: self.moc)
        let cangZhu = Herb(pinyinName: "Cang Zhu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.CangZhu), majorFormulas: "", images: [], context: self.moc)
        let huoXiang = Herb(pinyinName: "Huo Xiang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoXiang), majorFormulas: "", images: [], context: self.moc)
        let shaRen = Herb(pinyinName: "Sha Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShaRen), majorFormulas: "", images: [], context: self.moc)
        
        return [huoPo, cangZhu, huoXiang, shaRen]
    }
    
    func digestiveHerbs() -> [Herb]{
        
        let shanZha = Herb(pinyinName: "Shan Zha", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShanZha), majorFormulas: "", images: [], context: self.moc)
        let shenQu = Herb(pinyinName: "Shen Qu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShenQu), majorFormulas: "", images: [], context: self.moc)
        let maiYa = Herb(pinyinName: "Mai Ya", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MaiYa), majorFormulas: "", images: [], context: self.moc)
        let laiFuZi = Herb(pinyinName: "Lai Fu Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LaiFuZi), majorFormulas: "", images: [], context: self.moc)
        
        return [shanZha, shenQu, maiYa, laiFuZi]
    }
    
    func regulateQiHerbs() -> [Herb]{
        
        let chenPi = Herb(pinyinName: "Chen Pi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChenPi), majorFormulas: "", images: [], context: self.moc)
        let xiangFu = Herb(pinyinName: "Xiang Fu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiangFu), majorFormulas: "", images: [], context: self.moc)
        let wuYao = Herb(pinyinName: "Wu Yao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuYao), majorFormulas: "", images: [], context: self.moc)
        let chuanLianZi = Herb(pinyinName: "Chuan Lian Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanLianZi), majorFormulas: "", images: [], context: self.moc)
        
        return [chenPi, xiangFu, wuYao, chuanLianZi]
    }
    
    func stopBleedingHerbs() -> [Herb]{
        
        let sanQi = Herb(pinyinName: "San Qi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SanQi), majorFormulas: "", images: [], context: self.moc)
        let puHuang = Herb(pinyinName: "Pu Huang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PuHuang), majorFormulas: "", images: [], context: self.moc)
        let ceBaiYe = Herb(pinyinName: "Ce Bai Ye", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.CeBaiYe), majorFormulas: "", images: [], context: self.moc)
        let aiYe = Herb(pinyinName: "Ai Ye", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.AiYe), majorFormulas: "", images: [], context: self.moc)
        
        return [sanQi, puHuang, ceBaiYe, aiYe]
    }
    
    func bloodMovingHerbs() -> [Herb]{
        
        let chuanXiong = Herb(pinyinName: "Chuan Xiong", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanXiong), majorFormulas: "", images: [], context: self.moc)
        let danShen = Herb(pinyinName: "Dan Shen", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DanShen), majorFormulas: "", images: [], context: self.moc)
        let yanHuoSuo = Herb(pinyinName: "Yan Huo Suo", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YanHuoSuo), majorFormulas: "", images: [], context: self.moc)
        let yuJin = Herb(pinyinName: "Yu Jin", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YuJin), majorFormulas: "", images: [], context: self.moc)
        let taoRen = Herb(pinyinName: "Tao Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TaoRen), majorFormulas: "", images: [], context: self.moc)
        let hongHua = Herb(pinyinName: "Hong Hua", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HongHua), majorFormulas: "", images: [], context: self.moc)
        let moYao = Herb(pinyinName: "Mo Yao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MoYao), majorFormulas: "", images: [], context: self.moc)
        let chiShao = Herb(pinyinName: "Chi Shao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChiShao), majorFormulas: "", images: [], context: self.moc)
        
        return [chuanXiong, danShen, yanHuoSuo, yuJin, taoRen, hongHua, moYao, chiShao]
        
    }
    
    func interiorWarmingHerbs() -> [Herb]{
        
        let fuZi = Herb(pinyinName: "Fu Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuZi), majorFormulas: "", images: [], context: self.moc)
        let ganJiang = Herb(pinyinName: "Gan Jiang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GanJiang), majorFormulas: "", images: [], context: self.moc)
        let rouGui =  Herb(pinyinName: "Rou Gui", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RouGui), majorFormulas: "", images: [], context: self.moc)
        let huJiao = Herb(pinyinName: "Hu Jiao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuJiao), majorFormulas: "", images: [], context: self.moc)
        let xiaoHuiXiang = Herb(pinyinName: "Xiao Hui Xiang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiaoHuiXiang), majorFormulas: "", images: [], context: self.moc)
        
        return [fuZi, ganJiang, rouGui, huJiao, xiaoHuiXiang]
    }
    
    func qiTonicHerbs() -> [Herb]{
        
        let renShen = Herb(pinyinName: "Ren Shen", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RenShen), majorFormulas: "", images: [], context: self.moc)
        let dangShen = Herb(pinyinName: "Dang Shen", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DangShen), majorFormulas: "", images: [], context: self.moc)
        let huangQi = Herb(pinyinName: "Huang Qi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangQi), majorFormulas: "", images: [], context: self.moc)
        let baiZhu = Herb(pinyinName: "Bai Zhu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: "", images: [], context: self.moc)
        let ganCao = Herb(pinyinName: "Gan Cao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GanCao), majorFormulas: "", images: [], context: self.moc)
        let daZao = Herb(pinyinName: "Da Zao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DaZao), majorFormulas: "", images: [], context: self.moc)
        
        return [renShen, dangShen, huangQi, baiZhu, ganCao, daZao]
    }
    
    func bloodTonicHerbs() -> [Herb]{
        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DangGui), majorFormulas: "", images: [], context: self.moc)
        let shuDiHuang = Herb(pinyinName: "Shu Di Huang", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShuDiHuang), majorFormulas: "", images: [], context: self.moc)
        let baiShao = Herb(pinyinName: "Bai Shao", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiShao), majorFormulas: "", images: [], context: self.moc)
        let sangShen = Herb(pinyinName: "Sang Shen", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangShen), majorFormulas: "", images: [], context: self.moc)
        
        return [dangGui, shuDiHuang, baiShao, sangShen]
    }
    
    func yangTonicHerbs() -> [Herb]{
        
        let yinYangHuo = Herb(pinyinName: "Yin Yang Huo", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YinYangHuo), majorFormulas: "", images: [], context: self.moc)
        let huTaoRen = Herb(pinyinName: "Hu Tao Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuTaoRen), majorFormulas: "", images: [], context: self.moc)
        let xuDuan = Herb(pinyinName: "Xu Duan", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XuDuan), majorFormulas: "", images: [], context: self.moc)
        let baJiTian = Herb(pinyinName: "Ba Ji Tian", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaJiTian), majorFormulas: "", images: [], context: self.moc)
        
        return [yinYangHuo, huTaoRen, xuDuan, baJiTian]
    }
    
    func yinTonicHerbs() -> [Herb]{
        let maiMenDong = Herb(pinyinName: "Mai Men Dong", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MaiMenDong), majorFormulas: "", images: [], context: self.moc)
        let tianMenDong = Herb(pinyinName: "Tian Men Dong", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TianMenDong), majorFormulas: "", images: [], context: self.moc)
        let baiHe = Herb(pinyinName: "Bai He", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiHe), majorFormulas: "", images: [], context: self.moc)
        let heiZhiMa = Herb(pinyinName: "Hei Zhi Ma", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HeiZhiMa), majorFormulas: "", images: [], context: self.moc)
        
        return [maiMenDong, tianMenDong, baiHe, heiZhiMa]
    }
    
    func astringentHerbs() -> [Herb]{
        
        let wuWeiZi = Herb(pinyinName: "Wu Wei Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuWeiZi), majorFormulas: "", images: [], context: self.moc)
        let rouDouKou = Herb(pinyinName: "Rou Dou Kou", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: "", images: [], context: self.moc)
        let wuMei = Herb(pinyinName: "Wu Mei", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuMei), majorFormulas: "", images: [], context: self.moc)
        let fuPenZi = Herb(pinyinName: "Fu Pen Zi", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuPenZi), majorFormulas: "", images: [], context: self.moc)
        let shanZhuYu = Herb(pinyinName: "Shan Zhu Yu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShanZhuYu), majorFormulas: "", images: [], context: self.moc)
        
        return [wuWeiZi, rouDouKou, wuMei, fuPenZi, shanZhuYu ]
    }
    
    func shenCalmingHerbs() -> [Herb]{
        
        let longGu = Herb(pinyinName: "Long Gu", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LongGu), majorFormulas: "", images: [], context: self.moc)
        let muLi = Herb(pinyinName: "Mu Li", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuLi), majorFormulas: "", images: [], context: self.moc)
        
        return [longGu, muLi]

    }
    
    func shenNourishingHerbs() -> [Herb]{
        
        let suanZaoRen = Herb(pinyinName: "Suan Zao Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SuanZaoRen), majorFormulas: "", images: [], context: self.moc)
        let baiZiRen = Herb(pinyinName: "Bai Zi Ren", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZiRen), majorFormulas: "", images: [], context: self.moc)
        
        return [suanZaoRen, baiZiRen]
    }
    
    func liverWindExtinguishingHerbs() -> [Herb]{
        
        let gouTeng = Herb(pinyinName: "Gou Teng", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GouTeng), majorFormulas: "", images: [], context: self.moc)
        let tianMa = Herb(pinyinName: "Tian Ma", botanicalName: "Bupleuri Radix", englishName: "Hare's Ear Root", category: "Purge Heat", temp: "cool", meridians: "GB, LR, SJ, PC" , uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TianMa), majorFormulas: "", images: [], context: self.moc)
        
        return [gouTeng, tianMa]
    }
    
//    func externalUseHerbs() -> [Herb]{
//        
//    }
    
    
    
    


}

