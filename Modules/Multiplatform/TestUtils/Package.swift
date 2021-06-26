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
            name: "PhoneTestUtils",
            targets: ["PhoneTestUtils"]),
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
        .package(name: "NewMovement",
                 path: "../NewMovement"),
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
                "NewMovement",
            ]),
        .target(
            name: "PhoneTestUtils",
            dependencies: [
                "SnapshotTesting",
            ]),
    ])
