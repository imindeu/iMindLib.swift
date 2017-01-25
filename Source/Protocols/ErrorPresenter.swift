//
//  ErrorPresenter.swift
//  iMind-Lib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

@objc protocol ErrorPresenter {
    func showError(level: String, message: String, onlyDebug: Bool) -> ()
    
    @objc optional func reportErrorToCrashlytics(error: Error) -> ()
}
