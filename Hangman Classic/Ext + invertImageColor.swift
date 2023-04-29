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
        
        // Convert the input image to a grayscale version
        let grayFilter = CIFilter(name: "CIPhotoEffectMono")!
        grayFilter.setValue(CIImage(cgImage: inputImage), forKey: kCIInputImageKey)
        let grayOutput = grayFilter.outputImage!
        
        // Invert the colors in the grayscale image
        let invertFilter = CIFilter(name: "CIColorInvert")!
        invertFilter.setValue(grayOutput, forKey: kCIInputImageKey)
        let invertOutput = invertFilter.outputImage!
        
        // Add a gray border to the image
        let borderFilter = CIFilter(name: "CIPhotoEffectTonal")!
        borderFilter.setValue(invertOutput, forKey: kCIInputImageKey)
        let borderOutput = borderFilter.outputImage!
        
        // Render the output image into a CGImage
        let cgImage = context.createCGImage(borderOutput, from: borderOutput.extent)!
        
        // Create a UIImage from the CGImage
        return UIImage(cgImage: cgImage)
    }

}

