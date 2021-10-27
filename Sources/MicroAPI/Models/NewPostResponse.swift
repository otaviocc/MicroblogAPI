import Foundation

public struct NewPostResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "preview"
    }

    public let url: URL
    public let previewURL: URL
}
