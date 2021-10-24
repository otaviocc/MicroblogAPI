import Foundation

public struct DiscoveryResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case microblog = "_microblog"
        case items
    }

    public let microblog: DiscoveryResponse.Microblog
    public let items: [PostResponse]
}

extension DiscoveryResponse {

    public struct Microblog: Decodable {

        private enum CodingKeys: String, CodingKey {
            case about
            case tagmojis = "tagmoji"
        }

        public let about: String
        public let tagmojis: [Tagmoji]?
    }
}

extension DiscoveryResponse.Microblog {

    public struct Tagmoji: Decodable {

        private enum CodingKeys: String, CodingKey {
            case name
            case title
            case emoji
            case isFeatured = "is_featured"
        }

        public let name: String
        public let title: String
        public let emoji: String
        public let isFeatured: Bool
    }
}
