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
        
        guard absValue >= 1000 else {
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
        var number = self
        
        guard number > 0 else {
            return ""
        }

        let values = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
                      ("C",100), ("XC", 90), ("L",50), ("XL",40),
                      ("X",10), ("IX", 9), ("V",5),("IV",4), ("I",1)]
        
        return values.reduce("", { (result, value) -> String in
            let count = number / value.1
            
            if count != 0 {
                return result + (1...count).reduce("", { (res, _) -> String in
                    number -= value.1
                    return res + value.0
                })
            }
            
            return result
        })
    }
}
