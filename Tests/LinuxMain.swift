import XCTest
@testable import iMindLib
import Extensions
import Models

XCTMain([
     testCase(AtomicVariableTests.allTests),
     testCase(IntExtensionsTests.allTests),
     testCase(StringExtensionsTests.allTests)
])
