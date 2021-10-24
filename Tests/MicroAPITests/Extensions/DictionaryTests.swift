import XCTest
@testable import MicroAPI

final class DictionaryTests: XCTestCase {

    func testFormUnion() {
        var dictionary = [
            "um": 1,
            "dois": 2,
            "tres": 3
        ]

        dictionary.formUnion(
            with: [
                "quatro": 4,
                "cinco": 5
            ]
        )

        XCTAssertEqual(
            dictionary,
            [
                "um": 1,
                "dois": 2,
                "tres": 3,
                "quatro": 4,
                "cinco": 5
            ]
        )
    }

    func testUnion() throws {
        let dictionary = [
            "um": 1,
            "dois": 2,
            "tres": 3
        ]

        let result = dictionary.union(
            with: [
                "quatro": 4,
                "cinco": 5
            ]
        )

        XCTAssertEqual(
            result,
            [
                "um": 1,
                "dois": 2,
                "tres": 3,
                "quatro": 4,
                "cinco": 5
            ]
        )
    }
}
