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
        .package(name: "SnapshotTesting",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.8.1"),
        .package(name: "SnapshotTesting-Nimble",
                 url: "https://github.com/bastianX6/swift-snapshot-testing-nimble.git",
                 from: "0.3.0"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/Quick/Quick.git",
                 .upToNextMajor(from: "3.0.0")),

    ],
    targets: [
        .target(
            name: "NewMovementMac",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "DependencyResolver",
                "NewMovement",
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
                "Quick",
                "Nimble",
                "SnapshotTesting",
                "SnapshotTesting-Nimble",
            ]
        ),
    ]
)
