//
//  String+Extensions.swift
//  Quideo
//
//  Created by Rezessy Miklós on 2016. 05. 10..
//  Copyright © 2016. iMind. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(
                pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}" +
                    "[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
                options: .caseInsensitive
            )
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
        return self.trim().characters.count >= 6
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
