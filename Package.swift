// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlatMany",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "FlatMany",
            targets: ["FlatMany"]),
    ],
    targets: [
        .target(
            name: "FlatMany",
            dependencies: []),
        .testTarget(
            name: "FlatManyTests",
            dependencies: ["FlatMany"]),
    ]
)
