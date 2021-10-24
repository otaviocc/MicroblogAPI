import XCTest
import MicroAPI

final class PostRequestFactoryTests: XCTestCase {

    func testMakeBookmarkRequest() throws {
        let request = PostRequestFactory.makeBookmarkRequest(
            id: "some_id",
            pagination: .init(since: "123")
        )

        XCTAssertEqual(
            request.path, "/posts/bookmarks"
        )

        XCTAssertEqual(
            request.method,
            .post
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "id", value: "some_id")
                )
            )
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "since_id", value: "123")
                )
            )
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeBookmarksRequest() {
        let request = PostRequestFactory.makeBookmarksRequest(
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/bookmarks"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeCheckPostsRequest() {
        let request = PostRequestFactory.makeCheckPostsRequest(
            id: "some_id"
        )

        XCTAssertEqual(
            request.path, "/posts/check"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "since_id", value: "some_id"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeConversationRequest() {
        let request = PostRequestFactory.makeConversationRequest(
            id: "some_id",
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/conversation"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "id", value: "some_id")
                )
            )
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "count", value: "10")
                )
            )
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeDeletePostRequest() {
        let request = PostRequestFactory.makeDeletePostRequest(
            id: "some_id"
        )

        XCTAssertEqual(
            request.path, "/posts/some_id"
        )

        XCTAssertEqual(
            request.method,
            .delete
        )

        XCTAssertNil(request.queryItems)
        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeDiscoverCollectionRequest() {
        let request = PostRequestFactory.makeDiscoverCollectionRequest(
            collection: "some_collection"
        )

        XCTAssertEqual(
            request.path, "/posts/discover/some_collection"
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

    func testMakeDiscoverRequest() {
        let request = PostRequestFactory.makeDiscoverRequest()

        XCTAssertEqual(
            request.path, "/posts/discover"
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

    func testMakeMediaTimelineRequest() {
        let request = PostRequestFactory.makeMediaTimelineRequest()

        XCTAssertEqual(
            request.path, "/posts/media"
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

    func testMakeMentionsRequest() {
        let request = PostRequestFactory.makeMentionsRequest(
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/mentions"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakePhotosRequest() {
        let request = PostRequestFactory.makePhotosRequest(
            username: "some_username",
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/some_username/photos"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakePhotosTimelineRequest() {
        let request = PostRequestFactory.makePhotosTimelineRequest(
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/photos"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakePostsRequest() {
        let request = PostRequestFactory.makePostsRequest(
            username: "some_username",
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/some_username"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeRepliesRequest() {
        let request = PostRequestFactory.makeRepliesRequest(
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/replies"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeReplyRequest() {
        let request = PostRequestFactory.makeReplyRequest(
            id: "some_id",
            content: "some_content"
        )

        XCTAssertEqual(
            request.path, "/posts/reply"
        )

        XCTAssertEqual(
            request.method,
            .post
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "id", value: "some_id")
                )
            )
        )

        XCTAssertTrue(
            try XCTUnwrap(
                request.queryItems?.contains(
                    URLQueryItem(name: "content", value: "some_content")
                )
            )
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeTimelineRequest() {
        let request = PostRequestFactory.makeTimelineRequest(
            pagination: .init(count: 10)
        )

        XCTAssertEqual(
            request.path, "/posts/all"
        )

        XCTAssertEqual(
            request.method,
            .get
        )

        XCTAssertEqual(
            request.queryItems,
            [
                URLQueryItem(name: "count", value: "10"),
            ]
        )

        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }

    func testMakeUnbookmarkRequest() {
        let request = PostRequestFactory.makeUnbookmarkRequest(
            id: "some_id"
        )

        XCTAssertEqual(
            request.path, "/posts/bookmarks/some_id"
        )

        XCTAssertEqual(
            request.method,
            .delete
        )

        XCTAssertNil(request.queryItems)
        XCTAssertNil(request.body)
        XCTAssertNil(request.decoder)
        XCTAssertNil(request.encoder)
    }
}
