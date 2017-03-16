//
//  File.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 01. 26..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

protocol InfoReporter {
    
    /**
     Reporting information for external reporting systems (e.g. Crashlytics) with level and message parts
     - parameter level: The level of the info.
     The value can be a LevelType which appears as a string like e.g. "Error" or "Warning"
     - parameter messsage: The main content of the message. The value can be a custom string.
     */
    
    func reportInfo(level: LevelType, message: String)
}
