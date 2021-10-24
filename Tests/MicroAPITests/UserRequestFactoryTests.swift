import XCTest
import MicroAPI

final class UserRequestFactoryTests: XCTestCase {

    func testMakeCheckFollowingRequest() throws {
        let request = UserRequestFactory.makeCheckFollowingRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/is_following"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "username", value: "some_username")
                )
            )
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeDiscoverRequest() throws {
        let request = UserRequestFactory.makeDiscoverRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/discover/some_username"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertNil(request.queryItems)
        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }
}
