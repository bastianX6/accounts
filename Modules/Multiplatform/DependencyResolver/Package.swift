// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DependencyResolver",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "DependencyResolver",
            targets: ["DependencyResolver"]),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 path: "../DataManagement"),
        .package(name: "CoreDataManagement",
                 path: "../CoreDataManagement"),
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
    ],
    targets: [
        .target(
            name: "DependencyResolver",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "CoreDataManagement",
            ]),
        .testTarget(
            name: "DependencyResolverTests",
            dependencies: ["DependencyResolver"]),
    ]
)
