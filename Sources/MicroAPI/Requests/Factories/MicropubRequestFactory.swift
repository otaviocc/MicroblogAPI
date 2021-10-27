import Foundation
import MicroClient

public enum MicropubRequestFactory {

    /// Publish a new post.
    public static func makeNewPostRequest(
        title: String? = nil,
        content: String,
        category: String? = nil,
        isDraft: Bool = false
    ) -> NetworkRequest<VoidRequest, NewPostResponse> {
        var parameters: [String: String] = [:]

        parameters["h"] = "entry"
        parameters["name"] = title
        parameters["content"] = content
        parameters["post-status"] = isDraft ? "draft": nil
        parameters["category"] = category

        return .init(
            path: "/micropub",
            method: .post,
            parameters: parameters
        )
    }

    /// List of categories for the sign-in user
    public static func makeCategoriesRequest(
    ) -> NetworkRequest<VoidRequest, CategoriesResponse> {
        .init(
            path: "/micropub",
            method: .get
            ,
            parameters: [
                "q": "categories"
            ]
        )
    }

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
}
