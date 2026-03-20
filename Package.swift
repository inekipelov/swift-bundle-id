// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-bundle-id",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "BundleID",
            targets: ["BundleID"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0")
    ],
    targets: [
        .target(
            name: "BundleID",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged")
            ]
        ),
        .testTarget(
            name: "BundleIDTests",
            dependencies: ["BundleID"],
            resources: [
                .copy("Fixtures/BundleIDFixture.bundle")
            ]
        )
    ]
)
