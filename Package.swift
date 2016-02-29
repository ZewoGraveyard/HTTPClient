import PackageDescription

let package = Package(
    name: "HTTPClient",
    dependencies: [
        .Package(url: "https://github.com/Zewo/TCP.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/Zewo/HTTP.git", majorVersion: 0, minor: 3),
        .Package(url: "https://github.com/Zewo/CLibvenice.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/Zewo/CURIParser.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/Zewo/CHTTPParser.git", majorVersion: 0, minor: 2)
    ]
)
