import Foundation

public struct PostsResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case microblog = "_microblog"
        case author
        case items
    }

    public let microblog: PostsResponse.Microblog
    public let author: PostsResponse.Author?
    public let items: [PostResponse]
}

extension PostsResponse {

    public struct Author: Decodable {

        private enum CodingKeys: String, CodingKey {
            case name
            case url
            case avatarURL = "avatar"
        }

        public let name: String
        public let url: URL
        public let avatarURL: URL
    }
}

extension PostsResponse {

    public struct Microblog: Decodable {

        private enum CodingKeys: String, CodingKey {
            case about
            case id
            case username
            case bio
            case isFollowing = "is_following"
            case isYou = "is_you"
            case followingCount = "following_count"
            case discoverCount = "discover_count"
        }

        public let about: String
        public let id: String?
        public let username: String?
        public let bio: String?
        public let isFollowing: Bool?
        public let isYou: Bool?
        public let followingCount: Int?
        public let discoverCount: Int?
    }
}
