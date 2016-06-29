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

// MARK: Instance Methods
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

// MARK: Static methods
extension Client {
    public static func send(method: Method, uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: method, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func send(method: Method, uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: method, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public static func get(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .get, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func get(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .get, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public static func post(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .post, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func post(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .post, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public static func put(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .put, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func put(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .put, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public static func patch(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func patch(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .patch, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}

extension Client {
    public static func delete(_ uri: String, headers: Headers = [:], body: Data = [], middleware: Middleware...) throws -> Response {
        return try send(method: .delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }

    public static func delete(_ uri: String, headers: Headers = [:], body: DataConvertible, middleware: Middleware...) throws -> Response {
        return try send(method: .delete, uri: uri, headers: headers, body: body, middleware: middleware)
    }
}
