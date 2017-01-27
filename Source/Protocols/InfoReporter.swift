//
//  File.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 01. 26..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

protocol InfoReporter {
    
    func reportInfo(level: LevelType, message: String)
}
