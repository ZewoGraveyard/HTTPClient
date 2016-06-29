import XCTest
@testable import HTTPClient

class HTTPClientTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }

    func testInfersPort() throws {
        // should not throw error
        _ = try Client(uri: "http://httpbin.org")
    }

    func testGetClientInstance() throws {
        let client = try Client(uri: "http://httpbin.org")
        let response = try client.get("/")

        XCTAssert(response.status == .ok)
        XCTAssert(response.body.isBuffer)
        guard case let .buffer(buffer) = response.body else { return XCTFail() }
        XCTAssert(buffer.count > 1000)
    }

    func testGetStaticClient() throws {
        let response = try Client.get("http://httpbin.org/")

        print(response)
        XCTAssert(response.status == .ok)
        XCTAssert(response.body.isBuffer)
        guard case let .buffer(buffer) = response.body else { return XCTFail() }
        XCTAssert(buffer.count > 1000)
    }
}

extension HTTPClientTests {
    static var allTests : [(String, (HTTPClientTests) -> () throws -> Void)] {
        return [
           ("testReality", testReality),
           ("testInfersPort", testInfersPort),
           ("testGetClientInstance", testGetClientInstance),
           ("testGetStaticClient", testGetStaticClient)
        ]
    }
}
