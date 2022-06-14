import Foundation

extension Array {

    func union(
        with array: Self?
    ) -> Self {
        self + (array ?? [])
    }
}
