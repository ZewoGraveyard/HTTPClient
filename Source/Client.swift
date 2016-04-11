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

public struct Client: Responder {
    public let host: String
    public let port: Int
    public let connection: C7.Connection
    public let serializer: S4.RequestSerializer
    public let parser: S4.ResponseParser

    public init(host: String, port: Int, serializer: S4.RequestSerializer = RequestSerializer(), parser:S4.ResponseParser = ResponseParser()) throws {
        self.host = host
        self.port = port
        self.connection = try TCPConnection(to: URI(host: host, port: port))
        self.serializer = serializer
        self.parser = parser
    }
}

extension Client {
    private func addHeaders(request: Request) -> Request {
        var request = request
        request.host = "\(host):\(port)"
        request.userAgent = "Zewo"

        if request.connection == [] {
            request.connection = "close"
        }

        return request
    }

    public func respond(to request: Request) throws -> Response {
        let request = addHeaders(request)
        try self.connection.open(timingOut: .never)
        try serializer.serialize(request, to: connection)

        try connection.flush()

        while true {
            var data = Data()
            for chunk in StreamSequence(for: connection) {
                data.bytes.append(contentsOf: chunk.bytes)
            }
            if let response = try parser.parse(data)  {
                if let upgrade = request.upgrade {
                    try upgrade(response, connection)
                }

                return response
            }
        }
    }

    public func send(request: Request, middleware: Middleware...) throws -> Response {
        let request = addHeaders(request)
        return try middleware.chain(to: self).respond(to: request)
    }

    private func send(request: Request, middleware: [Middleware]) throws -> Response {
        let request = addHeaders(request)
        return try middleware.chain(to: self).respond(to: request)
    }
}

extension Client {
    public func sendMethod(method: Method, uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(method, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func sendMethod(method: Method, uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(method, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func get(uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(.get, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func get(uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(.get, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func post(uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(.post, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func post(uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(.post, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func put(uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(.put, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func put(uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(.put, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func patch(uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(.patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func patch(uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(.patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public func delete(uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try sendMethod(.delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public func delete(uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try sendMethod(.delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    private func sendMethod(method: Method, uri: String, headers: Headers = [:], body: Data = [], middleware: [Middleware]) throws -> Response {
        let request = try Request(method: method, uri: uri, headers: headers, body: body)
        return try send(request, middleware: middleware)
    }

    private func sendMethod(method: Method, uri: String, headers: Headers = [:], body: DataConvertible, middleware: [Middleware]) throws -> Response {
        let request = try Request(method: method, uri: uri, headers: headers, body: body)
        return try send(request, middleware: middleware)
    }
}
