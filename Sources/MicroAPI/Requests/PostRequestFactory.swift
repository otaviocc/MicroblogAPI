import Foundation
import MicroClient

public enum PostRequestFactory {

    /// Bookmark a post.
    public static func makeBookmarkRequest(
        id: String,
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/posts/bookmarks",
            method: .post,
            queryItems: [
                .init(name: "id", value: id)
            ].union(with: pagination?.queryItems())
        )
    }

    /// Bookmarks for the signed-in user.
    public static func makeBookmarksRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/bookmarks",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Check whether there are new posts in the timeline. The response also
    /// includes a suggestion for the number of seconds to wait before
    /// polling again.
    public static func makeCheckPostsRequest(
        id: String
    ) -> NetworkRequest<VoidRequest, CheckResponse> {
        .init(
            path: "/posts/check",
            method: .get,
            queryItems: [
                .init(name: "since_id", value: id)
            ]
        )
    }

    /// Thread for a reply.
    public static func makeConversationRequest(
        id: String,
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/conversation",
            method: .get,
            queryItems: [
                .init(name: "id", value: id)
            ].union(with: pagination?.queryItems())
        )
    }

    /// Delete one of the signed-in user posts or replies.
    public static func makeDeletePostRequest(
        id: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/posts/\(id)",
            method: .delete
        )
    }

    /// Emoji collections, e.g. “books” and “music”.
    public static func makeDiscoverCollectionRequest(
        collection: String
    ) -> NetworkRequest<VoidRequest, DiscoveryResponse> {
        .init(
            path: "/posts/discover/\(collection)",
            method: .get
        )
    }

    /// Featured posts.
    public static func makeDiscoverRequest(
    ) -> NetworkRequest<VoidRequest, DiscoveryResponse> {
        .init(
            path: "/posts/discover",
            method: .get
        )
    }

    // Photos + videos timeline for the signed-in user.
    public static func makeMediaTimelineRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/media",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Mentions for the signed-in user.
    public static func makeMentionsRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/mentions",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Posts for photos from a user, including thumbnail URLs.
    public static func makePhotosRequest(
        username: String,
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/\(username)/photos",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    // Photos-only timeline for the signed-in user.
    public static func makePhotosTimelineRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/photos",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Posts written by the given user.
    public static func makePostsRequest(
        username: String,
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/\(username)",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Get replies posted by the signed-in user.
    public static func makeRepliesRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/replies",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Post a reply.
    public static func makeReplyRequest(
        id: String,
        content: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/posts/reply",
            method: .post,
            queryItems: [
                .init(name: "id", value: id),
                .init(name: "content", value: content)
            ]
        )
    }

    /// Timeline for the signed-in user.
    public static func makeTimelineRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/all",
            method: .get,
            queryItems: pagination?.queryItems()
        )
    }

    /// Unbookmark a post.
    public static func makeUnbookmarkRequest(
        id: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/posts/bookmarks/\(id)",
            method: .delete
        )
    }
}
