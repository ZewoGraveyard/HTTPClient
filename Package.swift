import PackageDescription

let package = Package(
    name: "HTTPClient",
    dependencies: [
        .Package(url: "https://github.com/Zewo/TCP.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/Zewo/HTTP.git", majorVersion: 0, minor: 4),
    ]
)
