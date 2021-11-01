import Foundation

public enum Media {
    case jpeg(Data?)
    case gif(Data?)
    case png(Data?)
    case other(Data?, fileExtension: String, mimeType: String)
}

extension Media {
    var data: Data? {
        switch self {
        case .jpeg(let data): return data
        case .gif(let data): return data
        case .png(let data): return data
        case .other(let data, _, _): return data
        }
    }

    var fileName: String {
        switch self {
        case .jpeg: return "file.jpg"
        case .gif: return "file.gif"
        case .png: return "file.png"
        case .other(_, let fileExtension, _): return "file.\(fileExtension)"
        }
    }

    var mimeType: String {
        switch self {
        case .jpeg: return "image/jpg"
        case .gif: return "image/gif"
        case .png: return "image/png"
        case .other(_, _, let mimeType): return mimeType
        }
    }
}
