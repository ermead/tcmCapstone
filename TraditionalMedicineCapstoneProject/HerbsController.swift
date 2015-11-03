//
//  HerbsController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class HerbsController: NSObject {

    static var herbs: [Herb] {
        
        let cinnamon = Herb(pinyinName: "Gui Zhi", botanicalName: "insert botanical name", englishName: "Cinnamon", category: "Release the Exterior", temp: "Warm", meridians: "insert meridians", uses: "cold & flu", majorFormulas: "Gui Zhi Tang")
        let ginseng = Herb(pinyinName: "Ren Shen", botanicalName: "insert botanical name", englishName: "Ginseng", category: "Tonify the Qi", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Qi", majorFormulas: "Si Jun Zi Tang")
        let dangGui = Herb(pinyinName: "Dang Gui", botanicalName: "insert botanical name", englishName: "Angelica", category: "Tonify the Blood", temp: "Warm", meridians: "insert meridians", uses: "Strengthen the Blood", majorFormulas: "Si Wu Tang")
        
        return [cinnamon, ginseng, dangGui]
        
        
    }

}
