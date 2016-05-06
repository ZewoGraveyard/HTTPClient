import PackageDescription

let package = Package(
    name: "HTTPClient",
    dependencies: [
        .Package(url: "https://github.com/tomohisa/TCP.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/tomohisa/HTTPParser.git", majorVersion: 0, minor: 7),
        .Package(url: "https://github.com/tomohisa/HTTPSerializer.git", majorVersion: 0, minor: 7),
    ]
)
