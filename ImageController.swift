//
//  ImageController.swift
//  TraditionalMedicineCapstoneProject
//
//  Created by Eric Mead on 11/13/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func getImageIdFromPhoto(image: UIImage, completion: (imageId: String?) -> Void) {
        
        if let base64Image = image.base64String {
            completion(imageId: base64Image)
        } else {
            completion(imageId: "12345")
        }
    }
    
    static func imageForImageId(imageId: String, completion: (image: UIImage?) -> Void) {
       
        if let imageId = imageId as String? {
                let image = UIImage(base64: imageId)
                completion(image: image)
            
        }
        
        
        
        
        
//        FirebaseController.dataAtEndpoint("images/\(identifier)") { (data) -> Void in
//            
//            if let data = data as? String {
//                let image = UIImage(base64: data)
//                completion(image: image)
//            }
        
    }
    
    static func getDataFromImage(image: UIImage) -> NSData? {
        
        if let data = UIImageJPEGRepresentation(image, 1.0) {
        
        //let imageData = UIImagePNGRepresentation(image, 1.0)
        
        return data
            
        } else {
            return nil
            print("error converting image to data")
        }
        
    }
    
    static func getImageFromData(imageData: NSData) -> UIImage? {
        
        if let image = UIImage(data: imageData){
            
            return image
        } else {
            return nil
            print("there was an error getting the image from data")
        }
        
        
    }
}

extension UIImage {
    
    var base64String: String? {
        
        guard let data = UIImageJPEGRepresentation(self, 0.8) else {
            
            return nil
        }
        
        return data.base64EncodedStringWithOptions(.EncodingEndLineWithCarriageReturn)
    }
    
    convenience init?(base64: String) {
        
        if let imageData = NSData(base64EncodedString: base64, options: .IgnoreUnknownCharacters) {
            self.init(data: imageData)
        } else {
            return nil
        }
    }
}