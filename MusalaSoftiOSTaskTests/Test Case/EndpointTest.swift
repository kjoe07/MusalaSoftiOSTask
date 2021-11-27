//
//  EndpointTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/26/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class EndpointTest: XCTestCase {
    var endpoint: Endpoint!
    
    override func setUpWithError() throws {
        endpoint = LocationEndpoint(path: "/api/location/(woeid)/", queryItems: nil, method: .get)
    }

    override func tearDownWithError() throws {
        endpoint = nil
    }
    
    func testValidURL(){
        XCTAssertNotNil(endpoint.url)
    }

    func testInvalidURL(){
        let endpoint = LocationEndpoint(path: "api/location/(woeid)/", queryItems: nil, method: .get)
        XCTAssertNil(endpoint.url)
    }
    
    func testIsValidURlRequest(){
        XCTAssertNoThrow(try endpoint.urlRequest())
    }
    
}
