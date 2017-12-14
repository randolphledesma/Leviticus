// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "Leviticus",
  targets: [
    Target(name: "App"),
    Target(name: "Run", dependencies: ["App"]),
  ],
  dependencies: [
    .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
    .Package(url: "https://github.com/vapor/jwt-provider.git", majorVersion: 1)
  ],
  exclude: [
    "Config",
    "Database",
    "Localization",
    "Public",
    "Resources"
  ]
)
