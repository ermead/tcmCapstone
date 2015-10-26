//
//  HerbsListDetailViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit



class HerbsListDetailViewController: UIViewController {

 var index = 0
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var pinyinName: UILabel!
    @IBOutlet weak var botanicalName: UILabel!
    @IBOutlet weak var englishName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var meridians: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("I have the index and it is \(index), the herb I will display is \(HerbsController.herbs[index].englishName)")
        populateHerbInfo()
    
    }

    func populateHerbInfo(){
        
        var detailHerb = HerbsController.herbs[index]
        
        detailHerb = Herb(pinyinName: detailHerb.pinyinName, botanicalName: detailHerb.botanicalName, englishName: detailHerb.englishName, category: detailHerb.category, temp: detailHerb.temp, meridians: detailHerb.meridians)
        
        textViewOutlet.text = "This herb, named \(detailHerb.pinyinName), belongs to the category of \(detailHerb.category). Having a \(detailHerb.temp) temperature, it travels along the \(detailHerb.meridians) channels."
        
        pinyinName.text = detailHerb.pinyinName
        botanicalName.text = detailHerb.botanicalName
        englishName.text = detailHerb.englishName
        category.text = detailHerb.category
        temp.text = detailHerb.temp
        meridians.text = detailHerb.meridians
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
