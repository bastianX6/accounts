// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovementList",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "MovementList",
            targets: ["MovementList"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 path: "../DataManagement"),
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../DependencyResolver"),
    ],
    targets: [
        // MovementListCommon
        .target(
            name: "MovementList",
            dependencies: [
                "DataManagement",
                "AccountsUI",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementListTests",
            dependencies: ["MovementList"]
        ),
    ]
)
