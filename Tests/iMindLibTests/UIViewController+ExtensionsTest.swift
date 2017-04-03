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

extension UIViewController: InfoPresenter {
    public func presentInfo(level: LevelType, message: String) {
        self.title = "Level: \(level.rawValue.localized) Message: \(message)"
    }
}

extension UIViewController: InfoReporter {
    public func reportInfo(level: LevelType, message: String) {
        self.title = "Level: \(level.rawValue.localized) Message: \(message)"
    }
}

class UIViewControllerExtensionsTest: XCTestCase {
 
    func testPresentInfo() {
        let vc = UIViewController()
        vc.showInfo(level: .error, message: "This is an error message.")
        XCTAssertEqual(vc.title, "Level: ERROR Message: This is an error message.")
    }
    
    func testReportInfo() {
        let vc = UIViewController()
        vc.reportInfo(level: .warning, message: "This is a warning message.")
        XCTAssertEqual(vc.title, "Level: WARNING Message: This is a warning message.")
    }
}

#endif
