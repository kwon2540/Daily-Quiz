// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DailyQuiz",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "EntryKit", targets: ["EntryKit"]),
        .library(name: "AppUI", targets: ["AppUI"]),
        .library(name: "RootFeature", targets: ["RootFeature"]),
        .library(name: "LaunchFeature", targets: ["LaunchFeature"]),
        .library(name: "LoginFeature", targets: ["LoginFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.62.2"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", exact: "6.6.2"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.23.1"),
    ],
    targets: [
        .target(
            name: "EntryKit",
            dependencies: [
                "RootFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .target(
            name: "AppUI",
            dependencies: [
            ],
            path: "Sources/AppUI",
            resources: [
                .process("Resources"),
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins"),
            ]
        ),
        .target(
            name: "RootFeature",
            dependencies: [
                "LaunchFeature",
                "LoginFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .target(
            name: "LaunchFeature",
            dependencies: [
                "AppUI",
                "LoginFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .target(
            name: "LoginFeature",
            dependencies: [
                "AppUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
    ]
)
