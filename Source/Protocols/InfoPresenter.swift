//
//  ErrorPresenter.swift
//  iMind-Lib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

protocol InfoPresenter {
    
    func presentInfo(level: LevelType, message: String) -> ()    
}

enum LevelType: String {
    case error = "Error"
    case warning = "Warning"
    case info = "Info"
    case debug = "Debug"
    case alert = "Alert"
}

