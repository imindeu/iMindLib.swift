//
//  UIViewController+ExtensionsTest.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//
#if !os(macOS) && !os(Linux) && !os(watchOS)

import XCTest
@testable import iMindLib

class DummyErrorPresenter: InfoPresenter {
    
    var attributes: [String:String] = [:]
    
    func presentInfo(level: LevelType, message: String) {
        attributes["level"] = level.rawValue
        attributes["message"] = message
        
        print("Level: \(attributes["level"]) \nMessage: \(attributes["message"])")
    }
}

class DummyInfoReporter: InfoReporter {
    
    var attributes: [String:String] = [:]
    
    func reportInfo(level: LevelType, message: String) {
        attributes["level"] = level.rawValue
        attributes["message"] = message
        
        print("Level: \(attributes["level"]) \nMessage: \(attributes["message"])")
    }
}

class UIViewControllerExtensionsTest: XCTestCase {
 
    func testPresentInfo() {
        let presenter = DummyErrorPresenter()
        presenter.presentInfo(level: .error, message: "This is a test error")
        
        XCTAssertEqual(presenter.attributes["level"], "Error")
        XCTAssertEqual(presenter.attributes["message"], "This is a test error")
        
    }
    
    func testReportInfo() {
        let reporter = DummyInfoReporter()
        reporter.reportInfo(level: .error, message: "This is a test error")
        
        XCTAssertEqual(reporter.attributes["level"], "Error")
        XCTAssertEqual(reporter.attributes["message"], "This is a test error")
    }
}

#endif
