import XCTest
@testable import RIDBInterface

final class RIDBInterfaceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RIDBInterface().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
