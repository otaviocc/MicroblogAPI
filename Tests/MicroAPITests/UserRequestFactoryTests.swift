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

    func testMakeFollowingRequest() throws {
        let request = UserRequestFactory.makeFollowingRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/following/some_username"
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

    func testMakeFollowRequest() throws {
        let request = UserRequestFactory.makeFollowRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/follow"
        )

        XCTAssertEqual(
            request.method,
            .post
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

    func testMakeMuteRequest() throws {
        let request = UserRequestFactory.makeMuteRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/mute"
        )

        XCTAssertEqual(
            request.method,
            .post
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

    func testMakeReportRequest() throws {
        let request = UserRequestFactory.makeReportRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/report"
        )

        XCTAssertEqual(
            request.method,
            .post
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

    func testMakeUnfollowRequest() throws {
        let request = UserRequestFactory.makeUnfollowRequest(
            username: "some_username"
        )

        XCTAssertEqual(
            request.path, "/users/unfollow"
        )

        XCTAssertEqual(
            request.method,
            .post
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
}
