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
        case GuiZhi, ZiSuYe, JingJie, QiangHuo, ShengJiang
        case BoHe, NiuBangZi, SangYe, JuHua, GeGen, ChaiHu
        case ShiGao, ZhiMu, ZhiZi, XiaKuCao
        case ShengDiHuang, MuDanPi, XuanShen
        case HuangQin, HuangLian, HuangBai, LongDanCao
        case JinYinHua, LianQiao, PuGongYing, TuFuLing
        case QingHao, DiGuPi, BaiWei
        case DaHuang, MangXiao, HuoMaRen
        case FuLing, ZeXie, YiYiRen
        case DuHuo, MuGua, SangJiSheng, SangZhi
        case ChuanBeiMu, GuaLuo
        case BanXia, JieGeng
        case XingRen, PiPaYe, ZiSuZi, SangBaiPi
        case HuoPo, CangZhu, HuoXiang, ShaRen
        case ShanZha, ShenQu, MaiYa, LaiFuZi
        case ChenPi, XiangFu, WuYao, ChuanLianZi
        case SanQi, PuHuang, CeBaiYe, AiYe
        case ChuanXiong, DanShen, YanHuoSuo, YuJin, TaoRen, HongHua, MoYao, ChiShao
        case FuZi, GanJiang, RouGui, HuJiao, XiaoHuiXiang
        case RenShen, DangShen, HuangQi, BaiZhu, GanCao, DaZao
        case DangGui, ShuDiHuang, BaiShao, SangShen
        case YinYangHuo, HuTaoRen, XuDuan, BaJiTian
        case MaiMenDong, TianMenDong, BaiHe, HeiZhiMa
        case WuWeiZi, RouDouKou, WuMei, FuPenZi, ShanZhuYu
        case LongGu, MuLi
        case SuanZaoRen, BaiZiRen
        case GouTeng, TianMa
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
         
        case .ShiGao : self.use =
        case. ZhiMu :
        case .ZhiZi :
        case .XiaKuCao :
            
            
        case .RenShen   : self.use = renShen
        case .BaiShao   : self.use = baiShao
        case .BaiZhu    : self.use = baiZhu
            
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
    
    var shiGao
    var zhiMu
    var zhiZi
    xiaKuCao
    shengDiHuang
    muDanPi
    xuanShen
    huangQin
    huangLian
    huangBai
    longDanCao
    jinYinHua
    lianQiao
    puGongYing
    tuFuLing
    qingHao
    diGuPi
    baiWei
    daHuang
    mangXiao
    huoMaRen
    fuLing
    zeXie
    yiYiRen
    duHuo
    muGua
    sangJiSheng
    sangZhi
    chuanBeiMu
    guaLuo
    banXia
    jieGeng
    xingRen
    
    piPaYe
    
    ziSuZi
    sangBaiPi
    huoPo
    cangZhu
    huoXiang
    shaRen
    shanZha
    
    shenQu
    maiYa
    laiFuZi
    chenPi
    xiangFu
    wuYao
    
    chuanLianZi
    sanQi
    puHuang
    ceBaiYe
    aiYe
    chuanXiong
    danShen
    
    
    yanHuoSuo
    yuJin
    taoRen
    hongHua
    
    moYao
    chiShao
    fuZi
    ganJiang
    rouGui
    huJiao
    xiaoHuiXiang
    renShen
    dangShen
    huangQi
    baiZhu
    ganCao
    
    daZao
    dangGui
    shuDiHuang
    baiShao
    sangShen
    yinYangHuo
    
    huTaoRen
    xuDuan
    baJiTian
    
    maiMenDong
    tianMenDong
    baiHe
    heiZhiMa
    wuWeiZi
    rouDouKou
    wuMei
    fuPenZi
    shanZhuYu
    
    longGu
    
    
    muLi
    suanZaoRen
    baiZiRen
    gouTeng
    tianMa
    
    
}



