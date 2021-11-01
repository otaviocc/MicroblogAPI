import Foundation
import MicroClient

public enum MicropubRequestFactory {

    /// Publish a new post.
    public static func makeNewPostRequest(
        title: String? = nil,
        content: String,
        category: String? = nil,
        photo: URL? = nil,
        photoDescription: String? = nil,
        isDraft: Bool = false
    ) -> NetworkRequest<VoidRequest, NewPostResponse> {
        var parameters: [String: String] = [:]

        parameters["h"] = "entry"
        parameters["name"] = title
        parameters["content"] = content
        parameters["post-status"] = isDraft ? "draft": nil
        parameters["category"] = category
        parameters["photo"] = photo?.absoluteString
        parameters["mp-photo-alt"] = photoDescription

        return .init(
            path: "/micropub",
            method: .post,
            parameters: parameters
        )
    }

    /// List of categories for the sign-in user.
    public static func makeCategoriesRequest(
    ) -> NetworkRequest<VoidRequest, CategoriesResponse> {
        .init(
            path: "/micropub",
            method: .get,
            parameters: [
                "q": "categories"
            ]
        )
    }

    /// Retrieve the configuration.
    public static func makeConfigurationRequest(
    ) -> NetworkRequest<VoidRequest, ConfigurationResponse> {
        .init(
            path: "/micropub",
            method: .get,
            parameters: [
                "q": "config"
            ]
        )
    }

    /// Upload an image.
    public static func makeUploadRequest(
        media: Media
    ) -> NetworkRequest<Data, VoidResponse> {
        let boundary = "MicroClient-\(UUID().uuidString)"

        return .init(
            path: "/micropub/media",
            method: .post,
            body: Data(
                media: media,
                boundary: boundary
            ),
            additionalHeaders: [
                "Content-Type": "multipart/form-data; boundary=\(boundary)"
            ]
        )
    }
}
