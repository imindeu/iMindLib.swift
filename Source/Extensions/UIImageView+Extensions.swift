//
//  UIImageView+Extensions.swift
//  iMindLib
//
//  Created by David Frenkel on 13/02/2017.
//  Copyright © 2017 iMind. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /**
     Flashes the UIImageView by animating the alpha property with a 0.4 duration.
     - parameter startAlpha: A CGFLoat representing the start alpha. Default 1.0
     - parameter endAlpha: A CGFloat representing the end alpha of the animation. Default 0.0
     */
    func flashView(startAlpha: CGFloat = 1.0, endAlpha: CGFloat = 0.0) {
        self.alpha = startAlpha
        UIView.animate(withDuration: 0.4, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.alpha = endAlpha
        }) { _ in
            self.alpha = startAlpha
        }
    }
}
