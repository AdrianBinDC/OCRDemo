//
//  UIImage+Extension.swift
//  OCRDemo
//
//  Created by Adrian Bolinger on 12/13/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit

extension UIImage {
    func grayscale() -> UIImage {
        let filter = CIFilter(name: "CIPhotoEffectMono")
        
        // convert UIImage to CIImage and set as input
        
        let ciInput = CIImage(image: self)
        filter?.setValue(ciInput, forKey: "inputImage")
        
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        
        return UIImage(cgImage: cgImage!)
    }
    
}
