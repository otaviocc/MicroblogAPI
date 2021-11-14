import Foundation

public struct CheckResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case count
        case checkSeconds = "check_seconds"
    }

    public let count: Int
    public let checkSeconds: Int
}
