//
//  AtomicVariableTests.swift
//  iMindLib
//
//  Created by Peter Kovacs on 2017. 03. 08..
//  Copyright © 2017. iMind. All rights reserved.
//

import XCTest

@testable import iMindLib

class AtomicVariableTests: XCTestCase {
    
    func testSimple() {
        let variable = AtomicVariable(1)
        XCTAssertEqual(variable.value, 1)
        variable.atomically({ $0 += 1 })
        XCTAssertEqual(variable.value, 2)
    }
    
    func testMultipleAccess() {
        let expectation = self.expectation(description: "exp")
        let variable = AtomicVariable(1)
        XCTAssertEqual(variable.value, 1)
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            variable.atomically({ value in
                sleep(1)
                value = 3
                sleep(2)
                XCTAssertEqual(value, 3)
            })
        }
        queue.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(1)) {
            XCTAssertEqual(variable.value, 3)
            variable.atomically({ $0 = 4 })
            XCTAssertEqual(variable.value, 4)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}

extension AtomicVariableTests {
    static var allTests: [(String, (AtomicVariableTests) -> () throws -> Void)] {
        return [
            ("testSimple", testSimple),
            ("testMultipleAccess", testMultipleAccess)
        ]
    }

}
