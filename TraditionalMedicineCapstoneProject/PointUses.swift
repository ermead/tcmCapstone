//
//  PointUses.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/30/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

class PointUses: NSObject {
    
    static let sharedController = PointUses()
    
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
    
    func getPointUse(point: PointUses.Point) -> String {
        
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
            
        case .ShiGao : self.use = boHe
        case .ZhiMu : self.use = boHe
        case .ZhiZi : self.use = boHe
        case .XiaKuCao : self.use = boHe
        case .ShengDiHuang : self.use = boHe
        case .MuDanPi : self.use = boHe
        case .XuanShen : self.use = boHe
        case .HuangQin : self.use = boHe
        case .HuangLian : self.use = boHe
        case .HuangBai : self.use = boHe
        case .LongDanCao : self.use = boHe
        case .JinYinHua : self.use = boHe
        case .LianQiao : self.use = boHe
        case .PuGongYing : self.use = boHe
        case .TuFuLing : self.use = boHe
        case .QingHao : self.use = boHe
        case .DiGuPi : self.use = boHe
        case .BaiWei : self.use = boHe
        case .DaHuang : self.use = boHe
        case .MangXiao : self.use = boHe
        case .HuoMaRen : self.use = boHe
        case .FuLing : self.use = boHe
        case .ZeXie : self.use = boHe
        case .YiYiRen : self.use = boHe
        case .DuHuo : self.use = boHe
        case .MuGua : self.use = boHe
        case .SangJiSheng : self.use = boHe
        case .SangZhi : self.use = boHe
        case .ChuanBeiMu : self.use = boHe
        case .GuaLuo : self.use = boHe
        case .BanXia : self.use = boHe
        case .JieGeng : self.use = boHe
        case .XingRen : self.use = boHe
        case .PiPaYe : self.use = boHe
        case .ZiSuZi : self.use = boHe
        case .SangBaiPi : self.use = boHe
        case .HuoPo : self.use = boHe
        case .CangZhu : self.use = boHe
        case .HuoXiang : self.use = boHe
        case .ShaRen : self.use = boHe
        case .ShanZha : self.use = boHe
        case .ShenQu : self.use = boHe
        case .MaiYa : self.use = boHe
        case .LaiFuZi : self.use = boHe
        case .ChenPi : self.use = boHe
        case .XiangFu : self.use = boHe
        case .WuYao : self.use = boHe
        case .ChuanLianZi : self.use = boHe
        case .SanQi : self.use = boHe
        case .PuHuang : self.use = boHe
        case .CeBaiYe : self.use = boHe
        case .AiYe : self.use = boHe
        case .ChuanXiong : self.use = boHe
        case .DanShen : self.use = boHe
        case .YanHuoSuo : self.use = boHe
        case .YuJin : self.use = boHe
        case .TaoRen : self.use = boHe
        case .HongHua : self.use = boHe
        case .MoYao : self.use = boHe
        case .ChiShao : self.use = boHe
        case .FuZi : self.use = boHe
        case .GanJiang : self.use = boHe
        case .RouGui : self.use = boHe
        case .HuJiao : self.use = boHe
        case .XiaoHuiXiang : self.use = boHe
        case .RenShen : self.use = boHe
        case .DangShen : self.use = boHe
        case .HuangQi : self.use = boHe
        case .BaiZhu : self.use = boHe
        case .GanCao : self.use = boHe
        case .DaZao : self.use = boHe
        case .DangGui : self.use = boHe
        case .ShuDiHuang : self.use = boHe
        case .BaiShao : self.use = boHe
        case .SangShen : self.use = boHe
        case .YinYangHuo : self.use = boHe
        case .HuTaoRen : self.use = boHe
        case .XuDuan : self.use = boHe
        case .BaJiTian : self.use = boHe
        case .MaiMenDong : self.use = boHe
        case .TianMenDong : self.use = boHe
        case .BaiHe : self.use = boHe
        case .HeiZhiMa : self.use = boHe
        case .WuWeiZi : self.use = boHe
        case .RouDouKou : self.use = boHe
        case .WuMei : self.use = boHe
        case .FuPenZi : self.use = boHe
        case .ShanZhuYu : self.use = boHe
        case .LongGu : self.use = boHe
        case .MuLi : self.use = boHe
        case .SuanZaoRen : self.use = boHe
        case .BaiZiRen : self.use = boHe
        case .GouTeng : self.use = boHe
        case .TianMa : self.use = boHe
            
            
            
            
            
            
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


