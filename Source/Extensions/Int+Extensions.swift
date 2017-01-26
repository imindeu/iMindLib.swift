//
//  Int+Extensions.swift
//  iMind-Lib
//
//  Created by Mate Gregor on 2017. 01. 26..
//  Copyright © 2017. iMind. All rights reserved.
//

#if !os(macOS) && !os(Linux)

import Foundation

public extension Int {
    
    /**
        Converts to a shorter format
        - returns: The abbreviated string object
     */
    public func abbreviate() -> String {
        var doubleValue = Double(self)
        let sign = ((doubleValue < 0) ? "-" : "" )
        
        doubleValue = fabs(doubleValue)
        
        if (doubleValue < 1000.0){
            return "\(sign)\(self)"
        }
        
        let exp = Int(log10(doubleValue) / 3.0 )
        let units = ["k","M","G","T","P","E"]
        let roundedValue = round(10 * doubleValue / pow(1000.0, Double(exp))) / 10
        
        return "\(sign)\(Int(roundedValue))\(units[exp-1])"
    }
    
    /**
        Converts to it's roman number format
        - returns: The roman number string object
     */
    public func toRoman() -> String {
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerated() {
            let arabicValue = arabicValues[index]
            let div = startingValue / arabicValue
            
            if (div > 0) {
                for _ in 0..<div {
                    romanValue += romanChar
                }
                startingValue -= arabicValue * div
            }
        }
        
        return romanValue
    }
    
}

#endif
