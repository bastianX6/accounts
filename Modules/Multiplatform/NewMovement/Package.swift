// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
        .tvOS(.v13),
        .macOS(.v11),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NewMovement",
            targets: ["NewMovement"]
        ),
        .library(
            name: "NewMovementPreview",
            targets: ["NewMovementPreview"]
        ),
    ],
    dependencies: [
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../DependencyResolver"),
        .package(name: "TestUtils",
                 path: "../TestUtils"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/Quick/Quick.git",
                 .upToNextMajor(from: "3.0.0")),

    ],
    targets: [
        .target(
            name: "NewMovement",
            dependencies: [
                "AccountsUI",
                "DependencyResolver",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "NewMovementPreview",
            dependencies: [
                "NewMovement",
            ]
        ),
        .testTarget(
            name: "NewMovementTests",
            dependencies: [
                "NewMovement",
                "Quick",
                "Nimble",
                .product(name: "TestUtils", package: "TestUtils"),
                .product(name: "Previews", package: "TestUtils"),
            ]
        ),
    ]
)
