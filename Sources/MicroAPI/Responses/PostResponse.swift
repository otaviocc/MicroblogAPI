import Foundation

public struct PostResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case content = "content_html"
        case contentText = "content_text"
        case url
        case datePublished = "date_published"
        case imageURL = "image"
        case author
        case microblog = "_microblog"
    }

    public let id: String
    public let content: String
    public let contentText: String?
    public let url: URL
    public let datePublished: String
    public let imageURL: URL?
    public let author: PostResponse.Author
    public let microblog: PostResponse.Microblog
}

extension PostResponse {

    public struct Author: Decodable {

        private enum CodingKeys: String, CodingKey {
            case name
            case url
            case avatarURL = "avatar"
            case microblog = "_microblog"
        }

        public let name: String
        public let url: URL?
        public let avatarURL: URL
        public let microblog: PostResponse.Author.Microblog

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

            self.microblog = try values.decode(
                PostResponse.Author.Microblog.self,
                forKey: .microblog
            )
        }
    }
}

extension PostResponse.Author {

    public struct Microblog: Decodable {

        public let username: String
    }
}

// MARK: - Microblog

extension PostResponse {

    public struct Microblog: Decodable {

        private enum CodingKeys: String, CodingKey {
            case dateRelative = "date_relative"
            case dateFavorited = "date_favorited"
            case links
            case isFavorite = "is_favorite"
            case isBookmark = "is_bookmark"
            case isDeletable = "is_deletable"
            case isConversation = "is_conversation"
            case thumbnailURL = "thumbnail_url"
        }

        public let dateRelative: String
        public let dateFavorited: String?
        public let links: [PostResponse.Microblog.Link]?
        public let isFavorite: Bool?
        public let isBookmark: Bool?
        public let isDeletable: Bool?
        public let isConversation: Bool?
        public let thumbnailURL: URL?
    }
}

// MARK: - Links

extension PostResponse.Microblog {

    public struct Link: Decodable {

        private enum CodingKeys: String, CodingKey {
            case id
            case url
            case archivedURL = "archived_url"
        }

        public let id: UInt64
        public let url: URL
        public let archivedURL: URL?
    }
}
