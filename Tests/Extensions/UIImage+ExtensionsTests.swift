//
//  UIImage+ExtensionsTests.swift
//  iMindLib
//
//  Created by David Frenkel on 27/02/2017.
//  Copyright © 2017 iMind. All rights reserved.
//

import XCTest

@testable import iMindLib

class UIImageExtensionsTests: XCTestCase {
    
    func testSquareImage() {
        let testImage = UIImage(named: "testImage.jpg", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let newSize = CGSize(width: 50, height: 50)
        let newImage = testImage?.squareImageToSize(newSize: newSize)
        
        XCTAssertNotNil(newImage)
        XCTAssertEqual(newImage?.size.width, newSize.width)
        XCTAssertEqual(newImage?.size.height, newSize.height)
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
        let newImage = testImage?.correctlyOrientedImage()
        XCTAssertNotNil(newImage)
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
}
