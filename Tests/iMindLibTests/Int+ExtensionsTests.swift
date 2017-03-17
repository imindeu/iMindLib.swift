//
//  Int+ExtensionsTest.swift
//  iMindLib
//
//  Created by Mate Gregor on 2017. 01. 26..
//  Copyright © 2017. iMind. All rights reserved.
//

import XCTest

@testable import iMindLib

class IntExtensionsTests: XCTestCase {
    
    func testAbbreviate() {
        XCTAssertEqual(0.abbreviate(), "0")
        XCTAssertEqual(10.abbreviate(), "10")
        XCTAssertEqual(999.abbreviate(), "999")
        XCTAssertEqual(1000.abbreviate(), "1k")
        XCTAssertEqual(1001.abbreviate(), "1k")
        XCTAssertEqual(1900.abbreviate(), "1k")
        XCTAssertEqual(1999.abbreviate(), "2k")
        XCTAssertEqual(10000.abbreviate(), "10k")
        XCTAssertEqual(1100000.abbreviate(), "1M")
        XCTAssertEqual(1999999.abbreviate(), "2M")
    }
    
    func testToRoman() {
        XCTAssertEqual(0.toRoman(), "")
        XCTAssertEqual(5.toRoman(), "V")
        XCTAssertEqual(6.toRoman(), "VI")
        XCTAssertEqual(10.toRoman(), "X")
        XCTAssertEqual(14.toRoman(), "XIV")
        XCTAssertEqual(36.toRoman(), "XXXVI")
        XCTAssertEqual(1995.toRoman(), "MCMXCV")
    }
    
}
