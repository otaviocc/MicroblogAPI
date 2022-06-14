import Foundation
import MicroClient

public struct Pagination: Equatable {

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

    public static func since(id: String) -> Pagination {
        .init(since: id)
    }

    public static func after(id: String) -> Pagination {
        .init(after: id)
    }

    public static func count(_ count: Int) -> Pagination {
        .init(count: count)
    }
}

extension Pagination {

    func queryItems() ->  [URLQueryItem] {
        [
            .init(name: "since_id", value: since),
            .init(name: "after_id", value: after),
            .init(name: "count", value: count.map(String.init)),
        ]
    }
}
