import Foundation
import MicroClient

public enum UserRequestFactory {

    /// Check if the signed-in user follows the given user.
    public static func makeCheckFollowingRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, FollowResponse> {
        .init(
            path: "/users/is_following",
            method: .get,
            parameters: ["username": username]
        )
    }

    /// List of users username is following that signed-in user isn’t.
    public static func makeDiscoverRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, FollowingResponse> {
        .init(
            path: "/users/discover/\(username)",
            method: .get
        )
    }

    /// List of users username is following.
    public static func makeFollowingRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, FollowingResponse> {
        .init(
            path: "/users/following/\(username)",
            method: .get
        )
    }

    /// Follow user.
    public static func makeFollowRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/users/follow",
            method: .post,
            parameters: [
                "username": username
            ]
        )
    }

    /// Mute user so you don’t see their posts.
    public static func makeMuteRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, FollowResponse> {
        .init(
            path: "/users/mute",
            method: .post,
            parameters: [
                "username": username
            ]
        )
    }

    /// Report user for violating community guidelines.
    public static func makeReportRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/users/report",
            method: .post,
            parameters: [
                "username": username
            ]
        )
    }

    /// Unfollow user.
    public static func makeUnfollowRequest(
        username: String
    ) -> NetworkRequest<VoidRequest, VoidResponse> {
        .init(
            path: "/users/unfollow",
            method: .post,
            parameters: [
                "username": username
            ]
        )
    }
}
