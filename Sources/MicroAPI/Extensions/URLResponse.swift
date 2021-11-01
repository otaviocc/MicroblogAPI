import Foundation

extension URLResponse {

    public var location: URL? {
        (self as? HTTPURLResponse)?
            .value(forHTTPHeaderField: "Location")
            .flatMap(URL.init(string:))
    }
}
