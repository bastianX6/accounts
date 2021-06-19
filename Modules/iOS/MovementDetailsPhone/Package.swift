// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovementDetailsPhone",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "MovementDetailsPhone",
            targets: ["MovementDetailsPhone"]
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
        .package(name: "NewMovementPhone",
                 path: "../NewMovementPhone"),
    ],
    targets: [
        .target(
            name: "MovementDetailsPhone",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementList",
                "DependencyResolver",
                "NewMovementPhone",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementDetailsPhoneTests",
            dependencies: ["MovementDetailsPhone"]
        ),
    ]
)
