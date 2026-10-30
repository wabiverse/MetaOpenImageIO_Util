// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "MetaOpenImageIO_Util",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10),
  ],
  products: [
    .library(
      name: "OpenImageIO_Util",
      type: .dynamic,
      targets: ["OpenImageIO_Util"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/wabiverse/MetaOpenImageIO.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "OpenImageIO_Util",
      dependencies: [
        .product(name: "OpenImageIO", package: "MetaOpenImageIO"),
      ],
      exclude: [
        "nuke",
        "iv",
      ],
      publicHeadersPath: "include",
      cxxSettings: [
        .headerSearchPath("."),
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])),
      ]
    ),
  ],
  cLanguageStandard: .gnu17,
  cxxLanguageStandard: .cxx17
)
