// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoinGecko-Swift",
    products: [
        .library(
            name: "CoinGecko-Swift",
            targets: ["CoinGecko-Swift"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "CoinGecko-Swift",
            dependencies: []),
        .testTarget(
            name: "CoinGecko-SwiftTests",
            dependencies: ["CoinGecko-Swift"]),
    ]
)
