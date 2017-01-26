//
//  UIImage+Extension.swift
//  iMind-Lib
//
//  Created by David Frenkel on 26/01/2017.
//  Copyright © 2017 iMind. All rights reserved.
//

import UIKit

extension UIImage {
    
    ///Returns new square image from current image resized to the input size.
    func squareImageToSize(newSize: CGSize) -> UIImage? {
        var ratio: Double
        var delta: Double
        var offset: CGPoint
        
        //make a new square size, that is the resized imaged width
        let sz: CGSize = CGSize(width: newSize.width, height: newSize.height)
        
        //figure out if the picture is landscape or portrait, then
        //calculate scale factor and offset
        if self.size.width > self.size.height {
            ratio = Double(newSize.width) / Double(self.size.width)
            delta = (ratio * Double(self.size.width) - ratio * Double(self.size.height))
            offset = CGPoint(x: delta/2, y: 0)
        } else {
            ratio = Double(newSize.width) / Double(self.size.height)
            delta = (ratio * Double(self.size.height) - ratio * Double(self.size.width))
            offset = CGPoint(x: 0, y: delta/2)
        }
        
        //make the final clipping rect based on the calculated values
        
        let clipRect: CGRect = CGRect(x: Double(-offset.x), y: Double(-offset.y), width: (ratio * Double(self.size.width)) + delta, height: (ratio * Double(self.size.height)) + delta)
        
        //start a new context, with scale factor 0.0 so retina displays get
        
        //high quality image
        
        if UIScreen.main.responds(to: #selector(getter: scale)) {
            UIGraphicsBeginImageContextWithOptions(sz, false, 0.0)
        } else {
            UIGraphicsBeginImageContext(sz)
        }
        
        
        UIRectClip(clipRect)
        self.draw(in: clipRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

extension UIImageView {
    
    ///Animates view's alpha property from 1 to 0 and reverse, in 0.4s, indefinitely. 
    func flashView() {
        self.alpha = 1
        UIView.animate(withDuration: 0.4, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.alpha = 0
        }) { _ in
            self.alpha = 1
        }
    }
    
}
