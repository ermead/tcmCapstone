//
//  FormulaSets.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 12/6/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

class FormulaSets {
    /*
    Category 1:  Exterior-relieving formulae
    Category 2:  Purgative formulae
    Category 3:  Digestive formulae
    Category 4:  Harmonizing formulae
    Category 5:  Heat-clearing formulae
    Category 6:  Interior-warming formulae
    Category 7:  Tonic formulae
    Category 8:  Astringent formulae
    Category 9:  Calming formulae
    Category 10:  Orifice-opening formulae
    Category 11:  Qi-regulating formulae
    Category 12:  Blood-regulating formulae
    Category 13:  Dampness-dispelling formulae
    Category 14:  Phlegm-resolving formulae
    Category 15:  Wind-eliminating formulae
    Category 16:  Dryness-moistening formulae
    */
    static let sharedController = FormulaSets()
    
    let moc = Stack.sharedStack.managedObjectContext
    
    var FormulaSet = FormulaSetType.ReleaseTheExterior
    var formulaset: [Formula] = []
    
    var thisFormulaSetType: FormulaSetType?
    
    enum FormulaSetType {
        case AllFormulas
        case ReleaseTheExterior
        case Purgatives
        case Digestives
        case Harmonizing
        case HeatClearing
        case InteriorWarming
        case Tonic
        case Astringents
        case Calming
        case OrificeOpening
        case QiRegulating
        case BloodRegulating
        case DampnessDispelling
        case PhlegmResolving
        case WindEliminating
        case DrynessMoistening
    }
    
    func getFormulaSet(thisSetType: FormulaSetType) -> [Formula]{
        
        self.FormulaSet = thisSetType
        
        print("this formula set I am trying to load is \(FormulaSet)")
        
        switch thisSetType {
        
        case .AllFormulas : return allFormulas()
        case .ReleaseTheExterior : return ReleaseTheExterior()
        case .Purgatives : return Purgatives()
        case .Digestives : return Digestives()
        case .Harmonizing : return Harmonizing()
        case .HeatClearing : return HeatClearing()
        case .InteriorWarming : return InteriorWarming()
        case .Tonic : return Tonic()
        case .Astringents : return Astringents()
        case .Calming : return Calming()
        case .OrificeOpening : return OrificeOpening()
        case .QiRegulating : return QiRegulating()
        case .BloodRegulating : return BloodRegulating()
        case .DampnessDispelling : return DampnessDispelling()
        case .PhlegmResolving : return PhlegmResolving()
        case .WindEliminating : return WindEliminating()
        case .DrynessMoistening : return DrynessMoistening()

        default: return []
            
        }
    }
    
    func ReleaseTheExterior()->[Formula]{
        
      let Guizhitang = Formula(pinyinName: " Gui Zhi Tang", englishName: " ", uses: ": Fever, headache, chills, sweating, runny  nose, nausea and a white moist tongue coating indicates that wind and cold evils have attacked a  weakened body. With appropriate modifications, this formula can be used in a  wide range of health conditions such as upper respiratory tract infections, influenza, low fever of unknown  origin, general aching in postpartum women, morning sickness, allergic  rhinitis, rheumatoid arthritis, puffiness or sweating caused by neurovascular  disorders, and many skin problems.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Guizhitang"), images: [], context: self.moc)
        
        return [Guizhitang]
    }
    
    func Purgatives()->[Formula]{
        
        
        return []
    }
    func Digestives ()->[Formula]{
        
        
        return []
    }
    func Harmonizing()->[Formula]{
        
        
        return []
    }
    func HeatClearing()->[Formula]{
        
        
        return []
    }
    func InteriorWarming()->[Formula]{
        
        
        return []
    }
    func Tonic()->[Formula]{
        
        
        return []
    }
    func Astringents()->[Formula]{
        
        
        return []
    }
    
    func Calming()->[Formula]{
        
        
        return []
    }
    func OrificeOpening()->[Formula]{
        
        
        return []
    }
    func QiRegulating()->[Formula]{
        
        
        return []
    }
    func BloodRegulating()->[Formula]{
        
        
        return []
    }
    
    func DampnessDispelling()->[Formula]{
        
        
        return []
    }
    
    func WindEliminating()->[Formula]{
        
        
        return []
    }
    
    func PhlegmResolving()->[Formula]{
        
        
        return []
    }
    
    func DrynessMoistening()->[Formula]{
        
        
        return []
    }
    
    func allFormulas() -> [Formula] {
        let Guizhitang = Formula(pinyinName: " Gui Zhi Tang", englishName: " ", uses: ": Fever, headache, chills, sweating, runny  nose, nausea and a white moist tongue coating indicates that wind and cold evils have attacked a  weakened body. With appropriate modifications, this formula can be used in a  wide range of health conditions such as upper respiratory tract infections, influenza, low fever of unknown  origin, general aching in postpartum women, morning sickness, allergic  rhinitis, rheumatoid arthritis, puffiness or sweating caused by neurovascular  disorders, and many skin problems.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Guizhitang"), images: [], context: self.moc)
        
        
        let Mahuangtang = Formula(pinyinName: " Ma Huang Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Mahuangtang"), images: [], context: self.moc)
        
        
        let Renshenbaidusan = Formula(pinyinName: " Ren Shen Bai Du San", englishName: " ", uses: ": high fever, severe chills, headache, neck stiffness,  limb soreness, chest fullness, nasal congestion, a productive cough, and the  tongue coated with white greasy fur. With appropriate modifications, this  formula can be used to treat upper respiratory tract infections, influenza, bronchitis, contact  dermatitis, wheals, skin itchiness, early-stage measles, early-stage dysentery; its  also promotes surgical recovery. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Renshenbaidusan"), images: [], context: self.moc)
        
        
        let Niubangjiejitang = Formula(pinyinName: " Niu Bang Jie Ji Tang", englishName: " ", uses: ": For early- stage infections in the head and neck regions or gum infections that appear as lumps with obvious redness, swelling, heat and pain. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Niubangjiejitang"), images: [], context: self.moc)
        
        
        let Maguigebantang = Formula(pinyinName: " Ma Gui Ge Ban Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Maguigebantang"), images: [], context: self.moc)
        
        
        let Yinqiaosan = Formula(pinyinName: " Yin Qiao San", englishName: " ", uses: ": fever, slight or no chills, headache, thirst,  cough, throat soreness and a red-tipped tongue, which are the typical early  signs in some acute febrile diseases. With appropriate modifications, this  formula is commonly used in the early stages of acute infectious diseases such  as upper respiratory tract infections, flu, acute bronchitis, pneumonia,  measles and mumps. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Yinqiaosan"), images: [], context: self.moc)
        
        
        let Qianghuoshengshitang = Formula(pinyinName: " Qiang Huo Sheng Shi Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qianghuoshengshitang"), images: [], context: self.moc)
        
        
        let Xiangrusan = Formula(pinyinName: " Xiang Ru San", englishName: " ", uses: ": aversion to cold, mild fever, headache, heavy  sensation in the head, tired body, chest oppression, nausea, or abdominal pain with  vomiting and diarrhea. The tongue is coated with white and greasy fur. These symptoms  usually appear in the summer due to wind and cold evils attacking the exterior while dampness  accumulates internally.  The formula is usually used in conditions like the common cold during summer season, acute  gastroenteritis, bacillary dysentery and cholera. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xiangrusan"), images: [], context: self.moc)
        
        
        let Sangjuyin = Formula(pinyinName: " Sang Ju Yin", englishName: " ", uses: ": cough accompanied with a slight fever and thirst that is often seen at the beginning of acute  febrile diseases. With appropriate modifications, this formula can be used for  upper respiratory tract infections, influenza, early-stage acute bronchitis, acute tonsillitis and acute  conjunctivitis.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Sangjuyin"), images: [], context: self.moc)
        
        let Xiongzhishigaotang = Formula(pinyinName: " Xiong Zhi Shi Gao Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xiongzhishigaotang"), images: [], context: self.moc)
        
        
        let Zhisousan = Formula(pinyinName: " Zhi Sou San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Zhisousan"), images: [], context: self.moc)
        
        
        let Chuanxiongchatiaosan = Formula(pinyinName: " Chuan Xiong Cha Tiao San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Chuanxiongchatiaosan"), images: [], context: self.moc)
        
        
        let Sanaotang = Formula(pinyinName: " San Ao Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Sanaotang"), images: [], context: self.moc)
        
        
        let Neishuhuangliantang = Formula(pinyinName: " Nei Shu Huang Lian Tang", englishName: " ", uses: " ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Neishuhuangliantang"), images: [], context: self.moc)
        
        
        let Mazirenwan = Formula(pinyinName: " Ma Zi Ren Wan", englishName: " ", uses: ": constipation, dried stools and frequent urination. Modern TCM usually  uses this for  constipation in elderly or feeble persons with intestinal dryness as well as chronic constipation. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Mazirenwan"), images: [], context: self.moc)
        
        
        let Dachengqitang = Formula(pinyinName: " Da Cheng Qi Tang", englishName: " ", uses: ": Severe constipation, flatulence, abdominal distention, focal pressure can further  aggravate abdominal discomfort, dry yellow tongue with prickles. In severe  cases, there may be remittent fever, mental confusion, profuse sweating in the limbs.  With appropriate modifications, this formula can be used in simple or early  stage abdominal conditions like appendicitis, pancreatitis, gallbladder stones,  intestinal obstruction, post surgical constipation and distention. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Dachengqitang"), images: [], context: self.moc)
        
        
        let Gehuajiechengtang = Formula(pinyinName: " Ge Hua Jie Cheng Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Gehuajiechengtang"), images: [], context: self.moc)
        
        
        let Baohewan = Formula(pinyinName: " Bao He Wan", englishName: " ", uses: ": Food distention that is manifested by chest stuffiness,  fullness and distending pain in the gastric and abdominal regions, belching which has  a foul smell, acid  regurgitation, anorexia, nausea/vomiting or diarrhea. The tongue coating is thick and greasy. This  formula relieves food  stagnation and preserves the proper functioning of the digestive system. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Baohewan"), images: [], context: self.moc)
        
        
        let Jianpiwan = Formula(pinyinName: " Jian Pi Wan", englishName: " ", uses: ": Reduced appetite, indigestion, bloating, distention in the gastric and abdominal regions, loose and watery diarrhea, and the tongue coating is greasy and slightly yellow. With appropriate modifications, modern TCM uses the formula in conditions like chronic gastritis, peptic ulcer, chronic dysentery, ulcerative colitis, Crohnâs disease, or other dysfunction of the gastrointestinal tract. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Jianpiwan"), images: [], context: self.moc)
        
        
        let Tongxieyaofang = Formula(pinyinName: " Tong Xie Yao Fang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Tongxieyaofang"), images: [], context: self.moc)
        
        
        let Jiaweixiaoyaosan = Formula(pinyinName: " Jia Wei Xiao Yao San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Jiaweixiaoyaosan"), images: [], context: self.moc)
        
        
        let Dangguliuhuangtang = Formula(pinyinName: " Dang Gu Liu Huang Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Dangguliuhuangtang"), images: [], context: self.moc)
        
        
        let Qingyingtang = Formula(pinyinName: " Qing Ying Tang", englishName: " ", uses: ": fever which is  worse at night, severe irritability and restlessness, insomnia, occasional  mental confusion, dark-red tongue covered by dry yellowish fur. Some  individuals may appear faint and indistinct subcutaneous bleeding  spots. Modern TCM uses this formula in conditions such as  meningitis, septicemia, acute leukemia, hepatic coma, uremia or stroke.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qingyingtang"), images: [], context: self.moc)
        
        
        let Wuweixiaoduyin = Formula(pinyinName: " Wu Wei Xiao Du Yin", englishName: " ", uses: " ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Wuweixiaoduyin"), images: [], context: self.moc)
        
        
        let Zhizichitang = Formula(pinyinName: " Zhi Zi Chi Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Zhizichitang"), images: [], context: self.moc)
        
        
        let Longdanxiegantang = Formula(pinyinName: " Long Dan Xie Gan Tang", englishName: " ", uses: ": lower chest pain, headache, blood-shot eyes,  bitter taste in the mouth, decline in hearing or ringing ears, irritability, red tongue covered by yellowish  fur. Also indicated for urinary difficulty with burning and pain sensations,  swollen, damp and itchiness genitalia, or foul smelling vaginal discharge.  Modern TCM uses this formula in conditions such as stubborn migraines, eczema, intercostal neuralgia,  conjunctivitis, otitis, hypertension, herpes zoster, liver and gallbladder  diseases, and acute genital and urinary infections.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Longdanxiegantang"), images: [], context: self.moc)
        
        
        let Daochisan = Formula(pinyinName: " Dao  Chi San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Daochisan"), images: [], context: self.moc)
        
        
        let Daihasan = Formula(pinyinName: " Dai Ha San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Daihasan"), images: [], context: self.moc)
        
        
        let Shaoyaotang = Formula(pinyinName: " Shao Yao Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shaoyaotang"), images: [], context: self.moc)
        
        
        let Baitouwengtong = Formula(pinyinName: " Bai Tou Weng Tong", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Baitouwengtong"), images: [], context: self.moc)
        
        
        let Xiebaisan = Formula(pinyinName: " Xie Bai San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xiebaisan"), images: [], context: self.moc)
        
        
        let Shangdimaidongyin = Formula(pinyinName: " Shang Di Mai Dong Yin", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shangdimaidongyin"), images: [], context: self.moc)
        
        
        let Wangshiqingshuyiqitang = Formula(pinyinName: " Wang Shi Qing Shu Yi Qi Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Wangshiqingshuyiqitang"), images: [], context: self.moc)
        
        
        let Baihutang = Formula(pinyinName: " Bai Hu Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Baihutang"), images: [], context: self.moc)
        
        
        let Yunujian = Formula(pinyinName: " Yu Nu Jian", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Yunujian"), images: [], context: self.moc)
        
        
        let Qingganyinjingtang = Formula(pinyinName: " Qing Gan Yin Jing Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qingganyinjingtang"), images: [], context: self.moc)
        
        
        let Qingweisan = Formula(pinyinName: " Qing Wei San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qingweisan"), images: [], context: self.moc)
        
        
        let Ganluyin = Formula(pinyinName: " Gan Lu Yin", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Ganluyin"), images: [], context: self.moc)
        
        
        let Xiexintang = Formula(pinyinName: " Xie Xin Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xiexintang"), images: [], context: self.moc)
        
        
        let Xijiaodihuangtang = Formula(pinyinName: " Xi Jiao Di Huang Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xijiaodihuangtang"), images: [], context: self.moc)
        
        
        let Qingregujingtang = Formula(pinyinName: " Qing Re Gu Jing Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qingregujingtang"), images: [], context: self.moc)
        
        
        let Shiquandabutang = Formula(pinyinName: " Shi Quan Da Bu Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shiquandabutang"), images: [], context: self.moc)
        
        
        let Xiangshaliujunziwan = Formula(pinyinName: " Xiang Sha Liu Jun Zi Wan ", englishName: " ", uses: ": Poor appetite, belching, distention or pain in the gastric and abdominal regions, and sometimes vomiting and diarrhea. With appropriate modifications, modern TCM uses the formula in conditions like gastritis, peptic ulcers, digestive tract dysfunction as well as to stimulate appetite.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xiangshaliujunziwan"), images: [], context: self.moc)
        
        
        let Bazhentang = Formula(pinyinName: " Ba Zhen Tang", englishName: " ", uses: ": Pallid or sallow complexion, dizziness, blurred vision, easily-fatigued limbs, shortness of breath, laconic speech, palpitations with anxiety, reduced appetite, a pale tongue and the pulse is weak and fine. With appropriate modifications, modern TCM uses the formula in conditions like general weakness after various diseases, anemia, lumbar pain in women, menstrual disorders, chronic gastritis, chronic hepatitis and alopecia areata.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Bazhentang"), images: [], context: self.moc)
        
        
        let Sijunzitang = Formula(pinyinName: " Si Jun Zi Tang", englishName: " ", uses: ": Paleness, feeble voice, limb weakness, reduced appetite, loose stools, a pale tongue and the pulse is weak. With appropriate modifications, modern TCM uses the formula in conditions like nervous debility, chronic gastritis, peptic ulcers, irritable bowel syndrome as well as promoting recovery after major disease. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Sijunzitang"), images: [], context: self.moc)
        
        
        let Siwutang = Formula(pinyinName: " Si Wu Tang", englishName: " ", uses: ": Panic, dizziness, blurred vision, ear ringing, paleness of the lips and nails, scanty menses or missed periods in women accompanied with lower abdominal pain, a pale tongue, and the pulse is taut and fine. With appropriate modifications, modern TCM uses the formula in conditions like primary dysmenorrheal, irregular menstruation, anemia, weakness after delivery, urticaria and headaches.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Siwutang"), images: [], context: self.moc)
        
        
        let Dabuyuanjian = Formula(pinyinName: " Da Bu Yuan Jian", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Dabuyuanjian"), images: [], context: self.moc)
        
        
        let Dabuyinwan = Formula(pinyinName: " Da Bu Yin Wan", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Dabuyinwan"), images: [], context: self.moc)
        
        
        let Huoxuehuajiantang = Formula(pinyinName: " Huo Xue Hua Jian Tang", englishName: " ", uses: " ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Huoxuehuajiantang"), images: [], context: self.moc)
        
        
        let Shaofuzhuyutang = Formula(pinyinName: " Shao Fu Zhu Yu Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shaofuzhuyutang"), images: [], context: self.moc)
        
        
        let Shenghuatang = Formula(pinyinName: " Sheng Hua Tang", englishName: " ", uses: ": After delivery, there is non-smooth flow of  the lochia and also cold pain in the lower abdominal region. The formula is usually used for  retention of placental fragments within the uterus, excessive vaginal discharge  or painful uterine contractions in post partum, and chronic endometriosis.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shenghuatang"), images: [], context: self.moc)
        
        
        let Taohongsiwutang = Formula(pinyinName: " Tao Hong Si Wu Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Taohongsiwutang"), images: [], context: self.moc)
        
        
        let Tongqiaohuoxuetang = Formula(pinyinName: " Tong Qiao Huo Xue Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Tongqiaohuoxuetang"), images: [], context: self.moc)
        
        
        let Huoxiangzhengqisan = Formula(pinyinName: " Huo Xiang Zheng Qi San", englishName: " ", uses: ": Fever, chills, headache, nausea, vomiting,  feelings of fullness  and oppression in the cheat, pain and rambling sounds in the gastric and  abdominal regions, diarrhea, a bland taste in the mouth, and a white greasy  tongue coating. The formula is usually used for intestinal flu, acute  gastroenteritis and indigestion.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Huoxiangzhengqisan"), images: [], context: self.moc)
        
        
        let Pingweisan = Formula(pinyinName: " Ping Wei San", englishName: " ", uses: ": distention and fullness in the gastric and  abdominal regions, lack of appetite, nausea, belching, acid regurgitation,  limbs heaviness, loose bowel or diarrhea, fatigue, sleepiness, and a white  greasy tongue coating. Modern TCM uses this formula for intestinal flu, nonspecific intestinal disorder,  indigestion and chronic gastritis.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Pingweisan"), images: [], context: self.moc)
        
        
        let Tianmagoutengyin = Formula(pinyinName: " Tian Ma Gou Teng Yin", englishName: " ", uses: ": headache, dizziness, vertigo, ear ringing,  blurred vision, insomnia, dream-disturbed sleep, a red tongue covered by  yellowish fur. In severe cases, there may also be numbness, twitching and  spasms in the limbs, and even paralysis. The formula is usually used for stroke and  hypertension that appear with previously mentioned symptoms.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Tianmagoutengyin"), images: [], context: self.moc)
        
        
        let Duhuojishengtang = Formula(pinyinName: " Du Huo Ji Sheng Tang", englishName: " ", uses: ": Pain in the back and lower limbs, difficulty in  joint movements, numbness or coldness of the limbs, palpitation and breath  shortness. This formula is usually used for rheumatoid arthritis,  osteoarthritis, chronic lumbar strain and sciatica.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Duhuojishengtang"), images: [], context: self.moc)
        
        
        let Siwuxiaofengyin = Formula(pinyinName: " Si Wu Xiao Feng Yin", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Siwuxiaofengyin"), images: [], context: self.moc)
        
        
        let Zhenganxifengtang = Formula(pinyinName: " Zhen Gan Xi Feng Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Zhenganxifengtang"), images: [], context: self.moc)
        
        
        let Qianzhengsan = Formula(pinyinName: " Qian Zheng San", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Qianzhengsan"), images: [], context: self.moc)
        
        
        let Xingsusan = Formula(pinyinName: " Xing Su San", englishName: " ", uses: ": slight headache, chills without sweating,  cough with watery sputum, stuffy nose and dry throat. The formula is usually used for upper respiratory  tract infections, chronic bronchitis and emphysema. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Xingsusan"), images: [], context: self.moc)
        
        
        let Shashenmaidongtang = Formula(pinyinName: " Sha Shen Mai Dong Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Shashenmaidongtang"), images: [], context: self.moc)
        
        
        let Zengyetang = Formula(pinyinName: " Zeng  Ye Tang", englishName: " ", uses: "", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Zengyetang"), images: [], context: self.moc)
        
        
        let Yuyetang = Formula(pinyinName: " Yu Ye Tang", englishName: " ", uses: ": diabetic symptoms like excessive thirst, profuse  turbid urination, lassitude and shortness of breath.", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Yuyetang"), images: [], context: self.moc)
        
        
        let Baihegujintang = Formula(pinyinName: " Bai He Gu Jin Tang", englishName: " ", uses: ": Cough with blood stained sputum, wheezing,  throat dryness, hot palms and soles, night sweats, and a red tongue.  Clinically, the formula is usually for chronic bronchitis, pulmonary  tuberculosis, pharyngitis, and bronchiectasis. ", category: " ", hasContents: FormulaIngredientDictionaries.sharedInstance.getHerbsInSet("Baihegujintang"), images: [], context: self.moc)
        
        
        return [ Guizhitang, Mahuangtang, Renshenbaidusan, Niubangjiejitang, Maguigebantang, Yinqiaosan, Qianghuoshengshitang, Xiangrusan, Sangjuyin, Zengyetang, Xiongzhishigaotang, Zhisousan, Chuanxiongchatiaosan, Sanaotang, Neishuhuangliantang, Mazirenwan, Dachengqitang, Gehuajiechengtang, Baohewan, Jianpiwan, Tongxieyaofang, Jiaweixiaoyaosan, Dangguliuhuangtang, Qingyingtang, Wuweixiaoduyin, Zhizichitang, Longdanxiegantang, Daochisan, Daihasan, Shaoyaotang, Baitouwengtong, Xiebaisan, Shangdimaidongyin, Wangshiqingshuyiqitang, Baihutang, Yunujian, Qingganyinjingtang, Qingweisan, Ganluyin, Xiexintang, Xijiaodihuangtang, Qingregujingtang, Shiquandabutang, Xiangshaliujunziwan, Bazhentang, Sijunzitang, Siwutang, Dabuyuanjian, Dabuyinwan, Huoxuehuajiantang, Shaofuzhuyutang, Shenghuatang, Taohongsiwutang, Tongqiaohuoxuetang, Huoxiangzhengqisan, Pingweisan, Tianmagoutengyin, Duhuojishengtang, Siwuxiaofengyin, Zhenganxifengtang, Qianzhengsan, Xingsusan, Shashenmaidongtang, Zengyetang, Yuyetang, Baihegujintang]
    }

}