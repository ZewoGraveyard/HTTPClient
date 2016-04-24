import XCTest
@testable import HTTPClient

class HTTPClientTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }
}

extension HTTPClientTests {
    static var allTests : [(String, HTTPClientTests -> () throws -> Void)] {
        return [
           ("testReality", testReality),
        ]
    }
}
