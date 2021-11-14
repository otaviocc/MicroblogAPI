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
            parameters: [
                "id": id
            ].union(with: pagination?.parameters)
        )
    }

    /// Bookmarks for the signed-in user.
    public static func makeBookmarksRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/bookmarks",
            method: .get,
            parameters: pagination?.parameters
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
            parameters: [
                "since_id": id
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
            parameters: [
                "id": id
            ].union(with: pagination?.parameters)
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
            parameters: pagination?.parameters
        )
    }

    /// Mentions for the signed-in user.
    public static func makeMentionsRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/mentions",
            method: .get,
            parameters: pagination?.parameters
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
            parameters: pagination?.parameters
        )
    }

    // Photos-only timeline for the signed-in user.
    public static func makePhotosTimelineRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/photos",
            method: .get,
            parameters: pagination?.parameters
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
            parameters: pagination?.parameters
        )
    }

    /// Get replies posted by the signed-in user.
    public static func makeRepliesRequest(
        pagination: Pagination? = nil
    ) -> NetworkRequest<VoidRequest, PostsResponse> {
        .init(
            path: "/posts/replies",
            method: .get,
            parameters: pagination?.parameters
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
            parameters: [
                "id": id,
                "content": content
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
            parameters: pagination?.parameters
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
