import Foundation
import MicroClient

public protocol MicroAPIFactoryProtocol {

    func makeMicroAPIClient(
        authToken: @escaping () -> String?
    ) -> NetworkClientProtocol
}

public struct MicroAPIFactory: MicroAPIFactoryProtocol {

    // MARK: - Life cycle

    public init() {}

    // MARK: - Public

    public func makeMicroAPIClient(
        authToken: @escaping () -> String?
    ) -> NetworkClientProtocol {
        let configuration = MicroAPIFactory.makeAPIConfiguration()

        configuration.interceptor = { request in
            var updatedRequest = request
            if let token = authToken() {
                updatedRequest.setValue(
                    "Bearer \(token)",
                    forHTTPHeaderField: "Authorization"
                )
            }
            return updatedRequest
        }

        return NetworkClient(
            configuration: configuration
        )
    }

    // MARK: - Private

    private static func makeAPIConfiguration(
    ) -> NetworkConfiguration {
        .init(
            session: .shared,
            defaultDecoder: JSONDecoder(),
            defaultEncoder: JSONEncoder(),
            scheme: "https",
            hostname: "micropub.rocks"
        )
    }
}
