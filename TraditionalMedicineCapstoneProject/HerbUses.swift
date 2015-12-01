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
        case .ShengDiHuang
        case    .MuDanPi
        case    .XuanShen
        case .HuangQin
        case    .HuangLian
        case    .HuangBai
        case    .LongDanCao
        case .JinYinHua
         case   .LianQiao
         case   .PuGongYing
         case   .TuFuLing
        case .QingHao
        case    .DiGuPi
        case    .BaiWei
        case .DaHuang
         case   .MangXiao
        case    .HuoMaRen
        case .FuLing
        case    .ZeXie
        case    .YiYiRen
        case .DuHuo
        case    .MuGua
        case    .SangJiSheng
        case    .SangZhi
        case .ChuanBeiMu
        case    .GuaLuo
        case .BanXia
         case   .JieGeng
        case .XingRen
         case   .PiPaYe
         case   .ZiSuZi
         case   .SangBaiPi
        case .HuoPo
        case    .CangZhu
        case    .HuoXiang
        case    .ShaRen
        case .ShanZha
        case    ShenQu
        case    MaiYa
        case    LaiFuZi
        case ChenPi
         case   XiangFu
        case    WuYao
        case    ChuanLianZi
        case SanQi
         case   PuHuang
         case   CeBaiYe
        case    AiYe
        case ChuanXiong
        case DanShen
        case YanHuoSuo
        case YuJin
        case TaoRen
        case HongHua
        case MoYao
        case    ChiShao
        case FuZi
         case   GanJiang
         case   RouGui
         case   HuJiao
         case   XiaoHuiXiang
        case RenShen
        case    DangShen
        case HuangQi
        case    BaiZhu
        case    GanCao
        case    DaZao
        case DangGui
        case ShuDiHuang
        case BaShao
        case    SangShen
        case YinYangHuo
        case    HuTaoRen
        case    XuDuan
        case    BaJiTian
        case MaiMenDong
        case    TianMenDong
        case    BaiHe
        case    HeiZhiMa
        case WuWeiZi
        case    RouDouKou
        case    WuMei
        case    FuPenZi
         case   ShanZhuYu
        case LongGu
        case    MuLi
        case SuanZaoRen
        case    BaiZiRen
        case GouTeng
        case   TianMa

            
            
            
       
            
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
    
    var shiGao = ""
    var zhiMu = ""
    var zhiZi = ""
    var xiaKuCao = ""
    var shengDiHuang = ""
    var muDanPi = ""
    var xuanShen = ""
    var huangQin = ""
    var huangLian = ""
    var huangBai = ""
    var longDanCao = ""
    var jinYinHua = ""
    var lianQiao = ""
    var puGongYing = ""
    var tuFuLing = ""
    var qingHao = ""
    var diGuPi = ""
    var baiWei = ""
    var daHuang = ""
    var mangXiao = ""
    var huoMaRen = ""
    var fuLing = ""
    var zeXie = ""
    var yiYiRen = ""
    var duHuo = ""
    var muGua = ""
    var sangJiSheng = ""
    var sangZhi = ""
    var chuanBeiMu = ""
    var guaLuo = ""
    var banXia = ""
    var jieGeng = ""
    var xingRen = ""
    
    var piPaYe = ""
    
    var ziSuZi = ""
    var sangBaiPi = ""
    var huoPo = ""
    var cangZhu = ""
    var huoXiang = ""
    var shaRen = ""
    var shanZha = ""
    
    var shenQu = ""
   var  maiYa = ""
    var laiFuZi = ""
    var chenPi = ""
    var xiangFu = ""
    var wuYao = ""
    
    var chuanLianZi = ""
    var sanQi = ""
    var puHuang = ""
    var ceBaiYe = ""
    var aiYe = ""
    var chuanXiong = ""
    var danShen = ""
    
    
    var yanHuoSuo = ""
    var yuJin = ""
    var taoRen = ""
    var hongHua = ""
    
    var moYao = ""
    var chiShao = ""
    var fuZi = ""
    var ganJiang = ""
    var rouGui = ""
    var huJiao = ""
    var xiaoHuiXiang = ""
    var renShen = ""
    var dangShen = ""
    var huangQi = ""
    var baiZhu = ""
    var ganCao = ""
    
    var daZao = ""
    var dangGui = ""
    var shuDiHuang = ""
    var baiShao = ""
    var sangShen = ""
    var yinYangHuo = ""
    
    var huTaoRen = ""
    var xuDuan = ""
    var baJiTian = ""
    
    var maiMenDong = ""
    var tianMenDong = ""
    var baiHe = ""
    var heiZhiMa = ""
    var wuWeiZi = ""
    var rouDouKou = ""
    var wuMei = ""
    var fuPenZi = ""
    var shanZhuYu = ""
    
    var longGu = ""
    
    var muLi = ""
    var suanZaoRen = ""
    var baiZiRen = ""
    var gouTeng = ""
    var tianMa = ""
    
    
}



