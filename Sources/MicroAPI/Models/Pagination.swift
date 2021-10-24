import MicroClient

protocol Paginating {
    var pagination: Pagination? { get set }
}

public struct Pagination {

    // MARK: - Properties

    private let since: String?
    private let after: String?
    private let count: Int?

    // MARK: - Life cycle

    public init(
        since: String? = nil,
        after: String? = nil,
        count: Int? = nil
    ) {
        self.since = since
        self.after = after
        self.count = count
    }
}

extension Pagination {
    var parameters: [String: String] {
        var pagination: [String: String] = [:]

        pagination["since_id"] = since
        pagination["after_id"] = after
        pagination["count"] = count.map(String.init)

        return pagination
    }
}
