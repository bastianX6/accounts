// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovementDetailsMac",
    defaultLocalization: "es",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "MovementDetailsMac",
            targets: ["MovementDetailsMac"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 path: "../../Multiplatform/DataManagement"),
        .package(name: "AccountsUI",
                 path: "../../Multiplatform/AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../../Multiplatform/DependencyResolver"),
        .package(name: "MovementList",
                 path: "../../Multiplatform/MovementList"),
        .package(name: "NewMovementMac",
                 path: "../NewMovementMac"),
        .package(name: "TestUtils",
                 path: "../../Multiplatform/TestUtils"),
    ],
    targets: [
        .target(
            name: "MovementDetailsMac",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementList",
                "DependencyResolver",
                "NewMovementMac",
                .product(name: "Previews", package: "TestUtils"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementDetailsMacTests",
            dependencies: ["MovementDetailsMac"]
        ),
    ]
)
