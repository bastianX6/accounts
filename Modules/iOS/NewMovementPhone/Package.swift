// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovementPhone",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "NewMovementPhone",
            targets: ["NewMovementPhone"]
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
            name: "NewMovementPhone",
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
            name: "NewMovementPhoneTests",
            dependencies: [
                "NewMovementPhone",
                "SnapshotTesting",
                .product(name: "PhoneTestUtils", package: "TestUtils"),
                .product(name: "Previews", package: "TestUtils"),
                .product(name: "TestUtils", package: "TestUtils"),
                .product(name: "NewMovementPreview", package: "NewMovement"),
            ]
        ),
        .testTarget(
            name: "NewMovementCommonPhoneTests",
            dependencies: [
                "NewMovementPhone",
                "SnapshotTesting",
                .product(name: "TestUtils", package: "TestUtils"),
                .product(name: "PhoneTestUtils", package: "TestUtils"),
                .product(name: "NewMovementPreview", package: "NewMovement"),
            ]
        ),
    ]
)
