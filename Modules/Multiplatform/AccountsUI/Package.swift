// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private var targets: [Target] = [
    .target(
        name: "AccountsUI",
        dependencies: []
    ),
]

#if os(iOS)
    targets.append(
        .testTarget(
            name: "AccountsUITests",
            dependencies: ["AccountsUI"]
        )
    )
#endif

let package = Package(
    name: "AccountsUI",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "AccountsUI",
            targets: ["AccountsUI"]
        ),
    ],
    dependencies: [],
    targets: targets
)
