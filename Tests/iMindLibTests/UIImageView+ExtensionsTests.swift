//
//  UIImageView+ExtensionsTests.swift
//  iMindLib
//
//  Created by David Frenkel on 28/02/2017.
//  Copyright © 2017 iMind. All rights reserved.
//
#if !os(macOS) && !os(Linux) && !os(watchOS)

import XCTest

@testable import iMindLib

class UIImageViewExtensionsTests: XCTestCase {
    
    func testFlash() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let imageView = UIImageView(image: testImage)
        imageView.flashView()
        XCTAssertTrue(imageView.alpha <= 1 || imageView.alpha >= 0)
    }
    
    func testCircleShape() {
        let defaultView = UIImageView()
        let customView = UIImageView()
    
        defaultView.circleShape()
        customView.circleShape(bordered: false, borderColor: UIColor.red)
        
        XCTAssertEqual(defaultView.layer.borderWidth, 2.5)
        XCTAssertEqual(defaultView.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(customView.layer.borderWidth, 0.0)
        XCTAssertEqual(customView.layer.borderColor, UIColor.red.cgColor)
    }
    
}

#endif
