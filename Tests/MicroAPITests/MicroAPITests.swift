import Combine
import XCTest
import MicroAPI
import MicroClient

final class MicroAPITests: XCTestCase {

    var disposeBag: Set<AnyCancellable> = []

    func testNetNetworkClient() throws {
        let client = MicroAPIFactory().makeMicroAPIClient {
            "REDACTED"
        }

        waitUntil { done in
            client
                .run(PostRequestFactory.makeTimelineRequest())
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { model in
                        print(model.value)
                        done()
                    }
                )
                .store(in: &self.disposeBag)
        }
    }
}
