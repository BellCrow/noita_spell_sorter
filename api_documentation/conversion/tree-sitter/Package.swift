// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterNoitaLuaDoc",
    products: [
        .library(name: "TreeSitterNoitaLuaDoc", targets: ["TreeSitterNoitaLuaDoc"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterNoitaLuaDoc",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterNoitaLuaDocTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterNoitaLuaDoc",
            ],
            path: "bindings/swift/TreeSitterNoitaLuaDocTests"
        )
    ],
    cLanguageStandard: .c11
)
