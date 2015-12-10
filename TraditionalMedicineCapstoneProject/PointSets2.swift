//
//  PointSets2.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 12/9/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

class PointSets {
    
    static let sharedController = PointSets()
    
    let moc = Stack.sharedStack.managedObjectContext
    
    var PointSet = PointSetType.AllPoints
    var pointset: [Point] = []
    
    var thisPointSetType: PointSetType?
    
    enum PointSetType {
        case AllPoints
        case Lung
        case LargeIntestine
        case Stomach
        case Spleen
        case Heart
        case SmallIntestine
        case Bladder
        case Kidney
        case Pericardium
        case SanJiao
        case GallBladder
        case Liver
        
        case Ren
        case Du
        case Chong
        case Dai
        case YangWei
        case YinWei
        case YangQiao
        case YinQiao
        
        case Extra
    }
    
    func getPointSet(thisSetType: PointSetType) -> [Point]{
        
        self.PointSet = thisSetType
        print("this herb set I am trying to load is \(PointSet)")
        switch thisSetType {
            
        case .Lung                  : return Lung()
        case .LargeIntestine        : return LargeIntestine()
        case .Stomach               : return Stomach()
        case .Spleen                : return Spleen()
        case .Heart                 : return Heart()
        case .SmallIntestine        : return SmallIntestine()
        case .Bladder               : return Bladder()
        case .Kidney                : return Kidney()
        case .Pericardium           : return Pericardium()
        case .SanJiao               : return SanJiao()
        case .GallBladder           : return GallBladder()
        case .Liver                 : return Liver()
            
        case .Ren                   : return Ren()
        case .Du                    : return Du()
            
            //     case .Extra
            
            
        default                     : return []
            
        }
}


