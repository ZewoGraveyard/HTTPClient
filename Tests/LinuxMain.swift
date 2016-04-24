#if os(Linux)

import XCTest
@testable import HTTPClientTestSuite

XCTMain([
    testCase(HTTPClientTests.allTests)
])

#endif
