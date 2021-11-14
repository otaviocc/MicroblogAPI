import Foundation

public struct ConfigurationResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case mediaEndpoint = "media-endpoint"
    }

    public let mediaEndpoint: URL
}
