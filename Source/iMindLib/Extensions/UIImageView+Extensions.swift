//
//  UIImageView+Extensions.swift
//  iMindLib
//
//  Created by David Frenkel on 13/02/2017.
//  Copyright © 2017 iMind. All rights reserved.
//

#if !os(macOS) && !os(Linux) && !os(watchOS)

import Foundation
import UIKit

extension UIImageView {
    
    /// Flashes the UIImageView by animating the alpha property with a 0.4 duration.
    /// - parameter startAlpha: A CGFLoat representing the start alpha. Default 1.0
    /// - parameter endAlpha: A CGFloat representing the end alpha of the animation. Default 0.0
    func flashView(startAlpha: CGFloat = 1.0, endAlpha: CGFloat = 0.0) {
        self.alpha = startAlpha
        UIView.animate(withDuration: 0.4, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.alpha = endAlpha
        })
    }
    
    /// Makes the UIImageView a circular shape. A border, border width and border color can be set
    /// - parameter bordered: A Bool to set if the UIImageView should have a border. Default true.
    /// - parameter borderWidh: A CGFloat that the border width should be, if bordered parameter is true. Default: 2.5.
    /// - parameter borderColor: A UIColor object that the border color should be. Default is white.
    func circleShape(bordered: Bool = true, borderWidth: CGFloat = 2.5, borderColor: UIColor = .white) {
        self.contentMode = .scaleAspectFill
        self.layer.borderWidth = bordered ? borderWidth : 0.0
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

}

#endif
