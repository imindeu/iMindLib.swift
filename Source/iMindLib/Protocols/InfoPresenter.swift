//
//  ErrorPresenter.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

protocol InfoPresenter {
    
    /**
     Presenting information for the user with level and message parts
     - parameter level: The level of the info.
     The value can be a LevelType which appears as a string like e.g. "Error" or "Warning"
     - parameter messsage: The main content of the message. The value can be a custom string.
     */
    
    func presentInfo(level: LevelType, message: String)
}

enum LevelType: String {
    case error = "ERROR"
    case warning = "WARNING"
    case info = "INFO"
    case debug = "DEBUG"
    case alert = "ALERT"
}
