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
        // Dependencies declare other packages that this package depends on.
        .package(name: "DataManagement",
                 path: "../DataManagement"),
        .package(name: "CoreDataManagement",
                 path: "../CoreDataManagement"),
        .package(name: "AccountsUI",
                 path: "../AccountsUI"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
