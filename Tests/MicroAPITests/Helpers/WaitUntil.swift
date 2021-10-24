import XCTest

extension XCTestCase {

    func waitUntil(
        timeout: TimeInterval = 5.0,
        isInverted: Bool = false,
        fulfillmentCount: Int = 1,
        block: @escaping (@escaping () -> Void) -> Void
    ) {
        let expectation = expectation(
            description: "isInverted: \(isInverted), fulfillmentCount = \(fulfillmentCount)"
        )

        expectation.isInverted = isInverted
        expectation.expectedFulfillmentCount = fulfillmentCount

        block(expectation.fulfill)

        wait(for: [expectation], timeout: timeout)
    }
}
