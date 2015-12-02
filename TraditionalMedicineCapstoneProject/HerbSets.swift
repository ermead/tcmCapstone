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
    
    var HerbSet = HerbSetType.DisperseWindCold
    var herbset: [Herb] = []
    
    var thisHerbSetType: HerbSetType?
    
    enum HerbSetType {
        case AllHerbs
        case DisperseWindCold
        case DisperseWindHeat
        case PurgeHeat
        case ClearBloodHeat
        case ClearDampHeat
        case ClearToxicHeat
        case ClearDeficiencyHeat
        case Laxatives
        case DrainDamp
        case DispelWindDamp
        case DissolveHotPhlegm
        case DissolveColdPhlegm
        case StopCough
        case AromaticsDispelDamp
        case Digestives
        case RegulateQi
        case StopBleeding
        case MoveBlood
        case WarmInterior
        case TonifyQi
        case TonifyBlood
        case TonifyYang
        case TonifyYin
        case Astringents
        case CalmShen
        case NourishShen
        case ExtinguishLiverWind
        case ExternalApplication
        
        
    }
    
    func getHerbSet(thisSetType: HerbSetType) -> [Herb]{
        //self.thisHerbSetType = thisSetType
        self.HerbSet = thisSetType
        print("this herb set I am trying to load is \(HerbSet)")
        switch thisSetType {
            
        case .DisperseWindCold: return windColdHerbs()
        case .DisperseWindHeat: return windHeatHerbs()
        case .PurgeHeat:        return purgeHeatHerbs()
        case .ClearBloodHeat:   return clearBloodHeatHerbs()
        case .ClearDampHeat:    return clearDampHeatHerbs()
        case .ClearToxicHeat:   return clearToxicHeatHerbs()
        case .ClearDeficiencyHeat: return clearDeficiencyHeatHerbs()
        case .Laxatives:        return laxativeHerbs()
        case .DrainDamp:        return drainDampHerbs()
        case .DispelWindDamp:   return dispelWindDampHerbs()
        case .DissolveHotPhlegm: return dissolveHotPhlegmHerbs()
        case .DissolveColdPhlegm: return dissolveColdPhlegmHerbs()
        case .StopCough:        return stopCoughHerbs()
        case .AromaticsDispelDamp: return aromaticDampResolvingHerbs()
        case .Digestives:       return digestiveHerbs()
        case .RegulateQi:       return regulateQiHerbs()
        case .StopBleeding:     return stopBleedingHerbs()
        case .MoveBlood:        return bloodMovingHerbs()
        case .WarmInterior:     return interiorWarmingHerbs()
        case .TonifyQi:         return qiTonicHerbs()
        case .TonifyBlood:      return bloodTonicHerbs()
        case .TonifyYang:       return yangTonicHerbs()
        case .TonifyYin:        return yinTonicHerbs()
        case .Astringents:      return astringentHerbs()
        case .CalmShen:         return shenCalmingHerbs()
        case .NourishShen:      return shenNourishingHerbs()
        case .ExtinguishLiverWind: return liverWindExtinguishingHerbs()
        //case .ExternalApplication: return externalApplicationHerbs()

            
        default: return []
            
        }
    }
    
    
    func windColdHerbs()->[Herb]{
        
        print("Wind-Cold herbs set")
        
        let guiZhi = Herb(pinyinName: "Gui Zhi", botanicalName: "Ramulus Cinnamomi", englishName: "Cassia Twig", chineseCharacter: "桂枝", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuiZhi), majorFormulas: " ", images: [], context: self.moc)
        
        let ziSuYe = Herb(pinyinName: "Zi Su Ye", botanicalName: "Folium Perillae", englishName: "Perilla Leaf", chineseCharacter: "紫苏叶", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuYe), majorFormulas: " ", images: [], context: self.moc)
        
        let jingJie = Herb(pinyinName: "Jing Jie", botanicalName: "Herba Schizonepetae", englishName: "All-Grass of Fineleaf Schizonepeta", chineseCharacter: "荆芥", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JingJie), majorFormulas: " ", images: [], context: self.moc)
        
        let qiangHuo = Herb(pinyinName: "Qiang Huo", botanicalName: "Radix Et Rhizoma Notopterygii", englishName: "Root And Rhizome of Incised Notoptergium", chineseCharacter: "羌活", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QiangHuo), majorFormulas: " ", images: [], context: self.moc)
        
        let shengJiang = Herb(pinyinName: "Sheng Jiang", botanicalName: "Rhizoma Zingiberis Recens", englishName: "Fresh Ginger", chineseCharacter: "生姜", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengJiang), majorFormulas: " ", images: [], context: self.moc)
    
        
        return [guiZhi, ziSuYe, jingJie, qiangHuo, shengJiang]
        
        
    }
    
    func windHeatHerbs()->[Herb]{
        
        print("Wind-Heat herbs set")
      
        let boHe = Herb(pinyinName: "Bo He", botanicalName: "Herba Menthae", englishName: "Mentha, Peppermint", chineseCharacter: "薄荷", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BoHe), majorFormulas: " ", images: [], context: self.moc)
        
        let niuBangZi = Herb(pinyinName: "Niu Bang Zi", botanicalName: "Fructus Arctii Lappae", englishName: "Achene of Great Burdock", chineseCharacter: "牛蒡子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.NiuBangZi), majorFormulas: " ", images: [], context: self.moc)
        
        let sangYe = Herb(pinyinName: "Sang Ye", botanicalName: "Folium Mori", englishName: "Mulberry Leaf", chineseCharacter: "桑叶", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangYe), majorFormulas: " ", images: [], context: self.moc)
        
        let juHua = Herb(pinyinName: "Ju Hua", botanicalName: "Flos Chrysanthemi", englishName: "Chrysanthemum Flower", chineseCharacter: "菊花", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JuHua), majorFormulas: " ", images: [], context: self.moc)
        
        let geGen = Herb(pinyinName: "Ge Gen", botanicalName: "Radix Puerariae", englishName: "Root of Lobed Kudzuvine", chineseCharacter: "葛根", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GeGen), majorFormulas: " ", images: [], context: self.moc)
        
        let chaiHu = Herb(pinyinName: "Chai Hu", botanicalName: "Radix Bupleuri", englishName: "Root of Chinese Thorowax", chineseCharacter: "柴胡", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChaiHu), majorFormulas: " ", images: [], context: self.moc)
        
        return [boHe, niuBangZi, sangYe, juHua, geGen, chaiHu]
       
    }
    
    func purgeHeatHerbs() -> [Herb]{
        
        let shiGao = Herb(pinyinName: "Shi Gao", botanicalName: "Gypsum Fibrosum Praeparata", englishName: "Calcined Gypsum", chineseCharacter: "煅石膏", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShiGao), majorFormulas: " ", images: [], context: self.moc)
        
        let zhiMu = Herb(pinyinName: "Zhi Mu", botanicalName: "Rhizoma Anemarrhenae", englishName: "Rhizome of Common Anamarrhena", chineseCharacter: "知母", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZhiMu), majorFormulas: " ", images: [], context: self.moc)
        
        let zhiZi = Herb(pinyinName: "Zhi Zi", botanicalName: "Fructus Akebiae", englishName: "Akebia Fruit", chineseCharacter: "预知子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZhiZi), majorFormulas: " ", images: [], context: self.moc)
        
        let xiaKuCao = Herb(pinyinName: "Xia Ku Cao", botanicalName: "Herba Ajugae Ciliatae", englishName: "All-Grass of Decumbent Bugle", chineseCharacter: "白毛夏枯草", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiaKuCao), majorFormulas: " ", images: [], context: self.moc)
        
        return [shiGao, zhiMu, zhiZi, xiaKuCao]
    }
    
    func clearBloodHeatHerbs() -> [Herb]{
      
        let shengDiHuang = Herb(pinyinName: "Sheng Di Huang", botanicalName: "Radix Rehmanniae", englishName: "Fresh Rehmannia Root", chineseCharacter: "生地黄", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShengDiHuang), majorFormulas: " ", images: [], context: self.moc)
        
        let muDanPi = Herb(pinyinName: "Mu Dan Pi", botanicalName: "Cortex Moutan", englishName: "Tree Peony Bark", chineseCharacter: "牡丹皮", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuDanPi), majorFormulas: " ", images: [], context: self.moc)
        
        let xuanShen = Herb(pinyinName: "Xuan Shen", botanicalName: "Radix Scrophulariae", englishName: "Figwort Root", chineseCharacter: "玄参", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XuanShen), majorFormulas: " ", images: [], context: self.moc)
        

        return [shengDiHuang, muDanPi, xuanShen]
        
    }
    
    func clearDampHeatHerbs() -> [Herb]{
        
        let huangQin = Herb(pinyinName: "Huang Qin", botanicalName: "Radix Scutellariae", englishName: "Root of Baikal Skullcap", chineseCharacter: "黄芩", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangQin), majorFormulas: " ", images: [], context: self.moc)
        
        let huangLian = Herb(pinyinName: "Huang Lian", botanicalName: "Rhizoma Coptidis", englishName: "Rhizome of Chinese Goldthread", chineseCharacter: "川黄连", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangLian), majorFormulas: " ", images: [], context: self.moc)
        
        let huangBai = Herb(pinyinName: "Huang Bai", botanicalName: "Cortex Phellodendri", englishName: "Phellodendron Bark", chineseCharacter: "黄柏", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangBai), majorFormulas: " ", images: [], context: self.moc)
        
        let longDanCao = Herb(pinyinName: "Long Dan Cao", botanicalName: "Radix Gentianae", englishName: "Root of Przewalsk Gentian", chineseCharacter: "龙胆草", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LongDanCao), majorFormulas: " ", images: [], context: self.moc)
        
        return [huangQin, huangLian, huangBai, longDanCao]
        
    }
    
    func clearToxicHeatHerbs() -> [Herb]{
        
        
        let jinYinHua = Herb(pinyinName: "Jin Yin Hua", botanicalName: "Flos Lonicerae", englishName: "Honeysuckle Flower", chineseCharacter: "金银花", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JinYinHua), majorFormulas: " ", images: [], context: self.moc)
        
        let lianQiao = Herb(pinyinName: "Lian Qiao", botanicalName: "Hypericum Perforatum", englishName: "St John's Wort", chineseCharacter: "贯叶连翘", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LianQiao), majorFormulas: " ", images: [], context: self.moc)
        
        let puGongYing = Herb(pinyinName: "Pu Gong Ying", botanicalName: "Herba Taraxaci", englishName: "Dandelion", chineseCharacter: "蒲公英", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PuGongYing), majorFormulas: " ", images: [], context: self.moc)
        
        let tuFuLing = Herb(pinyinName: "Tu Fu Ling", botanicalName: "Rhizoma Smilacis Glabrae", englishName: "Glabrous Greenbrier Rhizome", chineseCharacter: "土茯苓", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TuFuLing), majorFormulas: " ", images: [], context: self.moc)
        
        return [jinYinHua, lianQiao, puGongYing, tuFuLing]
        
    }
    
    func clearDeficiencyHeatHerbs() -> [Herb]{
        
        let qingHao = Herb(pinyinName: "Qing Hao", botanicalName: "Herba Artemisiae Annuae", englishName: "Sweet Wormwood Herb", chineseCharacter: "青蒿", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.QingHao), majorFormulas: " ", images: [], context: self.moc)
        
        let diGuPi = Herb(pinyinName: "Di Gu Pi", botanicalName: "Cortex Lycii Radicis", englishName: "Root - Bark of Chinese Wolfberry", chineseCharacter: "地骨皮", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DiGuPi), majorFormulas: " ", images: [], context: self.moc)
        
        let baiWei = Herb(pinyinName: "Bai Wei", botanicalName: "Radix Cynanchi Atrati", englishName: "Blackend Swallowwort Root", chineseCharacter: "白薇", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiWei), majorFormulas: " ", images: [], context: self.moc)
        
        return [qingHao, diGuPi, baiWei]
    }
    
    func laxativeHerbs() -> [Herb]{
        
        let daHuang = Herb(pinyinName: "Da Huang", botanicalName: "Radix Et Rhizoma Rhei", englishName: "Root And Rhizome of Sorrel Rhubarb", chineseCharacter: "大黄", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DaHuang), majorFormulas: " ", images: [], context: self.moc)
        
        let mangXiao = Herb(pinyinName: "Mang Xiao", botanicalName: "Natrii Sulfas", englishName: "Sodium Sulfate", chineseCharacter: "芒硝", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MangXiao), majorFormulas: " ", images: [], context: self.moc)
        
        let huoMaRen = Herb(pinyinName: "Huo Ma Ren", botanicalName: "Semen Cannabis;Fructus Cannabis", englishName: "Hemp Seed", chineseCharacter: "火麻仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoMaRen), majorFormulas: " ", images: [], context: self.moc)
        
        return [daHuang, mangXiao, huoMaRen]
    }
    
    func drainDampHerbs() -> [Herb]{
        
        let fuLing = Herb(pinyinName: "Fu Ling", botanicalName: "Poriae Alba", englishName: "White Indian Bread", chineseCharacter: "白茯苓", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuLing), majorFormulas: " ", images: [], context: self.moc)
        
        let zeXie = Herb(pinyinName: "Ze Xie", botanicalName: "Rhizoma Alismatis", englishName: "Rhizome of Oriental Waterplantain", chineseCharacter: "泽泻", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZeXie), majorFormulas: " ", images: [], context: self.moc)
        
        let yiYiRen = Herb(pinyinName: "Yi Yi Ren", botanicalName: "Semen Coicis", englishName: "Seed of Jobstears", chineseCharacter: "薏苡仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YiYiRen), majorFormulas: " ", images: [], context: self.moc)
        
        
        return [fuLing, zeXie, yiYiRen]
    }
    
    func dispelWindDampHerbs() -> [Herb]{
        
        let duHuo = Herb(pinyinName: "Du Huo", botanicalName: "Radix Heraclei Maximi", englishName: "Root of Laxflower Cowparsnip", chineseCharacter: "大独活", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DuHuo), majorFormulas: " ", images: [], context: self.moc)
        
        let muGua = Herb(pinyinName: "Mu Gua", botanicalName: "Fructus Chaenomelis", englishName: "Fruit of Common Floweringquince", chineseCharacter: "木瓜", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuGua), majorFormulas: " ", images: [], context: self.moc)
        
        let sangJiSheng = Herb(pinyinName: "Sang Ji Sheng", botanicalName: "Herba Taxilli", englishName: "Chinese Taxillus Herb", chineseCharacter: "桑寄生", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangJiSheng), majorFormulas: " ", images: [], context: self.moc)
        
        let sangZhi = Herb(pinyinName: "Sang Zhi", botanicalName: "Ramulus Mori", englishName: "Mulberry Twig", chineseCharacter: "桑枝", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangZhi), majorFormulas: " ", images: [], context: self.moc)
        
        return [duHuo, muGua, sangJiSheng, sangZhi]
    }
    
    func dissolveHotPhlegmHerbs() -> [Herb]{
        
        let chuanBeiMu = Herb(pinyinName: "Chuan Bei Mu", botanicalName: "Bulbus Fritillariae Cirrhosae", englishName: "Bulb of Tendrilleaf Fritillary", chineseCharacter: "川贝母", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanBeiMu), majorFormulas: " ", images: [], context: self.moc)
        
        let guaLuo = Herb(pinyinName: "Gua Luo", botanicalName: "Retinervus Luffae Fructus", englishName: "Luffa Vegetable Sponge", chineseCharacter: "丝瓜络", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GuaLuo), majorFormulas: " ", images: [], context: self.moc)
        
        return [chuanBeiMu, guaLuo]
    }
    
    func dissolveColdPhlegmHerbs() -> [Herb]{
      
        let banXia = Herb(pinyinName: "Ban Xia", botanicalName: "Rhizoma Pinelliae", englishName: "Tuber of Pinellia", chineseCharacter: "半夏", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BanXia), majorFormulas: " ", images: [], context: self.moc)
        
        let jieGeng = Herb(pinyinName: "Jie Geng", botanicalName: "Radix Platycodi", englishName: "Balloonflower Root", chineseCharacter: "白桔梗", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.JieGeng), majorFormulas: " ", images: [], context: self.moc)
        
        return [banXia, jieGeng]
    }
    
    func stopCoughHerbs() -> [Herb]{
        
        
        let xingRen = Herb(pinyinName: "Xing Ren", botanicalName: "Semen Armeniacae Amarum", englishName: "Bitter Apricot Seed", chineseCharacter: "苦杏仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XingRen), majorFormulas: " ", images: [], context: self.moc)
        
        let piPaYe = Herb(pinyinName: "Pi Pa Ye", botanicalName: "Folium Eriobotryae", englishName: "Loquat Leaf", chineseCharacter: "枇杷叶", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PiPaYe), majorFormulas: " ", images: [], context: self.moc)
        
        let ziSuZi = Herb(pinyinName: "Zi Su Zi", botanicalName: "Fructus Perillae", englishName: "Perilia Fruit", chineseCharacter: "紫苏子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ZiSuZi), majorFormulas: " ", images: [], context: self.moc)
        
        let sangBaiPi = Herb(pinyinName: "Sang Bai Pi", botanicalName: "Cortex Mori", englishName: "White Mulberry Root-Bark", chineseCharacter: "桑柏皮", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangBaiPi), majorFormulas: " ", images: [], context: self.moc)
        
        return [xingRen, piPaYe, ziSuZi, sangBaiPi]
    }
    
    func aromaticDampResolvingHerbs() -> [Herb]{
        
        let huoPo = Herb(pinyinName: "Huo Po", botanicalName: "", englishName: "", chineseCharacter: "", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoPo), majorFormulas: " ", images: [], context: self.moc)
        
        let cangZhu = Herb(pinyinName: "Cang Zhu", botanicalName: "Rhizoma Atractylodis", englishName: "Rhizome of Swordlike Atractylodes", chineseCharacter: "苍术", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.CangZhu), majorFormulas: " ", images: [], context: self.moc)
        
        let huoXiang = Herb(pinyinName: "Huo Xiang", botanicalName: "Herba Pogostemonis", englishName: "All-Grass of Cablin Potchouli", chineseCharacter: "广霍香", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuoXiang), majorFormulas: " ", images: [], context: self.moc)
        
        let shaRen = Herb(pinyinName: "Sha Ren", botanicalName: "Fructus Amomi", englishName: "Villous Amomum Fruit", chineseCharacter: "砂仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShaRen), majorFormulas: " ", images: [], context: self.moc)
        
        return [huoPo, cangZhu, huoXiang, shaRen]
    }
    
    func digestiveHerbs() -> [Herb]{
        
        
        let shanZha = Herb(pinyinName: "Shan Zha", botanicalName: "Fructus Crataegi", englishName: "Hawthorn Fruit", chineseCharacter: "山楂", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShanZha), majorFormulas: " ", images: [], context: self.moc)
        
        let shenQu = Herb(pinyinName: "Shen Qu", botanicalName: "Massa Fermentata Medicinalis Praeparata", englishName: "Medicated Leaven", chineseCharacter: "炒神曲", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShenQu), majorFormulas: " ", images: [], context: self.moc)
        
        let maiYa = Herb(pinyinName: "Mai Ya", botanicalName: "Fructus Hordei Germinatus Praeparata", englishName: "Prepared Germinated Barley", chineseCharacter: "炒麦芽", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MaiYa), majorFormulas: " ", images: [], context: self.moc)
        
        let laiFuZi = Herb(pinyinName: "Lai Fu Zi", botanicalName: "Semen Raphani", englishName: "Radish Seed", chineseCharacter: "莱菔子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LaiFuZi), majorFormulas: " ", images: [], context: self.moc)
        
        
        return [shanZha, shenQu, maiYa, laiFuZi]
    }
    
    func regulateQiHerbs() -> [Herb]{
        
        let chenPi = Herb(pinyinName: "Chen Pi", botanicalName: "Pericarpium Citri Reticulatae", englishName: "Dried Tangerine Peel", chineseCharacter: "陈皮", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChenPi), majorFormulas: " ", images: [], context: self.moc)
        
        let xiangFu = Herb(pinyinName: "Xiang Fu", botanicalName: "Rhizoma Cyperi", englishName: "Rhizome of Nutgrass Galingale", chineseCharacter: "香附", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiangFu), majorFormulas: " ", images: [], context: self.moc)
        
        let wuYao = Herb(pinyinName: "Wu Yao", botanicalName: "Radix Linderae", englishName: "Combined Spicebush Root", chineseCharacter: "乌药", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuYao), majorFormulas: " ", images: [], context: self.moc)
        
        let chuanLianZi = Herb(pinyinName: "Chuan Lian Zi", botanicalName: "Fructus Meliae Toosendan", englishName: "Szechwan Chinaberry Fruit", chineseCharacter: "川楝子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanLianZi), majorFormulas: " ", images: [], context: self.moc)
        
        return [chenPi, xiangFu, wuYao, chuanLianZi]
    }
    
    func stopBleedingHerbs() -> [Herb]{
        
        let sanQi = Herb(pinyinName: "San Qi", botanicalName: "Radix Notoginseng", englishName: "Sanchi", chineseCharacter: "汉三七", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SanQi), majorFormulas: " ", images: [], context: self.moc)
        
        let puHuang = Herb(pinyinName: "Pu Huang", botanicalName: "Pollen Typhae", englishName: "Pollen of Longbract Cattail", chineseCharacter: "蒲黄", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.PuHuang), majorFormulas: " ", images: [], context: self.moc)
        
        let ceBaiYe = Herb(pinyinName: "Ce Bai Ye", botanicalName: "Cacumen Et Folium Biotae", englishName: "Leafy Twigs of Oriental Arborvitae", chineseCharacter: "侧柏叶", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.CeBaiYe), majorFormulas: " ", images: [], context: self.moc)
        
        let aiYe = Herb(pinyinName: "Ai Ye", botanicalName: "Folium Artemisiae Argyi", englishName: "Leaf of Argy Wormwood", chineseCharacter: "艾叶", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.AiYe), majorFormulas: " ", images: [], context: self.moc)
        

        
        return [sanQi, puHuang, ceBaiYe, aiYe]
    }
    
    func bloodMovingHerbs() -> [Herb]{
        
        let chuanXiong = Herb(pinyinName: "Chuan Xiong", botanicalName: "Radix Chuanxiong；Rhizoma Chuanxiong", englishName: "Chuanxiong Rhizome, Szechuan Lovage Root", chineseCharacter: "川芎", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChuanXiong), majorFormulas: " ", images: [], context: self.moc)
        
        let danShen = Herb(pinyinName: "Dan Shen", botanicalName: "Radix Salviae Liguliobae", englishName: "Root of Ligulilobe Sage", chineseCharacter: "丹参", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DanShen), majorFormulas: " ", images: [], context: self.moc)
        
        let yanHuoSuo = Herb(pinyinName: "Yan Huo Suo", botanicalName: "", englishName: "", chineseCharacter: "", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YanHuoSuo), majorFormulas: " ", images: [], context: self.moc)
        
        let yuJin = Herb(pinyinName: "Yu Jin", botanicalName: "Radix Curcumae", englishName: "Tuber - Root of Common Turmeric", chineseCharacter: "郁金", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YuJin), majorFormulas: " ", images: [], context: self.moc)
        
        let taoRen = Herb(pinyinName: "Tao Ren", botanicalName: "Semen Juglandis", englishName: "English Walnut Seed", chineseCharacter: "核桃仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TaoRen), majorFormulas: " ", images: [], context: self.moc)
        
        let hongHua = Herb(pinyinName: "Hong Hua", botanicalName: "Flos Carthami", englishName: "Safflower", chineseCharacter: "红花", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HongHua), majorFormulas: " ", images: [], context: self.moc)
        
        let moYao = Herb(pinyinName: "Mo Yao", botanicalName: "Resina Myrrhae;Myrrha", englishName: "Myrrh", chineseCharacter: "没药", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MoYao), majorFormulas: " ", images: [], context: self.moc)
        
        let chiShao = Herb(pinyinName: "Chi Shao", botanicalName: "Radix Paeoniae Rubra", englishName: "Red Peony Root", chineseCharacter: "赤芍", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ChiShao), majorFormulas: " ", images: [], context: self.moc)
        
        
        return [chuanXiong, danShen, yanHuoSuo, yuJin, taoRen, hongHua, moYao, chiShao]
        
    }
    
    func interiorWarmingHerbs() -> [Herb]{
        
        let fuZi = Herb(pinyinName: "Fu Zi", botanicalName: "Rhizoma Typhonii", englishName: "Rhizome of Giant Typhonium", chineseCharacter: "白附子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuZi), majorFormulas: " ", images: [], context: self.moc)
        
        let ganJiang = Herb(pinyinName: "Gan Jiang", botanicalName: "Rhizoma Zingiberis", englishName: "Dried Ginger", chineseCharacter: "干姜", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GanJiang), majorFormulas: " ", images: [], context: self.moc)
        
        let rouGui = Herb(pinyinName: "Rou Gui", botanicalName: "Cortex Cinnamomi", englishName: "Cassia Bark", chineseCharacter: "肉桂", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RouGui), majorFormulas: " ", images: [], context: self.moc)
        
        let huJiao = Herb(pinyinName: "Hu Jiao", botanicalName: "Fructus Piperis", englishName: "Pepper Fruit", chineseCharacter: "胡椒", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuJiao), majorFormulas: " ", images: [], context: self.moc)
        
        let xiaoHuiXiang = Herb(pinyinName: "Xiao Hui Xiang", botanicalName: "Fructus Foeniculi", englishName: "Fennel Fruit", chineseCharacter: "小茴香", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XiaoHuiXiang), majorFormulas: " ", images: [], context: self.moc)
        
        return [fuZi, ganJiang, rouGui, huJiao, xiaoHuiXiang]
    }
    
    func qiTonicHerbs() -> [Herb]{
        
        let renShen = Herb(pinyinName: "Ren Shen", botanicalName: "Radix Ginseng", englishName: "Ginseng", chineseCharacter: "人参", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RenShen), majorFormulas: " ", images: [], context: self.moc)
        
        let dangShen = Herb(pinyinName: "Dang Shen", botanicalName: "Radix Codonopsis Pilosulae", englishName: "Root Pilose Asiabell", chineseCharacter: "党参", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DangShen), majorFormulas: " ", images: [], context: self.moc)
        
        let huangQi = Herb(pinyinName: "Huang Qi", botanicalName: "Radix Astragali", englishName: "Root of Membranous Milkvetch", chineseCharacter: "黄芪", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuangQi), majorFormulas: " ", images: [], context: self.moc)
        
        let baiZhu = Herb(pinyinName: "Bai Zhu", botanicalName: "Rhizoma Atractylodis Macrocephalae", englishName: "Rhizome of Largehead Atractylodes", chineseCharacter: "白术", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZhu), majorFormulas: " ", images: [], context: self.moc)
        
        let ganCao = Herb(pinyinName: "Gan Cao", botanicalName: "Radix Glycyrrhizae", englishName: "Root of Ural Licorice", chineseCharacter: "甘草", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GanCao), majorFormulas: " ", images: [], context: self.moc)
        
        let daZao = Herb(pinyinName: "Da Zao", botanicalName: "Fructus Zizyphi Jujubae", englishName: "Jujube Chinese Date", chineseCharacter: "大枣", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DaZao), majorFormulas: " ", images: [], context: self.moc)
        

        
        return [renShen, dangShen, huangQi, baiZhu, ganCao, daZao]
    }
    
    func bloodTonicHerbs() -> [Herb]{
        
        
        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "Radix Angelicae Sinensis", englishName: "Root of Chinese Angelica", chineseCharacter: "当归", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.DangGui), majorFormulas: " ", images: [], context: self.moc)
        
        let shuDiHuang = Herb(pinyinName: "Shu Di Huang", botanicalName: "Radix Rehmanniae Praeparata", englishName: "Prepared Rehmannia Root", chineseCharacter: "熟地黄", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShuDiHuang), majorFormulas: " ", images: [], context: self.moc)
        
        let baiShao = Herb(pinyinName: "Bai Shao", botanicalName: "Radix Paeoniae Alba", englishName: "White Peony Root", chineseCharacter: "白芍", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiShao), majorFormulas: " ", images: [], context: self.moc)
        
        let sangShen = Herb(pinyinName: "Sang Shen", botanicalName: "Fructus Mori", englishName: "Mulberry Fruit", chineseCharacter: "桑椹", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SangShen), majorFormulas: " ", images: [], context: self.moc)
        

        
        return [dangGui, shuDiHuang, baiShao, sangShen]
    }
    
    func yangTonicHerbs() -> [Herb]{
      
        let yinYangHuo = Herb(pinyinName: "Yin Yang Huo", botanicalName: "", englishName: "", chineseCharacter: "", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.YinYangHuo), majorFormulas: " ", images: [], context: self.moc)
        
        let huTaoRen = Herb(pinyinName: "Hu Tao Ren", botanicalName: "Semen Juglandis", englishName: "Walnut Seed, Walnut Kernel", chineseCharacter: "胡桃仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HuTaoRen), majorFormulas: " ", images: [], context: self.moc)
        
        let xuDuan = Herb(pinyinName: "Xu Duan", botanicalName: "Radix Dipsaci", englishName: "Himalayan Teasel Root", chineseCharacter: "川续断", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.XuDuan), majorFormulas: " ", images: [], context: self.moc)
        
        let baJiTian = Herb(pinyinName: "Ba Ji Tian", botanicalName: "", englishName: "", chineseCharacter: "", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaJiTian), majorFormulas: " ", images: [], context: self.moc)
        
        return [yinYangHuo, huTaoRen, xuDuan, baJiTian]
    }
    
    func yinTonicHerbs() -> [Herb]{
       
        let maiMenDong = Herb(pinyinName: "Mai Men Dong", botanicalName: "", englishName: "", chineseCharacter: "", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MaiMenDong), majorFormulas: " ", images: [], context: self.moc)
        
        let tianMenDong = Herb(pinyinName: "Tian Men Dong", botanicalName: "Radix Asparagi", englishName: "Asparagus Root", chineseCharacter: "天门冬", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TianMenDong), majorFormulas: " ", images: [], context: self.moc)
        
        let baiHe = Herb(pinyinName: "Bai He", botanicalName: "Bulbus Lilii", englishName: "Bulb of Greenish Lily", chineseCharacter: "百合", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiHe), majorFormulas: " ", images: [], context: self.moc)
        
        let heiZhiMa = Herb(pinyinName: "Hei Zhi Ma", botanicalName: "Semen Sesami Nigrum", englishName: "Black Sesame", chineseCharacter: "黑芝麻", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.HeiZhiMa), majorFormulas: " ", images: [], context: self.moc)
        
        
        return [maiMenDong, tianMenDong, baiHe, heiZhiMa]
    }
    
    func astringentHerbs() -> [Herb]{
        
        
        let wuWeiZi = Herb(pinyinName: "Wu Wei Zi", botanicalName: "Fructus Schisandrae", englishName: "Chinese Magnoliavine Fruit", chineseCharacter: "五味子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuWeiZi), majorFormulas: " ", images: [], context: self.moc)
        
        let rouDouKou = Herb(pinyinName: "Rou Dou Kou", botanicalName: "Semen Myristicae", englishName: "Nutmeg", chineseCharacter: "肉豆蔻", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.RouDouKou), majorFormulas: " ", images: [], context: self.moc)
        
        let wuMei = Herb(pinyinName: "Wu Mei", botanicalName: "Fructus Mume", englishName: "Smoked Plum", chineseCharacter: "乌梅", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.WuMei), majorFormulas: " ", images: [], context: self.moc)
        
        let fuPenZi = Herb(pinyinName: "Fu Pen Zi", botanicalName: "Fructus Rubi", englishName: "Fruit of Palmleaf Raspberry", chineseCharacter: "复盆子", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.FuPenZi), majorFormulas: " ", images: [], context: self.moc)
        
        let shanZhuYu = Herb(pinyinName: "Shan Zhu Yu", botanicalName: "Fructus Corni", englishName: "Asiatic Cornelian Cherry Fruit", chineseCharacter: "山茱萸", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.ShanZhuYu), majorFormulas: " ", images: [], context: self.moc)

        
        return [wuWeiZi, rouDouKou, wuMei, fuPenZi, shanZhuYu ]
    }
    
    func shenCalmingHerbs() -> [Herb]{
       
        let longGu = Herb(pinyinName: "Long Gu", botanicalName: "Os Draconis Praeparata", englishName: "Prepared Dragon's Bone, Fossilized Bone", chineseCharacter: "煅龙骨", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.LongGu), majorFormulas: " ", images: [], context: self.moc)
        
        let muLi = Herb(pinyinName: "Mu Li", botanicalName: "Concha Ostreae", englishName: "Oyster Shell", chineseCharacter: "牡蛎", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.MuLi), majorFormulas: " ", images: [], context: self.moc)
        

        
        return [longGu, muLi]

    }
    
    func shenNourishingHerbs() -> [Herb]{
        
        let suanZaoRen = Herb(pinyinName: "Suan Zao Ren", botanicalName: "Semen Ziziphi Spinosae", englishName: "Spine Date Seed", chineseCharacter: "酸枣仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.SuanZaoRen), majorFormulas: " ", images: [], context: self.moc)
        
        let baiZiRen = Herb(pinyinName: "Bai Zi Ren", botanicalName: "Semen Biotae", englishName: "Seed of Chinese Arborvitae", chineseCharacter: "柏子仁", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.BaiZiRen), majorFormulas: " ", images: [], context: self.moc)
        
        
        return [suanZaoRen, baiZiRen]
    }
    
    func liverWindExtinguishingHerbs() -> [Herb]{
        
        let gouTeng = Herb(pinyinName: "Gou Teng", botanicalName: "Ramulus Uncariae Cum Uncis", englishName: "Gambir Plant", chineseCharacter: "钩藤", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.GouTeng), majorFormulas: " ", images: [], context: self.moc)
        
        let tianMa = Herb(pinyinName: "Tian Ma", botanicalName: "Rhizoma Gastrodiae", englishName: "Tall Gastrodia Tuber", chineseCharacter: "天麻", category: " ", temp: " ", meridians: " ", uses: HerbUses.sharedController.getHerbUse(HerbUses.Herb.TianMa), majorFormulas: " ", images: [], context: self.moc)
        
        return [gouTeng, tianMa]
    }
    
//    func externalUseHerbs() -> [Herb]{
//        
//    }
    
  
//    Huo Po doesn't have any data
//    Yan Huo Suo doesn't have any data
//    Yin Yang Huo doesn't have any data
//    Ba Ji Tian doesn't have any data
//    Mai Men Dong doesn't have any data
//

}

