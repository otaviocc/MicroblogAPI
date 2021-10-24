import Foundation

public struct FollowResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case isFollowing = "is_following"
        case isYou = "is_you"
    }

    public let isFollowing: Int
    public let isYou: Int
}
