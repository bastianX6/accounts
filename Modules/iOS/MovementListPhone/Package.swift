// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovementListPhone",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "MovementListPhone",
            targets: ["MovementListPhone"]
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
        .package(name: "MovementDetailsPhone",
                 path: "../MovementDetailsPhone"),
        .package(name: "TestUtils",
                 path: "../../Multiplatform/TestUtils"),
    ],
    targets: [
        .target(
            name: "MovementListPhone",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "MovementList",
                "MovementDetailsPhone",
                "DependencyResolver",
                .product(name: "Previews", package: "TestUtils"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MovementListPhoneTests",
            dependencies: ["MovementListPhone"]
        ),
    ]
)
