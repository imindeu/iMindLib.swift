//
//  Color+ExtensionsTest.swift
//  iMind-Lib
//
//  Created by Peter Kovacs on 2017. 01. 13..
//  Copyright © 2017. iMind. All rights reserved.
//

import XCTest

@testable import iMindLib

class ColorExtensionsTest: XCTestCase {
    
    func testRedComponent() {
        XCTAssertEqual(UIColor.red.redComponent, 255)
        XCTAssertEqual(UIColor.green.redComponent, 0)
        XCTAssertEqual(UIColor(red: 144, green: 0, blue: 0, transparency: 1).redComponent, 144)
        XCTAssertEqual(UIColor(red: -144, green: 0, blue: 0, transparency: 1).redComponent, 0)
        XCTAssertEqual(UIColor(red: 300, green: 0, blue: 0, transparency: 1).redComponent, 255)
    }
    
    func testGreenComponent() {
        XCTAssertEqual(UIColor.red.greenComponent, 0)
        XCTAssertEqual(UIColor.green.greenComponent, 255)
        XCTAssertEqual(UIColor(red: 0, green: 144, blue: 0, transparency: 1).greenComponent, 144)
        XCTAssertEqual(UIColor(red: 0, green: -144, blue: 0, transparency: 1).greenComponent, 0)
        XCTAssertEqual(UIColor(red: 0, green: 300, blue: 0, transparency: 1).greenComponent, 255)
    }
    
    func testBlueComponent() {
        XCTAssertEqual(UIColor.red.blueComponent, 0)
        XCTAssertEqual(UIColor.blue.blueComponent, 255)
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 144, transparency: 1).blueComponent, 144)
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: -144, transparency: 1).blueComponent, 0)
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 300, transparency: 1).blueComponent, 255)
    }
    
    func testAlphaCopmonent() {
        XCTAssertEqual(UIColor.red.alphaComponent, 1)
        XCTAssertEqual(UIColor(white: 0.5, alpha: 0.5).alphaComponent, 0.5)
        XCTAssertEqual(UIColor.clear.alphaComponent, 0)
    }
    
    func testIntInit() {
        XCTAssertEqual(UIColor(red: 255, green: 0, blue: 0), UIColor.red)
        XCTAssertEqual(UIColor(red: 255, green: 255, blue: 255), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0), UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(red: 144, green: 49, blue: 35, transparency: 0.21), UIColor(red: 144/255, green: 49/255, blue: 35/255, alpha: 0.21))
    }

    func testHex() {
        XCTAssertEqual(UIColor(hex: 0xFF0000), UIColor.red)
        XCTAssertEqual(UIColor(hex: 0xFFFFFF), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hex: 0x000000), UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hex: 0xDECEB5, alpha: 0.42), UIColor(red: 222/255, green: 206/255, blue: 181/255, alpha: 0.42))
    }
    
    func testHexString() {
        XCTAssertEqual(UIColor(hexString: "#FF0000"), UIColor.red)
        XCTAssertEqual(UIColor(hexString: "FFFFFF"), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#000000"), UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#DECEB5", alpha: 0.99), UIColor(red: 222/255, green: 206/255, blue: 181/255, alpha: 0.99))
    }
    
    func testDarker() {
        XCTAssertTrue(UIColor(hue: 0.2, saturation: 0.5, brightness: 0.3, alpha: 1.0).darker(than: UIColor(hue: 0.2, saturation: 0.5, brightness: 0.5, alpha: 1.0)))
    }
    
    func testLighter() {
        XCTAssertTrue(UIColor(hue: 0.2, saturation: 0.5, brightness: 0.5, alpha: 1.0).lighter(than: UIColor(hue: 0.2, saturation: 0.5, brightness: 0.3, alpha: 1.0)))
    }
    
    func testDarken() {
        XCTAssertTrue(UIColor.red.darken(33).darker(than: UIColor.red))
    }
    
    func testLighten() {
        XCTAssertTrue(UIColor.red.lighten(33).lighter(than: UIColor.red))
    }
}
