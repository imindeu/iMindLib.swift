//
//  String+Extensions.swift
//  Quideo
//
//  Created by Rezessy Miklós on 2016. 05. 10..
//  Copyright © 2016. iMind. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
        return self.trim().characters.count >= 6
    }
    
    func attributedStringForTags(_ fontName:String, fontSize:CGFloat, fontColor:UIColor) -> NSMutableAttributedString {
        var mutableString = NSMutableAttributedString()
        mutableString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName:UIFont(name: fontName, size: fontSize)!])
        
        let words = self.components(separatedBy: " ")
        for word in words {
            if word.hasPrefix("#") {
                let range = (self as NSString).range(of: word)
                mutableString.addAttribute(NSForegroundColorAttributeName, value: fontColor, range: range)
            }
        }
        
        return mutableString
    }
    
    func htmlFormattedString() -> NSMutableAttributedString? {
        if let htmlData = "<span style='font-family: Montserrat-Regular; color: rgba(0,0,0,0.78); font-size: 14'>\(self)</span>".data(using: .utf8, allowLossyConversion: true) {
            do {
                return try NSMutableAttributedString(data: htmlData, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch let e as NSError {
                print("Couldn't translate \(self): \(e.localizedDescription)")
            }
        }
        return nil
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }

}
