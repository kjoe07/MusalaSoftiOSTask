//
//  XCTestCase.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/24/21.
//

import XCTest

extension XCTestCase {
    func loadStubFromBundle(withName name: String, extension: String) ->  Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try! Data(contentsOf: url!)
    }
}
