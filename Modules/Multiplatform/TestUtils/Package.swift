// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TestUtils",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7),
    ],
    products: [
        .library(
            name: "TestUtils",
            targets: ["TestUtils"]),
        .library(
            name: "PhoneTestUtils",
            targets: ["PhoneTestUtils"]),
        .library(
            name: "MacTestUtils",
            targets: ["MacTestUtils"]),
        .library(
            name: "Previews",
            targets: ["Previews"]),
    ],
    dependencies: [
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
        .package(name: "DataManagement",
                 path: "../DataManagement"),
        .package(name: "DependencyResolver",
                 path: "../DependencyResolver"),
        .package(name: "MovementList",
                 path: "../MovementList"),
        .package(name: "SnapshotTesting",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.8.1"),
    ],
    targets: [
        .target(
            name: "Previews",
            dependencies: [
                "AccountsUI",
                "DataManagement",
                "DependencyResolver",
                "MovementList",
            ]),
        .target(
            name: "TestUtils",
            dependencies: [
                "AccountsUI",
                "DataManagement",
                "DependencyResolver",
                "MovementList",
                "Previews",
                "SnapshotTesting",
            ]),
        .target(
            name: "PhoneTestUtils",
            dependencies: [
                "SnapshotTesting",
            ]),
        .target(
            name: "MacTestUtils",
            dependencies: [
                "SnapshotTesting",
            ]),
    ])
