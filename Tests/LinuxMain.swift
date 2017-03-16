import XCTest
@testable import ExtensionsTests
@testable import ModelsTests

XCTMain([
     testCase(AtomicVariableTests.allTests),
     testCase(IntExtensionsTests.allTests),
     testCase(StringExtensionsTests.allTests)
])
