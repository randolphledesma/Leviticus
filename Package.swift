// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "Leviticus",
  dependencies: [
    .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
    .Package(url: "https://github.com/vapor/jwt-provider.git", majorVersion: 1)
  ]
)
