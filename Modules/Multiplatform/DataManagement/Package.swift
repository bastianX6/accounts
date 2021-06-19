// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataManagement",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "DataManagement",
            targets: ["DataManagement"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DataManagement",
            dependencies: []
        )
    ]
)
