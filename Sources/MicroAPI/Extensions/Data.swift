import Foundation

extension Data {

    init?(media: Media, boundary: String) {
        guard let mediaData = media.data else { return nil }

        self.init()

        append("--\(boundary)\r\n")
        append("Content-Disposition: form-data; name=\"file\"; filename=\"\(media.fileName)\"\r\n")
        append("Content-Type: \(media.mimeType)\r\n\r\n")
        append(mediaData)
        append("\r\n")
        append("--\(boundary)--\r\n")
    }

    mutating func append(_ string: String?) {
        guard let data = string?.data(using: .utf8) else { return }

        append(data)
    }
}
