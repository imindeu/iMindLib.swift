//
//  RawRepresentable+Extensions.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 03. 03..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

extension RawRepresentable where RawValue == String {
    var localizedName: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
