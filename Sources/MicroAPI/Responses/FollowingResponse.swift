import Foundation

public struct FollowingResponse: Decodable {

    public let users: [FollowingResponse.User]

    public init(
        from decoder: Decoder
    ) throws {
        let container = try decoder.singleValueContainer()
        self.users = try container.decode(
            [FollowingResponse.User].self
        )
    }
}

extension FollowingResponse {

    public struct User: Decodable {

        private enum CodingKeys: String, CodingKey {
            case name
            case url
            case avatarURL = "avatar"
            case isFollowing = "is_following"
            case isYou = "is_you"
        }

        public let name: String
        public let url: URL?
        public let avatarURL: URL
        public let isFollowing: Bool
        public let isYou: Bool

        public init(
            from decoder: Decoder
        ) throws {
            let values = try decoder.container(
                keyedBy: CodingKeys.self
            )

            self.name = try values.decode(
                String.self,
                forKey: .name
            )

            self.url = try? values.decode(
                URL.self,
                forKey: .url
            )

            self.avatarURL = try values.decode(
                URL.self,
                forKey: .avatarURL
            )

            self.isFollowing = try values.decode(
                Bool.self,
                forKey: .isFollowing
            )

            self.isYou = try values.decode(
                Bool.self,
                forKey: .isYou
            )
        }
    }
}
