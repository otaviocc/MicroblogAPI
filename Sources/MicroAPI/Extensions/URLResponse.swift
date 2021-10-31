import Foundation

extension URLResponse {

    public var location: URL? {
        guard let httpResponse = self as? HTTPURLResponse,
              let location = httpResponse.value(forHTTPHeaderField: "Location"),
              let url = URL(string: location)
        else {
            return nil
        }

        return url
    }
}
