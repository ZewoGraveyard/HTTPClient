import XCTest
import HTTPClient

class ServerTests: XCTestCase {
    func testServer() {
        do {
            let client = try Client(connectingTo: "http://google.com:80")
            let response = try client.get("/")
            print(response)
        } catch {
            XCTFail("\(error)")
        }
    }
}
