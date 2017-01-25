//
//  UIViewController+ExtensionsTest.swift
//  iMind-Lib
//
//  Created by Rezessy Miklós on 2017. 01. 24..
//  Copyright © 2017. iMind. All rights reserved.
//

import XCTest
@testable import iMindLib

class DummyErrorPresenter: ErrorPresenter {
    
    var errorInfo: [String:String] = [:]
    
    func showError(level: String, message: String, onlyDebug: Bool = false) {
        errorInfo["level"] = level
        errorInfo["message"] = message
        
        print("Level: \(errorInfo["level"]) \nMessage: \(errorInfo["message"])")
    }
}

class UIViewControllerExtensionsTest: XCTestCase {
 
    func testShowError() {
        let presenter = DummyErrorPresenter()
        presenter.showError(level: "Error", message: "This is a test error")
        
        XCTAssertEqual(presenter.errorInfo["level"], "Error")
        XCTAssertEqual(presenter.errorInfo["message"], "This is a test error")
        
    }
}
