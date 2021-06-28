// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovementListMac",
    defaultLocalization: "es",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "MovementListMac",
            targets: ["MovementListMac"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 path: "../../Multiplatform/DataManagement"),
        .package(name: "AccountsUI",
                 path: "../../Multiplatform/AccountsUI"),
        .package(name: "DependencyResolver",
                 path: "../../Multiplatform/DependencyResolver"),
        .package(name: "MovementDetailsMac",
                 path: "../MovementDetailsMac"),
        .package(name: "MovementList",
                 path: "../../Multiplatform/MovementList"),
        .package(name: "TestUtils",
                 path: "../../Multiplatform/TestUtils"),
    ],
    targets: [
        .target(
            name: "MovementListMac",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementList",
                "MovementDetailsMac",
                "DependencyResolver",
                .product(name: "Previews", package: "TestUtils"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementListMacTests",
            dependencies: ["MovementListMac"]
        ),
    ]
)
