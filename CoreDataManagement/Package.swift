// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDataManagement",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7),
    ],
    products: [
        .library(
            name: "CoreDataManagement",
            targets: ["CoreDataManagement"]),
    ],
    dependencies: [
        .package(name: "DataManagement", path: "../DataManagement"),
        .package(url: "https://github.com/Alexander-Ignition/CombineCoreData", from: "0.0.3"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CoreDataManagement",
            dependencies: [
                "DataManagement",
                "CombineCoreData",
                .product(name: "Logging", package: "swift-log"),
            ]),
        .testTarget(
            name: "CoreDataManagementTests",
            dependencies: [
                "CoreDataManagement"
            ])
    ]
)
