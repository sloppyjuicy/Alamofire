//
//  AsyncTests.swift
//
//  Copyright (c) 2021 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if canImport(_Concurrency)

import Alamofire
import XCTest

@available(macOS 12, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
final class AsyncTests: BaseTestCase {
    func testAsyncHandle() async {
        // Given, When
        let response = await AF.request(.get).asyncResponse(decoding: TestResponse.self).handle.get()

        // Then
        XCTAssertNotNil(response.value)
    }

    func testAsyncResponse() async {
        // Given, When
        let response = await AF.request(.get).asyncResponse(decoding: TestResponse.self).response

        // Then
        XCTAssertNotNil(response.value)
    }

    func testAsyncResponseValue() async throws {
        // Given, When
        let value = try await AF.request(.get).asyncResponse(decoding: TestResponse.self).value

        // Then
        XCTAssertEqual(value.url, "http://127.0.0.1:8080/get")
    }
}

#endif
