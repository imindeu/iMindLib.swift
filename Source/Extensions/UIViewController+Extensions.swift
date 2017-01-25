//
//  UIViewController+Extensions.swift
//  iMind-Lib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

import UIKit

extension UIViewController: ErrorPresenter {
    
    func showError(level: String, message: String, onlyDebug: Bool = false) {
        
        #if DEBUG
            let debugActive = true
        #else
            let debugActive = false
        #endif
        
        if !onlyDebug || (onlyDebug && debugActive) {
            let alertController = UIAlertController(title: level, message: message, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(dismissAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
