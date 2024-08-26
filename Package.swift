// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

//import PackageDescription
//
//let package = Package(
//    name: "SideMenuPackage",
//    products: [
//        // Products define the executables and libraries a package produces, making them visible to other packages.
//        .library(
//            name: "SideMenuPackage",
//            targets: ["SideMenuPackage"]),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package, defining a module or a test suite.
//        // Targets can depend on other targets in this package and products from dependencies.
//        .target(
//            name: "SideMenuPackage"),
//        .testTarget(
//            name: "SideMenuPackageTests",
//            dependencies: ["SideMenuPackage"]),
//    ]
//)
//

// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SideMenuPackage",
    platforms: [
        .iOS(.v15) // Specify the minimum iOS version you support
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
