//
//  Color+Extensions.swift
//  iMindLib
//
//  Created by Peter Kovacs on 2017. 01. 13..
//  Copyright © 2017. iMind. All rights reserved.
//

#if !os(macOS) && !os(Linux)
    
import UIKit

public extension UIColor {
    
    // MARK: Creating and Initializing Color Objects
    
    /**
        Initializes and returns a color object using RGB component values as Int and an optional opacity value.
        - parameter red: The red value of the color object. Red values below 0 are interpreted as 0, and values above 255 are interpreted as 255.
        - parameter green: The green value of the color object. Green values below 0 are interpreted as 0, and values above 255 are interpreted as 255.
        - parameter blue: The blue value of the color object. Blue values below 0 are interpreted as 0, and values above 255 are interpreted as 255.
        - parameter transparency: Optional opacity value of the color object, specified as a value from 0.0 to 1.0. Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0. It defaults to 1.0.
        - returns: The color object.
        - seealso: `init(red:green:blue:alpha)`
    */
    public convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1.0) {
        self.init(red: UIColor.normalize(red), green: UIColor.normalize(green), blue: UIColor.normalize(blue), alpha: UIColor.normalize(transparency))
    }
    
    /**
        Initializes and returns a color object using RGB component values as a hexadecimal Int and an optional opacity value.
        - parameter hex: Hexadecimal value for RGB (example: *0xFF0000*).
        - parameter alpha: Optional opacity value of the color object, specified as a value from 0.0 to 1.0. Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0. It defaults to 1.0.
        - returns: The color object.
        - seealso: `init?(hexString:alpha:)`
    */
    public convenience init(hex:Int, alpha: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, transparency: alpha)
    }
    
    /**
        Initializes and returns an optional color object using RGB component values as a hexadecimal String and an optional opacity value.

        It uses `Scanner`'s `scanHexInt32`. If the scanning fails it returns a `nil`.
        - parameter hexString: Hexadecimal value for RGB (example: *"FF0000"* or *"#FF0000"*)
        - parameter alpha: Optional opacity value of the color object, specified as a value from 0.0 to 1.0. Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0. It defaults to 1.0.
        - returns: The optional color object.
        - seealso: `init(hex:alpha:)`
    */
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        let hex: String = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt32 = UInt32()
        guard Scanner(string: hex).scanHexInt32(&int) else {
            return nil
        }
        self.init(hex: Int(int), alpha: alpha)

    }
    
    // MARK: RGBA Components
    
    /**
        The red component of color's RGBA representation.
        - seealso: `greenComponent`
        - seealso: `blueComponent`
        - seealso: `alphaComponent`
    */
    public var redComponent: Int {
        return Int(component(0) * 255.0)
    }
    
    /**
        The green component of color's RGBA representation.
        - seealso: `redComponent`
        - seealso: `blueComponent`
        - seealso: `alphaComponent`
    */
    public var greenComponent: Int {
        return Int(component(1) * 255.0)
    }
    
    /**
        The blue component of color's RGBA representation.
        - seealso: `redComponent`
        - seealso: `greenComponent`
        - seealso: `alphaComponent`
    */
    public var blueComponent: Int {
        return Int(component(2) * 255.0)
    }
    
    /**
        The alpha channel of color's RGBA representation.
        - seealso: `redComponent`
        - seealso: `greenComponent`
        - seealso: `blueComponent`
    */
    public var alphaComponent: CGFloat {
        return CGFloat(component(3))
    }
    
    // MARK: Handling Lighter and Darker Colors
    
    /**
        Creates a darker color from the receiver by altering it's brightness by a percent (using the HSBA color space).
        - parameter percent: The percentage for decreasing brightness. Values below 0 are interpreted as 0, and values above 100 are interpreted as 100.
        - returns: The darker color object.
        - seealso: `lighten(_:)`
        - seealso: `lighter(than:)`
        - seealso: `darker(than:)`
    */
    public func darken(_ percent: Int) -> UIColor {
        let amount: CGFloat = min(1.0, max(0.0, CGFloat(percent) / 100.0))
        return brightness(amount)
    }
    
    /**
        Creates a lighter color from the receiver by altering it's brightness by a percent (using the HSBA color space).
        - parameter percent: The percentage for increasing brightness. Values below 0 are interpreted as 0, and values above 100 are interpreted as 100.
        - returns: The lighter color object.
        - seealso: `darken(_:)`
        - seealso: `lighter(than:)`
        - seealso: `darker(than:)`
    */
    public func lighten(_ percent: Int) -> UIColor {
        let amount: CGFloat = 1.0 + min(1.0, max(0.0, CGFloat(percent) / 100.0))
        return brightness(amount)
    }
    
    /**
        Returns a Boolean value that indicates whether a given color is lighter than the receiver (compering their brightness values - from HSBA color space)
        - parameter other: the other color to compare to
        - returns: `true` if other is lighter, otherwise `false`
        - seealso: `darker(than:)`
        - seealso: `darken(_:)`
        - seealso: `lighten(_:)`
    */
    public func lighter(than other: UIColor) -> Bool {
        return hsba.brightness > other.hsba.brightness
    }
    
    /**
        Returns a Boolean value that indicates whether a given color is darker than the receiver (compering their brightness values - from HSBA color space)
        - parameter other: the other color to compare to
        - returns: `true` if other is darker, otherwise `false`
        - seealso: `lighter(than:)`
        - seealso: `darken(_:)`
        - seealso: `lighten(_:)`
    */
    public func darker(than other: UIColor) -> Bool {
        return hsba.brightness < other.hsba.brightness
    }

}

// MARK: Private Properties and Methods
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
