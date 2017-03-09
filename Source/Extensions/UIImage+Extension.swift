//
//  UIImage+Extension.swift
//  iMindLib
//
//  Created by David Frenkel on 26/01/2017.
//  Copyright © 2017 iMind. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Creates an image at a new size size from a square image.
    /// - parameter newSize: A CGSize object that represets the size the result image should be.
    /// - returns: An optional UIImage of the new size.
    func squareImageToSize(newSize: CGSize) -> UIImage? {
        var ratio: Double
        var delta: Double
        var offset: CGPoint
        
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
        
        let rectX = Double(-offset.x)
        let rectY = Double(-offset.y)
        let rectW = (ratio * Double(self.size.width)) + delta
        let rectH = (ratio * Double(self.size.height)) + delta
        let clipRect: CGRect = CGRect(x: rectX, y: rectY, width: rectW, height: rectH)
        
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
    
    /// Scales an image to a new size.
    /// - parameter newSize: a CGSize object that the result UImage size should be.
    /// - returns: An optioal UIImage of the new scale.
    func scaleToImage(with newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Sets an image's translucency.
    /// - parameter alpha: A CGFloat that will be the result image's translucency.
    /// - returns: An optional UIImage of the new translucency.
    func setTranlucent(with alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        draw(at: CGPoint.zero, blendMode: CGBlendMode.normal, alpha: alpha)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Corrects an image's orientation. Does nothing if .imageOrientation == UIImageOrientation.up
    /// - returns: An optional UIImage.
    func correctlyOrientedImage() -> UIImage? {
        if self.imageOrientation == UIImageOrientation.up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Resizes an image to a new height.
    /// - parameter newHeight: A CGFloat that the new image height should be.
    /// - returns: An optional UIImage of the new height.
    func resizeImage(to newHeight: CGFloat) -> UIImage? {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Center crops an image to the target size.
    /// - parameter target: A CGSize that the result crop should be
    /// - returns: An optional UIImage crop of the input image.
    func centerCropToSize(target: CGSize) -> UIImage? {
        let scale = max(target.width/self.size.width, target.height/self.size.height)
        let width = self.size.width * scale
        let height = self.size.height * scale
        
        UIGraphicsBeginImageContextWithOptions(target, false, 0)
        self.draw(in: CGRect(x: (target.width-width)/2, y: (target.height-height)/2, width: width, height: height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Tints an image with a specified colour.
    /// - parameter color: The specified color of the tint the result image should have.
    /// - returns: An optional UIImage tinted to the specified colour.
    func tintWithColor(color: UIColor) -> UIImage? {
        
        UIGraphicsBeginImageContext(self.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -self.size.height)
        
        context.setBlendMode(CGBlendMode.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        guard let inputCG = self.cgImage else {
            return nil
        }
        
        context.clip(to: rect, mask: inputCG)
        color.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

}
