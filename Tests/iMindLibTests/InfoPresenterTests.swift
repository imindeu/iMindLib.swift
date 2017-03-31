//
//  InfoPresenterTests.swift
//  iMindLib
//
//  Created by Rezessy Miklós on 2017. 03. 16..
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

class InfoPresenterTests: XCTestCase {
    
    func testPresentInfo() {
        let presenter = DummyErrorPresenter()
        presenter.presentInfo(level: .error, message: "This is a test error")
        
        XCTAssertEqual(presenter.attributes["level"], "ERROR")
        XCTAssertEqual(presenter.attributes["message"], "This is a test error")
        
    }
}

#endif
