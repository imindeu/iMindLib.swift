import XCTest
@testable import ExtensionsTests
@testable import ModelsTests

extension AtomicVariableTests {
    static var allTests: [(String, (AtomicVariableTests) -> () throws -> Void)] {
        return [
            ("testSimple", testSimple),
            ("testMultipleAccess", testMultipleAccess)
        ]
    }
}

extension IntExtensionsTests {
    
    static var allTests: [(String, (IntExtensionsTests) -> () throws -> Void)] {
        return [
            ("testAbbreviate", testAbbreviate),
            ("testToRoman", testToRoman)
        ]
    }
}

extension StringExtensionsTests {
    static var allTests: [(String, (StringExtensionsTests) -> () throws -> Void)] {
        return [
            ("testPasswordValidator", testPasswordValidator),
            ("testEmailValidator", testEmailValidator)
        ]
    }
    
}

XCTMain([
     testCase(AtomicVariableTests.allTests),
     testCase(IntExtensionsTests.allTests),
     testCase(StringExtensionsTests.allTests)
])
