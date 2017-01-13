//
//  Color+Extensions.swift
//  iMind-Lib
//
//  Created by Peter Kovacs on 2017. 01. 13..
//  Copyright © 2017. iMind. All rights reserved.
//

#if !os(macOS)
    
import UIKit

public extension UIColor {
    
    public var redComponent: Int {
        return Int(component(0) * 255.0)
    }
    
    public var greenComponent: Int {
        return Int(component(1) * 255.0)
    }
    
    public var blueComponent: Int {
        return Int(component(2) * 255.0)
    }
    
    public var alphaComponent: CGFloat {
        return CGFloat(component(3))
    }
    
    public convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1.0) {
        
        self.init(red: UIColor.normalize(red), green: UIColor.normalize(green), blue: UIColor.normalize(blue), alpha: UIColor.normalize(transparency))
    }
    
    public convenience init(hex:Int, alpha: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, transparency: alpha)
    }
    
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        let hex: String = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt32 = UInt32()
        guard Scanner(string: hex).scanHexInt32(&int) else {
            return nil
        }
        self.init(hex: Int(int), alpha: alpha)

    }
    
    public func darken(_ percent: Int) -> UIColor {
        let amount: CGFloat = min(1.0, max(0.0, CGFloat(percent) / 100.0))
        return brightness(amount)
    }
    
    public func lighten(_ percent: Int) -> UIColor {
        let amount: CGFloat = 1.0 + min(1.0, max(0.0, CGFloat(percent) / 100.0))
        return brightness(amount)
    }
    
    public func lighter(than other: UIColor) -> Bool {
        return hsba.brightness > other.hsba.brightness
    }
    
    public func darker(than other: UIColor) -> Bool {
        return hsba.brightness < other.hsba.brightness
    }

}

fileprivate extension UIColor {
    typealias HSBA = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    var hsba: HSBA {
        var hsba: HSBA = (0, 0, 0, 0)
        self.getHue(&(hsba.hue), saturation: &(hsba.saturation), brightness: &(hsba.brightness), alpha: &(hsba.alpha))
        return hsba
    }

    func component(_ index: Int) -> CGFloat {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        switch index {
        case 1:
            return fGreen
        case 2:
            return fBlue
        case 3:
            return fAlpha
        default:
            return fRed
        }
    }

    func brightness(_ amount: CGFloat) -> UIColor {
        let hsba: HSBA = self.hsba
        
        return UIColor.init(hue: hsba.hue, saturation: hsba.saturation, brightness: hsba.brightness * amount, alpha: hsba.alpha)
    }
    
    static func normalize(_ component: CGFloat) -> CGFloat {
        return CGFloat(min(1.0, max(0.0, component)))
    }
    
    static func normalize(_ component: Int) -> CGFloat {
        return normalize(CGFloat(component) / 255.0)
    }

}

#endif
