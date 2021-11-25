//
//  FakeService.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/24/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class FakeService: Services{
    func getData<T>(completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        //let data =  loadStubFromBundle(withName: "woeidResponse", extension: "json")
        
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "weoidResponse", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        
        let resultData = try! JSONDecoder().decode(T.self, from: data)
        completion(.success(resultData))
    }
}
