//
//  String+Extensions.swift
//  iMindLib
//

import Foundation

extension String {

    ///Returns a localized version of the string
    ///If no localized version was found in the main bundle, it uses the ResourcesBundle to find a translation
    var localized: String {
        var defaultLocalized: String  = ""
        if let bundlePath = Bundle.main.path(forResource: "ResourcesBundle", ofType: "bundle"),
            let bundle = Bundle(path: bundlePath) {
            defaultLocalized = bundle.localizedString(forKey: self, value: "", table: nil)
        }
        return Bundle.main.localizedString(forKey: self,
                                           value: defaultLocalized != "" ? defaultLocalized : self,
                                           table: nil)
    }
    
    /// Validates e-mail
    /// - returns: bool - result of the validation
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
    
    /// Returns a new sting with leading and trailing spaces removed from the original.
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Returns a new sting with the capitalized first letters of the first two contained words.
    /// (Reserves order)
    func monogram() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .whitespacesAndNewlines)
            .flatMap({ word -> Character? in return word.characters.first })
            .prefix(2)
            .flatMap({ char -> String in return "\(char)".uppercased() })
            .joined()
    }
}
