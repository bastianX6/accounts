// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovementMac",
    defaultLocalization: "es",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "NewMovementMac",
            targets: ["NewMovementMac"]
        ),
    ],
    dependencies: [
        .package(name: "AccountsUI",
                 path: "../../Multiplatform/AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../../Multiplatform/DependencyResolver"),
        .package(name: "DataManagement",
                 path: "../../Multiplatform/DataManagement"),
        .package(name: "NewMovement",
                 path: "../../Multiplatform/NewMovement"),
        .package(name: "TestUtils",
                 path: "../../Multiplatform/TestUtils"),
        .package(name: "SnapshotTesting",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.12.0"),

    ],
    targets: [
        .target(
            name: "NewMovementMac",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "DependencyResolver",
                "NewMovement",
                .product(name: "Previews", package: "TestUtils"),
                .product(name: "NewMovementPreview", package: "NewMovement"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovementMacTests",
            dependencies: [
                "NewMovementMac",
                "SnapshotTesting",
            ]
        ),
        .testTarget(
            name: "NewMovementCommonMacTests",
            dependencies: [
                "NewMovement",
                "SnapshotTesting",
                .product(name: "TestUtils", package: "TestUtils"),
                .product(name: "MacTestUtils", package: "TestUtils")
            ]
        ),
    ]
)
