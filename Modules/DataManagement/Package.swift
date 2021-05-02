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
        // Products define the executables and libraries a package produces, and make them visible to other packages.
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
