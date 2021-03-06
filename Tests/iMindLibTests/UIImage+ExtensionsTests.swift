//
//  UIImage+ExtensionsTests.swift
//  iMindLib
//
//  Created by David Frenkel on 27/02/2017.
//  Copyright © 2017 iMind. All rights reserved.
//
#if !os(macOS) && !os(Linux) && !os(watchOS)

import XCTest

@testable import iMindLib

class UIImageExtensionsTests: XCTestCase {
    
    func testSquareImage() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let testImage2 = UIImage(named: "testImageLandscape.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        
        let newSize = CGSize(width: 50, height: 50)
        let newImage = testImage?.squareImageToSize(newSize: newSize)
        let newImage2 = testImage2?.squareImageToSize(newSize: newSize)

        XCTAssertNotNil(newImage)
        XCTAssertEqual(newImage?.size.width, newSize.width)
        XCTAssertEqual(newImage?.size.height, newSize.height)
        XCTAssertNotNil(newImage2)
        XCTAssertEqual(newImage2?.size.width, newSize.width)
        XCTAssertEqual(newImage2?.size.height, newSize.height)

    }
    
    func testScale() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newSize = CGSize(width: 50, height: 50)
        let newImage = testImage?.scaleToImage(with: newSize)
        
        XCTAssertNotNil(newImage)
        XCTAssertEqual(newImage?.size.width, newSize.width)
        XCTAssertEqual(newImage?.size.height, newSize.height)
    }
    
    func testOrientation() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let testImage2 = UIImage(named: "testImageLandscape.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newImage = testImage?.correctlyOrientedImage()
        let newImage2 = testImage2?.correctlyOrientedImage()
        XCTAssertNotNil(newImage)
        XCTAssertNotNil(newImage2)
    }
    
    func testResize() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newHeight = CGFloat(50)
        let newImage = testImage?.resizeImage(to: newHeight)
        XCTAssertNotNil(newImage)
        XCTAssertEqual(newImage?.size.height, newHeight)
    }
    
    func testCenterCrop() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newSize = CGSize(width: 50, height: 50)
        let newImage = testImage?.centerCropToSize(target: newSize)
        
        XCTAssertNotNil(newImage)
        XCTAssertEqual(newImage?.size.width, newSize.width)
        XCTAssertEqual(newImage?.size.height, newSize.height)
    }
    
    func testTint() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newImage = testImage?.tintWithColor(color: UIColor.red)
        XCTAssertNotNil(newImage)
    }
    
    func testTranslucency() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newAlpha = CGFloat(integerLiteral: 10)
        let newImage = testImage?.setTranlucent(with: newAlpha)
        XCTAssertNotNil(newImage)
    }
}

#endif
