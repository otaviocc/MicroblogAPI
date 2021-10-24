// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MicroAPI",
    platforms: [
        .macOS(.v11), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "MicroAPI",
            targets: ["MicroAPI"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/otaviocc/MicroClient.git",
            from: "0.0.1"
        )
    ],
    targets: [
        .target(
            name: "MicroAPI",
            dependencies: ["MicroClient"]
        ),
        .testTarget(
            name: "MicroAPITests",
            dependencies: ["MicroAPI"]
        )
    ]
)
