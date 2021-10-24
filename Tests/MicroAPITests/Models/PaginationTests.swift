import XCTest
@testable import MicroAPI

final class PaginationTests: XCTestCase {

    func testSince() {
        let since = Pagination(since: "123")

        XCTAssertEqual(since, .init(since: "123", after: nil, count: nil))
        XCTAssertEqual(since, .since(id: "123"))
        XCTAssertEqual(since.parameters, ["since_id": "123"])
    }

    func testAfter() {
        let after = Pagination(after: "456")

        XCTAssertEqual(after, .init(since: nil, after: "456", count: nil))
        XCTAssertEqual(after, .after(id: "456"))
        XCTAssertEqual(after.parameters, ["after_id": "456"])
    }

    func testCount() {
        let count = Pagination(count: 42)

        XCTAssertEqual(count, .init(since: nil, after: nil, count: 42))
        XCTAssertEqual(count, .count(42))
        XCTAssertEqual(count.parameters, ["count": "42"])
    }

    func testAll() throws {
        let pagination = Pagination(since: "123", after: "456", count: 42)

        XCTAssertEqual(
            pagination.parameters,
            [
                "since_id": "123",
                "after_id": "456",
                "count": "42"
            ]
        )
    }
}
