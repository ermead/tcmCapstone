//
//  PointsDetailListViewController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 10/25/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PointsDetailListViewController: UIViewController {
    var herbsList: Bool = true
    var index:Int?
    var firstPicVisible: Bool = true
    
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var generalDescription: UITextView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var indicationsAndUses: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" I loaded the index \(index)")
        
        leftImage.alpha = 1
        rightImage.alpha = 0
        
        if let index = index {
            
            populatePointInfo()
            
        } else {
            
            addNewPointEntry()
        }
        
    }
    
    @IBAction func TogglePictureButtonTapped(sender: UIButton) {
        
        if firstPicVisible{
            leftImage.alpha = 0
            rightImage.alpha = 1
            firstPicVisible = false
            
        } else {
            leftImage.alpha = 1
            rightImage.alpha = 0
            firstPicVisible = true
        }
        
    }
    
    
    func populatePointInfo() {
        if herbsList{
            
            var detailHerb = HerbsController.herbs[index!]
            
            detailHerb = Herb(pinyinName: detailHerb.pinyinName, botanicalName: detailHerb.botanicalName, englishName: detailHerb.englishName, category: detailHerb.category, temp: detailHerb.temp, meridians: detailHerb.meridians)
            
            generalDescription.text = "This herb, named \(detailHerb.pinyinName), belongs to the category of \(detailHerb.category). Having a \(detailHerb.temp) temperature, it travels along the \(detailHerb.meridians) channels."
            
            topRightLabel.text = detailHerb.pinyinName
            location.text = detailHerb.botanicalName
//            englishName.text = detailHerb.englishName
//            category.text = detailHerb.category
//            temp.text = detailHerb.temp
//            meridians.text = detailHerb.meridians
//            
            
        } else {
        
        var point = PointController.points[index!]
        
        point = Point(pinyinName: point.pinyinName, englishName: point.englishName, pointOnMeridian: point.pointOnMeridian, specialCategories: point.specialCategories!, channel: point.channel, locationDescription: point.locationDescription, uses: point.uses)
        
        topRightLabel.text = point.channel
        generalDescription.text = ("The point \(point.pinyinName) is located on the \(point.channel) meridian.")
        location.text = point.locationDescription
        indicationsAndUses.text = point.uses
        }
        
    }
    
    func addNewPointEntry() {
        print("adding new point")
        leftImage.image = nil
        rightImage.image = nil
        topRightLabel.text = ""
        generalDescription.text = ""
        location.text = ""
        indicationsAndUses.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
