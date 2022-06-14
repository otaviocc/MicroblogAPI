import Foundation
import MicroClient

public enum MicropubRequestFactory {

    /// Publish a new post.
    public static func makeNewPostRequest(
        title: String? = nil,
        content: String,
        category: [String]? = nil,
        photo: URL? = nil,
        photoDescription: String? = nil,
        isDraft: Bool = false
    ) -> NetworkRequest<VoidRequest, NewPostResponse> {
        .init(
            path: "/client/mQd1H2bppUvpaKFt/micropub",
            method: .post,
            formItems: [
                .init(name: "h", value: "entry"),
                .init(name: "name", value: title),
                .init(name: "content", value: content),
                .init(name: "post-status", value: isDraft ? "draft": nil),
                .init(name: "photo", value: photo?.absoluteString),
                .init(name: "mp-photo-alt", value: photoDescription),
            ].union(
                with: category?.map { .init(name: "category[]", value: $0) }
            )
        )
    }

    /// List of categories for the sign-in user.
    public static func makeCategoriesRequest(
    ) -> NetworkRequest<VoidRequest, CategoriesResponse> {
        .init(
            path: "/micropub",
            method: .get,
            queryItems: [
                .init(name: "q", value: "categories")
            ]
        )
    }

    /// Retrieve the configuration.
    public static func makeConfigurationRequest(
    ) -> NetworkRequest<VoidRequest, ConfigurationResponse> {
        .init(
            path: "/micropub",
            method: .get,
            queryItems: [
                .init(name: "q", value: "config")
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
