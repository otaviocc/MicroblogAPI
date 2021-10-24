import Foundation

extension Dictionary {

    mutating func formUnion(
        with dictionary: [Key: Value]
    ) {
        for (key, value) in dictionary {
            updateValue(
                value,
                forKey: key
            )
        }
    }

    func union(
        with dictionary: [Key: Value]?
    ) -> [Key: Value] {
        var result = self

        if let dictionary = dictionary {
            result.formUnion(
                with: dictionary
            )
        }

        return result
    }
}
