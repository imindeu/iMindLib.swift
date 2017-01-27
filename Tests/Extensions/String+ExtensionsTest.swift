//
//  iMindLibTests.swift
//  iMindLibTests
//
//  Created by Révész Ádám on 2017. 01. 12..
//  Copyright © 2017. iMind. All rights reserved.
//
#if !os(macOS) && !os(Linux)

import XCTest
@testable import iMindLib

class StringExtensionsTest: XCTestCase {
    
    func testPasswordValidator() {
        XCTAssertFalse("asdf".isValidPassword(), "Passwords under 6 chars long are meant to be invalid.")
        XCTAssert("asdfgh".isValidPassword(), "Passwords at least 6 chars long are meant to be valid.")
    }
    
    func testEmailValidator() {
        XCTAssertFalse("asfd".isValidEmail())
        XCTAssertTrue("asdf@localhost".isValidEmail())
        XCTAssertTrue("asdf+fdas@localhost".isValidEmail())
        XCTAssertFalse("asdf+fdas@localhost.".isValidEmail())
        XCTAssertTrue("asdf+fda@local.host.org".isValidEmail())
        XCTAssertTrue("asdf+fda@local.host.co.uk".isValidEmail())
        XCTAssertTrue("asdf12@localhost".isValidEmail())
        XCTAssertTrue("asdf21+fdas4@localhost".isValidEmail())
        XCTAssertTrue("asdf+fda@local.host.org".isValidEmail())
        XCTAssertTrue("asdf+fda@127.0.0.1".isValidEmail())
    }
    
}

#endif
