# MicroAPI

**MicroAPI** is Swift Package to interact with [Micro.blog](https://micro.blog)'s endpoints. It has factory method to create a [MicroClient: µ network client](https://github.com/otaviocc/MicroClient) instance.

```swift
public protocol MicroAPIFactoryProtocol {
    func makeMicroAPIClient(
        authToken: @escaping () -> String?
    ) -> NetworkClientProtocol
}
```

The network client takes a single parameter: `authToken: @escaping () -> String?`, where the auth token is passed to the client and is dynamically evaluated when needed (useful in those case where the network client is initialized before the user is asked to provide the token).

```swift
let factory = MicroAPIFactory()

let client = factory.makeMicroAPIClient {
    "A_VALID_TOKEN_GOES_HERE"
}
```

Network requests are also built by factories, returning strongly-typed request objects:

```swift
// NetworkRequest<VoidRequest, DiscoveryResponse>
let mediaRequest = PostRequestFactory.makeDiscoverRequest()

// NetworkRequest<VoidRequest, PostsResponse>
let timelineRequest = PostRequestFactory.makeTimelineRequest()

// NetworkRequest<VoidRequest, PostsResponse>
let photosRequest = PostRequestFactory.makePhotosTimelineRequest(
    pagination: .since(id: "42")
)

// NetworkRequest<VoidRequest, PostsResponse>
let bookmarksRequest = PostRequestFactory.makeBookmarksRequest(
    pagination: .after(id: "42")
)

// NetworkRequest<Data, VoidResponse>
let mediaRequest = MicropubRequestFactory.makeUploadRequest(
    media: .jpeg(jpegData)
)
```

The network client takes a single parameter, the `request`, returning `NetworkResponse`

```swift
public protocol NetworkClientProtocol {
    func run<RequestModel, ResponseModel>(
        _ networkRequest: NetworkRequest<RequestModel, ResponseModel>
    ) async throws -> NetworkResponse<ResponseModel>
}
```

E.g.:

```swift
let request = MicropubRequestFactory.makeNewPostRequest(
    content: "This is the body",
    isDraft: true
)

let postResponse = try await client.run(request)
```
