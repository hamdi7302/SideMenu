// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SideMenuPackage",
    platforms: [
        .iOS(.v16) // Specify the minimum iOS version you support
    ],
    products: [
        .library(
            name: "SideMenuPackage",
            targets: ["SideMenuPackage"]),
    ],
    targets: [
        .target(
            name: "SideMenuPackage",
            dependencies: []),
        .testTarget(
            name: "SideMenuPackageTests",
            dependencies: ["SideMenuPackage"]),
    ]
)
