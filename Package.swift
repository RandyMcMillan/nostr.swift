// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nostr.swift",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "nostr.swift",
            targets: ["nostr.swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream.git", branch: "df8d82047f6654d8e4b655d1b1525c64e1059d21"),
        .package(url: "https://github.com/jb55/secp256k1.swift.git", branch: "40b4b38b3b1c83f7088c76189a742870e0ca06a9"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "nostr.swift",
            dependencies: [
                .product(name: "secp256k1", package: "secp256k1.swift"),
                .product(name: "Starscream", package: "Starscream"),
            ]),
        .testTarget(
            name: "nostr.swiftTests",
            dependencies: ["nostr.swift"]),
    ]
)
