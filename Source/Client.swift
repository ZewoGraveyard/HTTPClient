// Client.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@_exported import TCP
@_exported import HTTP
@_exported import HTTPParser
@_exported import HTTPSerializer

public final class Client: S4.Client {
    public let host: String
    public let port: Int
    public let serializer: S4.RequestSerializer
    public let parser: S4.ResponseParser
    public let keepAlive: Bool

    public var connection: C7.Connection?

    public init(connectingTo server: URI, serializer: S4.RequestSerializer = RequestSerializer(), parser: S4.ResponseParser = ResponseParser(), keepAlive: Bool) throws {
        guard let host = server.host else {
            throw TCPError.unknown(description: "Host was not defined in URI")
        }

        guard let port = server.port else {
            throw TCPError.unknown(description: "Port was not defined in URI")
        }
        self.host = host
        self.port = port
        self.serializer = serializer
        self.parser = parser
        self.keepAlive = keepAlive
    }

    public convenience init(connectingTo uri: URI) throws {
        try self.init(connectingTo: uri, keepAlive: true)
    }
}

extension Client {
    private func addHeaders(_ request: inout Request) {
        var request = request
        request.host = "\(host):\(port)"
        request.userAgent = "Zewo"

        if request.connection.isEmpty {
            request.connection = "close"
        }
    }

    public func respond(to request: Request) throws -> Response {
        var request = request
        addHeaders(&request)

        let stream: Stream = try connection ?? TCPConnection(to: host, on: port)

        try serializer.serialize(request, to: stream)

        while true {
            let data = try stream.receive(upTo: 1024)
            if let response = try parser.parse(data)  {

                if let upgrade = request.upgrade {
                    try upgrade(response, stream)
                }

                if !keepAlive {
                    connection = nil
                }

                return response
            }
        }
    }

    public func send(_ request: Request, middleware: Middleware...) throws -> Response {
        var request = request
        addHeaders(&request)
        return try middleware.chain(to: self).respond(to: request)
    }

    private func send(_ request: Request, middleware: [Middleware]) throws -> Response {
        var request = request
        addHeaders(&request)
        return try middleware.chain(to: self).respond(to: request)
    }
}

extension Client {
    public func send(method: Method, uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: method, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func send(method: Method, uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: method, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func get(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .get, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func get(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .get, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func post(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .post, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func post(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .post, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func put(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .put, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func put(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .put, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func patch(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func patch(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func delete(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func delete(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    private func send(method: Method, uri: String, headers: Headers = [:], body: Data = [], middleware: [Middleware]) throws -> Response {
        let request = try Request(method: method, uri: uri, headers: headers, body: body)
        return try send(request, middleware: middleware)
    }

    private func send(method: Method, uri: String, headers: Headers = [:], body: DataConvertible, middleware: [Middleware]) throws -> Response {
        let request = try Request(method: method, uri: uri, headers: headers, body: body)
        return try send(request, middleware: middleware)
    }
}



