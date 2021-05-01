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
            name: "MovementListCommon",
            targets: ["MovementListCommon"]
        ),
        .library(
            name: "MovementList_iOS",
            targets: ["MovementList_iOS"]
        ),
        .library(
            name: "MovementDetails_iOS",
            targets: ["MovementDetails_iOS"]
        ),
        .library(
            name: "MovementDetailsMacOS",
            targets: ["MovementDetailsMacOS"]
        ),
        .library(
            name: "MovementListMacOS",
            targets: ["MovementListMacOS"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 path: "../DataManagement"),
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../DependencyResolver"),
        .package(name: "NewMovement",
                 path: "../NewMovement"),
    ],
    targets: [
        // MovementListCommon
        .target(
            name: "MovementListCommon",
            dependencies: [
                "DataManagement",
                "AccountsUI",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementListCommonTests",
            dependencies: ["MovementListCommon"]
        ),
        // MovementList_iOS
        .target(
            name: "MovementList_iOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementListCommon",
                "MovementDetails_iOS",
                "DependencyResolver",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementList.iOS.Tests",
            dependencies: ["MovementList_iOS"]
        ),
        // MovementDetails_iOS
        .target(
            name: "MovementDetails_iOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementListCommon",
                "DependencyResolver",
                .product(name: "NewMovement_iOS", package: "NewMovement")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementDetails.iOS.Tests",
            dependencies: ["MovementDetails_iOS"]
        ),
        // MovementDetailsMacOS
        .target(
            name: "MovementDetailsMacOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementListCommon",
                "DependencyResolver",
                .product(name: "NewMovementMacOS", package: "NewMovement")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementDetails.macOS.Tests",
            dependencies: ["MovementDetailsMacOS"]
        ),
        // MovementListMacOS
        .target(
            name: "MovementListMacOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementListCommon",
                "MovementDetailsMacOS",
                "DependencyResolver",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementList.macOS.Tests",
            dependencies: ["MovementListMacOS"]
        ),
    ]
)
