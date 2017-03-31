//
//  InfoReporterTests.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 03. 16..
//  Copyright © 2017. iMind. All rights reserved.
//

#if !os(macOS) && !os(Linux) && !os(watchOS)
    
import XCTest
@testable import iMindLib
    
class DummyInfoReporter: InfoReporter {
        
    var attributes: [String:String] = [:]
    
    func reportInfo(level: LevelType, message: String) {
        attributes["level"] = level.rawValue
        attributes["message"] = message
        
        print("Level: \(attributes["level"]) \nMessage: \(attributes["message"])")
    }
}
    
class InfoReporterTests: XCTestCase {

    func testReportInfo() {
        let reporter = DummyInfoReporter()
        reporter.reportInfo(level: .error, message: "This is a test error")
        
        XCTAssertEqual(reporter.attributes["level"], "ERROR")
        XCTAssertEqual(reporter.attributes["message"], "This is a test error")
    }
}

#endif
