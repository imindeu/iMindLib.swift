//
//  UIViewController+Extensions.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

#if !os(macOS) && !os(Linux) && !os(watchOS)

import UIKit

extension UIViewController {
    
    // MARK: Presenting and reporting messages
    
    /// Presents the level and the message in a custom presenter or in a UIAlertViewController as default
    /// - parameter level: The level of the info.
    /// The value can be a LevelType which appears as a string like e.g. "Error" or "Warning"
    /// - parameter messsage: The main content of the message. The value can be a custom string.
    func showInfo(level: LevelType, message: String, onlyDebug: Bool = false, shouldReport: Bool = true) {
        
        #if DEBUG
            let debugActive = true
        #else
            let debugActive = false
        #endif
        
        if !onlyDebug || (onlyDebug && debugActive) {
            if let infoPresenter = self as? InfoPresenter {
                infoPresenter.presentInfo(level: level, message: message)
            } else {
                let alertController = UIAlertController(title: level.rawValue.localized,
                                                        message: message,
                                                        preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "OK".localized,
                                                  style: .cancel,
                                                  handler: nil)
                alertController.addAction(dismissAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        if shouldReport {
            if let reporter = self as? InfoReporter {
                reporter.reportInfo(level: level, message: message)
            }
        }
    }
}

#endif
