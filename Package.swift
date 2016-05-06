import PackageDescription

let package = Package(
    name: "HTTPClient",
    dependencies: [
        .Package(url: "https://github.com/tomohisa/TCP.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/Zewo/HTTPParser.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/Zewo/HTTPSerializer.git", majorVersion: 0, minor: 5),
    ]
)
