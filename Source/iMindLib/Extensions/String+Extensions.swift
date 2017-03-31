//
//  String+Extensions.swift
//  iMindLib
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        do {
            // swiftlint:disable legacy_constructor
            let regex = try NSRegularExpression(
                pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}" +
                "[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
                options: .caseInsensitive
            )
            let range = NSMakeRange(0, self.characters.count)
            // swiftlint:enable legacy_constructor
            return regex.firstMatch(in: self,
                                    options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                    range: range) != nil
        } catch {
            return false
        }
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func monogram() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .whitespacesAndNewlines)
            .flatMap({ word -> Character? in return word.characters.first })
            .prefix(2)
            .flatMap({ char -> String in return "\(char)".uppercased() })
            .joined()
    }
}
