//
//  Ext + invertImageColor.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 29.04.2023.
//

import UIKit

extension UIViewController {
    func invertImageColor(_ image: String) -> UIImage? {
        guard let inputImage = UIImage(named: image)?.cgImage else {
            return nil
        }
        let context = CIContext()
        let grayFilter = CIFilter(name: "CIPhotoEffectMono")!
        
        grayFilter.setValue(CIImage(cgImage: inputImage), forKey: kCIInputImageKey)
        let grayOutput = grayFilter.outputImage!
        
        let invertFilter = CIFilter(name: "CIColorInvert")!
        invertFilter.setValue(grayOutput, forKey: kCIInputImageKey)
        let invertOutput = invertFilter.outputImage!
        
        let borderFilter = CIFilter(name: "CIPhotoEffectTonal")!
        borderFilter.setValue(invertOutput, forKey: kCIInputImageKey)
        let borderOutput = borderFilter.outputImage!
        
        let cgImage = context.createCGImage(borderOutput, from: borderOutput.extent)!
        
        return UIImage(cgImage: cgImage)
    }
    
}

