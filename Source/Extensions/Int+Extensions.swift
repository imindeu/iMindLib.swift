//
//  Int+Extensions.swift
//  iMindLib
//
//  Created by Mate Gregor on 2017. 01. 26..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Converts to a shorter format
    /// - returns: The abbreviated string object
    public func abbreviate() -> String {
        let absValue = abs(self)
        let sign = self < 0 ? "-" : ""
        
        if absValue < 1000 {
            return "\(sign)\(absValue)"
        }
        
        let doubleValue = Double(absValue)
        let exp = Int(log10(doubleValue) / 3.0 )
        let units = ["k", "M", "G", "T", "P", "E"]
        let roundedValue = round(10 * doubleValue / pow(1000.0, Double(exp))) / 10
        
        return "\(sign)\(Int(roundedValue))\(units[exp-1])"
    }
    
    /// Converts to it's roman number format
    /// - returns: The roman number string object
    public func toRoman() -> String {
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var startingValue = self
        return romanValues.enumerated().reduce("", { (r, e) -> String in
            let arabicValue = arabicValues[e.offset]
            let romanChar = e.element
            let div = startingValue / arabicValue
            
            if div > 0 {
                startingValue -= arabicValue * div
                return (0..<div).reduce(r, { (c, _) -> String in
                    c + romanChar
                })
            }
            
            return r
        })
    }

}
